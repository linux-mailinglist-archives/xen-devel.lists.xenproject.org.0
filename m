Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04E5EDA40
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 12:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413238.656767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odUSz-0003FT-20; Wed, 28 Sep 2022 10:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413238.656767; Wed, 28 Sep 2022 10:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odUSy-0003Cp-VO; Wed, 28 Sep 2022 10:39:00 +0000
Received: by outflank-mailman (input) for mailman id 413238;
 Wed, 28 Sep 2022 10:38:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odUSw-0003Cj-H2
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 10:38:58 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20082.outbound.protection.outlook.com [40.107.2.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c008100c-3f19-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 12:38:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8266.eurprd04.prod.outlook.com (2603:10a6:10:248::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 10:38:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 10:38:53 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c008100c-3f19-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUN+Zgtq/ERr9TJk+YGNrhLZszNGewLN7GwWmuUp8L9WwUDQN9rjSQALJe0aEUu4P53ZTxUmh35jCTUPiheW25GDpbLR90nxvHg/VKl8EzuiRiyy8u5EgSO+WhYZpuD3okhjuKG4T0McPfoUfyRTLPBBMQYsiCsBNhHg/KCxBTfsP3UPa6EgPkdX5NlX6K23twTCtkFW+nHkFt98wRG6ZwPpfBSwUBi/Xy+Q5kbf53g32GTn0HSub4Pdn2SVSPHs/Vl2Xu0zko9m1E3jQge5/ToRKX/k0wNPxIZZwljbWz38u7Ckgu6AAPpWqduEjFl4Pg2oMQrXgkFbwfpXJnnpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfWMOan+uoAcjsejIGu8nn0qvygWqJEXOw6ZleEbVkA=;
 b=JzWLYoRfhP+CBr6rWfgs3jp7Qma56Py4t2/p4YAHrIk0/7cjY+5yHYUXv0y3A9G0NeUcxeW95xeOUaqoez2IzsGwdPE46y9Sc+A/2UfF/NEsYzZJSVZkBweiQB5hBDn2/ESUbMqmoyMJJ+aeJwUINy9eXsaQU48WU1t3xaHOFM6FQNxMC/5jRajfzN3o9HV/YHWf+Mw9kxfpBgKWM4wEFttf8aUKyKPJBGJCG4N/HwJ3lYHBvZ9rPBOapg6sCXk1jj55ImyeniqIOpMl0ePVJquS0fynZUf6o8q6RXt+4UQyPQuqXGCP/StbVBhBM+lZK/ptRbZ2HPAn5IoAUnSIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfWMOan+uoAcjsejIGu8nn0qvygWqJEXOw6ZleEbVkA=;
 b=QeL70Qk3qG8AThllaK/4Elo+w7xynZILMBS7A3o9YDd14XRjBRsyTcEXcBLPZ+qlpn2duboSMQ71VHGguZW+wOdYUMoUXhXz+YwfiaMcor+qSaIUMCg0U7wGONPpWv3QeXau3ICBG+V1ZJ/MICWYSGNJn9OWuZfrtpGMbVCMurXHK0A9S122yz4XeMLcth6ZYgH5+/LXvoUOhyay0LGsNEYwuIrWrs1i5OZahOkmDdCrFW1N3Rg8TgiUmsL77I/hUZhpZT4iJjOjmG4olyy2fVFx9+zlg/k4PmvSV0Evv52fcULTh4+nKoQ9JNGWl01vTHeHriAXiPiteXvF/Px3yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
Date: Wed, 28 Sep 2022 12:38:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Subject: Proposal for physical address based hypercalls
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 585914db-2a87-4262-e228-08daa13da34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xTTBOAqKT2euz2iJKsqjfK/PUwQlhqthmeKnQm4WuDqA2UViZDum1JRubq969Pldu9UpjMMgzUAx/jVWL4B6+zJ7lbxNd5f7kPh888xI6KBseGxn/1bCZ204pVd4lg5ziaU7lZFSE4MI9C/QTxIpMowySgorCxduUKDb9xNx/Ih/BbOu7wnxejU/KFYzKMR5BrPn4vNCrqOqsAOBpq3rP2QdzYASx4H87lNajkqi9KKfSoJadm5egWAAea63RBsY4nZOBGbUmERW5jLwQg6px+q/0lcLT615f3KawHIqDepNbLgz4OhIX4jlRnSODT1UW8qNLhBnoHUJ1dJuPDppx7+VDtXr5yYnhr1/59IxydNS806UgwM53askpBCcXXDaKMZ7Y8/EUFri1V8tevwWYf1ikw74GH4rZ4J1kQK0awOmh4pAEcVzpuygzrUxnSNdKkQKcD9oNi97mriisWRmSPdvB6wFGw9BGAM1R/Og/yjMWVAE5ZmEV9OjmFtwdvWH/NznWyubjFKqun3C39nFulrYAAJk1XxW3VYNsRpP/2xLYsC9kfzAX07xOQxXP5JIUDMaaIgPpr3lOTj4SdA+7e1GVporlxKoVzhWkDabWJvsR+uCTHcq3ibNfXk0Lwrl0JYv3J4joELFRgd44DonSvojUns6yh0zKRwhhWn9+4nuXdNBG1EsVRrdboKzpcXeI3h/1tn188eqTWDOzFATtohHl1402umjpqREvK4STVU6tkgnLwSzHlKkvBesgmPGlIOn80X4v5trZfxojjugko66iThQw7lRdSxwTXvMc08=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199015)(478600001)(6486002)(31686004)(6506007)(186003)(316002)(6916009)(2906002)(2616005)(38100700002)(83380400001)(66574015)(26005)(6512007)(36756003)(41300700001)(8676002)(66946007)(86362001)(31696002)(66556008)(8936002)(5660300002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azRCd2JoSmltUGFVSE5qcVNGblgycTdqM0dXRUpKNFBSdUdDS2xyZkVmSEdH?=
 =?utf-8?B?ZmwyRGVLUTkvbXRBOElZNzNLWHpJM1ZhQUI1cVZpUW1oWUZTU1lhSXNlQTRi?=
 =?utf-8?B?bzQvamFHMGgrQjJGMmVtSnlqeHgwK3puMGhwbUx3bzVQbVA0OXYvcnBSUFY2?=
 =?utf-8?B?SE9DaDUvSnZBQ0x5cnFLNDJpdisyYkcxSUlVZWd5NkpGdVZicmFCZFVIaVNx?=
 =?utf-8?B?d3NNbkNpSUxFdGlQamswWkY5dlhtSnFrUmhlK3ZGSVNWR0c0Mm5yUzJRV2hY?=
 =?utf-8?B?Z2pCdjI3bVZZanBlcWpNZExFb2VFSlZxdDBQYzcvVnpscmZXSGJwTC93Nitm?=
 =?utf-8?B?MTNOSjlFR0pVNlo0QkZYdVo0V2Q2OGMwRDNLY1Rkblh3azRMb0xTVzFLQi9U?=
 =?utf-8?B?K1FqdWNscTU1RkJrSXRRY0w0a1YxckhMOGoxdXBhaEl6Rk5qaFZRdkE0VThN?=
 =?utf-8?B?SjlaeFNab2NLN2dIVHVXcGgraEkvSks1bEJhSmxyREdOcSt5THI3Y0lyVmdK?=
 =?utf-8?B?NitvV1NZWnV4YWxhemRFWS9yTzdFUG9nYXFlR0FmanJxS2Y1cFhtWU9mWE90?=
 =?utf-8?B?eUsxR3h4WGdOUGJtcTdEeDdHYTdYSXYwNVV6SS96eTUwZDVlcGpmdXkrYnlC?=
 =?utf-8?B?ejN4aEJvdWJUZ1Y1cktodS93TTd5cDJpRVA0N2Y1ME9nTnlyaUJaemo4NVls?=
 =?utf-8?B?YkY4amxQRzYxMlowT2dkVkl1eHV0YjQrMDJDL0psUE5WS0NmaHpRM3JKWWhO?=
 =?utf-8?B?UHJyVStmajNHWnJYa3ZtYXN6N3dEdUNSUVRHVzl3TnZuYkhrdEtlcktxMzFJ?=
 =?utf-8?B?amZJVUNrVXl4cFNLcHA5b2pEelZjL1RHdDhKUHpQVk9CZTJYdTFqdEc2dFhp?=
 =?utf-8?B?VTV5Q2lneFhLRm1SQ0RVdnBuaFJWU21TK3dyU1JLTm1KSjBvTFZYMGZuQU1s?=
 =?utf-8?B?SE1Xak1mWkc5a1BpQ0xMYnNKQnlUbUp2Y1VxeHhCc2o4cXJrbzU2TFpmQlRw?=
 =?utf-8?B?Y0k3YmpiUGF4dUNlN3dpUHNVc0VOYVFGQWtwSUNpcHEzdDNISHNYaFNsZzcv?=
 =?utf-8?B?UllIVDNmbDY4Y0ZVMUxjTElwV2tER3BkU2VLUURrZlJscTVxOVprUTNrYUxC?=
 =?utf-8?B?aWFEQzJidmhWUnpSUjZiN1M0b3BuSWM1WGYyb1FMMCtDYUlIcXRLTW1rNFo4?=
 =?utf-8?B?S3o5YS9FSjI3TnRYSjZCZnpsZDhyR3l5WGxmYnRXWjJBWVZLQmtCY2pkeTVh?=
 =?utf-8?B?N1I3N3Q5NHhhbzhYaysrSUtFSmxubkF6Mit4Vk41L3BxUGJmY29jZkVKZ01M?=
 =?utf-8?B?YXZQYm1iVlB6MWtFUlFjUnpDSzhwVGNSb0V5eWlNRDlKZjlvMzc0UTZJT0kx?=
 =?utf-8?B?N1VFN29OaE9tdWMwU0lrbUpnZU00YWNDd0dlZ0RTZnEvZ3YxM0VoaFVlckxR?=
 =?utf-8?B?M2ovRzF4Mzd6dU1qY2pvb2FzMXJTalUvYitROTVhT254dDh4dy91ZUtIZU5U?=
 =?utf-8?B?d282eU9HK0g4L2lsR0Q0bTFIcG93K1k0YlVGS3lXSUppTVhOcUNNTmtSUDJo?=
 =?utf-8?B?L2kvSGN2RFRreEpSL1VraGo2WUQ2bkFsaFNxN2pBeUpJbFlrR1Z5R3NyUnNV?=
 =?utf-8?B?M2tNTWs4K3R5YS9mQjFub2hQemJYb01aaVpYQURJbWE2NmtvK0RqZUkxdm9D?=
 =?utf-8?B?cmVJUGNwNjJaTW9XaHhkNXpKRjZ5NGszWFhaQ3UybU53UGg1OXRwRXJzTGRh?=
 =?utf-8?B?c1NHUVpJbWtNSG5qTHlSK0w3bzlGeG5DMWRuWlU1RUF4OE9EYnZDUCtjdmp1?=
 =?utf-8?B?YjFhMGJrd0d5QmtSQnBTUE5obTNVdkxFYkljWERyWnhqMXg5NllnS3RMUDZQ?=
 =?utf-8?B?R09RUXBzMGJhbHpHUmJwZ1RZb2dpUVVtRjNOTXhqb3EwTkZHdit2eU1wZVU1?=
 =?utf-8?B?TUVmR0EwYjBvS2xMSVNYa1A1Yk16RkFyNDcwTXpxRlNSTjlIa0R2RVpBdFRj?=
 =?utf-8?B?OUxmaEIvQ1Nidms3ME9paGMzaEhnVE1NZXZvWjYwbDhENFhPS3l6dTR4clY5?=
 =?utf-8?B?MzJ6QXlXSGlNVzFId0tWT0ZkRTE4ZWxSTHdzUUkrTkJjc1lTc1hKOTNKVjh2?=
 =?utf-8?Q?Vm7MZPCigLSIUKhGPgsrKAUVR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 585914db-2a87-4262-e228-08daa13da34d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 10:38:53.2463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiyrBuKRyv/0FfXvs6o9vXEaL/H+AdBCc9NDUzD4OJAx/j+/wQqUgUHE/mqlFHMCUk+gE7shQmpF9u+chuLXCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8266

For quite some time we've been talking about replacing the present virtual
address based hypercall interface with one using physical addresses.  This is in
particular a prerequisite to being able to support guests with encrypted
memory, as for such guests we cannot perform the page table walks necessary to
translate virtual to (guest-)physical addresses.  But using (guest) physical
addresses is also expected to help performance of non-PV guests (i.e. all Arm
ones plus HVM/PVH on x86), because of the no longer necessary address
translation.

Clearly to be able to run existing guests, we need to continue to support the
present virtual address based interface.  Previously it was suggested to change
the model on a per-domain basis, perhaps by a domain creation control.  This
has two major shortcomings:
 - Entire guest OSes would need to switch over to the new model all in one go.
   This could be particularly problematic for in-guest interfaces like Linux'es
   privcmd driver, which is passed hypercall argument from user space.  Such
   necessarily use virtual addresses, and hence the kernel would need to learn
   of all hypercalls legitimately coming in, in order to translate the buffer
   addresses.  Reaching sufficient coverage there might take some time.
 - All base components within an individual guest instance which might run in
   succession (firmware, boot loader, kernel, kexec) would need to agree on the
   hypercall ABI to use.

As an alternative I'd like to propose the introduction of a bit (or multiple
ones, see below) augmenting the hypercall number, to control the flavor of the
buffers used for every individual hypercall.  This would likely involve the
introduction of a new hypercall page (or multiple ones if more than one bit is
to be used), to retain the present abstraction where it is the hypervisor which
actually fills these pages.  For multicalls the wrapping multicall itself would
be controlled independently of the constituent hypercalls.

A model involving just a single bit to indicate "flat" buffers has limitations
when it comes to large buffers passed to a hypercall.  Since in many cases
hypercalls (currently) allowing for rather large buffers wouldn't normally be
used with buffers significantly larger than a single page (several of the
mem-ops for example), special casing the (presumably) few hypercalls which have
an actual need for large buffers might be an option.

Another approach would be to build in a scatter/gather model for buffers right
away.  Jürgen suggests that the low two address bits could be used as a
"descriptor" here.  Alternatively, since buffer sizes should always be known,
using a multi-bit augmentation to the hypercall number could also be a viable
model, distinguishing between e.g. all-linear buffers, all-single-S/G-level
ones, and size-dependent selection of zero or more S/G levels.  This would
affect all buffers used by a single hypercall.  With the level of indirection
needed derivable from buffer size, in the last of the variants small buffers
could still have their addresses provided directly while only larger buffers
would be described by e.g. a list of GFNs or a list of (address,length) tuples,
using multiple levels if even that list would still end up large.

Of course any one of the models could be selected as the only one to use (in
addition to the existing virtual address based one), allowing to stick to a
single bit augmenting the hypercall number.

Note that a dynamic model (indirection levels derived from buffer size) would
be quite impactful, as the overall buffer size would need passing to the
copying helpers alongside the size of the data which actually is to be copied.

How to express S/G lists will want to take into account existing uses.  For
example, an array of (address,length) tuples would be quite inefficient to use
with operations like copy_from_guest_offset().  Perhaps this would want to be
an array of xen_ulong_t, with the first slot holding the offset into the first
page and all further slots holding GFNs (albeit that would still require two
[generally] discontiguous reads from the array for a single
copy_from_guest_offset()).  Otoh, since calling code will need changing anyway
to use this new model, we might also require that such indirectly specified
buffers are page-aligned.

Virtual addresses will continue to be used in certain places.  Such aren't
normally expressed via handles, e.g. callback or exception handling entry
points.

Jan

