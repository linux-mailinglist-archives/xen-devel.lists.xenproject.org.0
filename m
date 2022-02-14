Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBA4B5237
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272300.467086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbpw-00057P-M8; Mon, 14 Feb 2022 13:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272300.467086; Mon, 14 Feb 2022 13:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbpw-00054l-IU; Mon, 14 Feb 2022 13:56:16 +0000
Received: by outflank-mailman (input) for mailman id 272300;
 Mon, 14 Feb 2022 13:56:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJbpu-00054f-Fd
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:56:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df08ad46-8d9d-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:56:13 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-2GyU24gKODKuWxC6FpdBWA-1; Mon, 14 Feb 2022 14:56:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6978.eurprd04.prod.outlook.com (2603:10a6:208:17d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 13:56:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:56:10 +0000
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
X-Inumbo-ID: df08ad46-8d9d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644846973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6hvRHt39Hy+3o2g+gzhBSWx/lWMx4bZ7XwobQvzm38=;
	b=OpOIGNmsULQ/eA8yHhEatMK2QRN6Qvg7N5YH+y1Ksul7aeeuIqgty5JO2RjHjKxUwo1HWH
	c/xL7exFFvOXWPlkzfKLYrE5jbQnHLvSQHQ3QNWvp/4D/ElZvukxHe3nFG1ehOZGaxn7rL
	/PbnexV/JNa2CNBjO1+E9cbvHi6hsC0=
X-MC-Unique: 2GyU24gKODKuWxC6FpdBWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLykGaT9eTadpRzGM4ALV8AW9R0W66DoULv8Jj6/Zpst9pO0RY/GzDq5JpRaaudTSIP2ExomQcULpRc2C42faGL1axZvxmAPDlk51KyyLc9q67uzr+mUCc5IZUVMleuPHOTojPlLy4svuvWmzkbzeeyHoFgZq+hitZR/9zNoZhMYXos5l76ilsHPfVZ2wmfikCHrftjsAhonPRbVVVhmTS2ZV1C6dVyB0jK1pR7KBKuJtftdDoVI9pqYNXMgl+ZA/NKuIvg+tDhYMntf2aeT6D4uT8CE+7qAzeTkYn1KEu9o0/tk3WT2SnJJkffybRjIKRP0DVy6vmWfi9v5iBom7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3RnDTRuN0LOZ9KTsNssi8rwhMNqfVMlvZPFGWtpeS0=;
 b=lr998yDo1AhdZdrwcV7H/S7djuaqv2z6UMLz24jStYhfLO183p4g8GeVn/+VrpnhlGe54R/YGjG9m30gmlp8CKB6Unfy54NCcZX/mdGuhMwLSR1YdbO0g4EKtivfDSDE+WDpS6+vwF49st187WdwQDY7bT6JpfWvJazY4Ue8VvTXjR6msQvVY2qQi8nd421ImCjW7xwLBijrLZgigdpoi30bnQTbLu2XSRIY/IyVcyaHSBbOzv0RgVQC16jed+nOWWPoFOr6c8ffy+c074Rx+5hRkasGcVMegCznPHuQ4k+Tfga6sRYIeSk6i7fiHtxfFAVkqvQqTjAaV7BO7cpG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6566bf52-58da-f804-f5c2-fca64c1f150c@suse.com>
Date: Mon, 14 Feb 2022 14:56:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-5-andrew.cooper3@citrix.com>
 <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
 <e18c0c5a-d00b-adf9-d4b0-28e702a18241@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e18c0c5a-d00b-adf9-d4b0-28e702a18241@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0be20ada-b587-4229-c4ad-08d9efc1c17b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6978:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB69785A90ED8CBDD7296AF857B3339@AM0PR04MB6978.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pt2WJlpy410n2yNgTYCT+mazZpvhNVurSqUCu29HmriiAkwvCwD9dqHT4KEqBgk/gLQGZEslp0tAxqwmbCWMshqiL3ROMj/yG8gTXogtlpI24gpquTbcDMxNBB9+V+AHKqmfnY5y9M17h5jDd00oxshRb5hw0BD08b/EBedWnTnma6vOyQl5BYdZDhJ0jAO0UEOHBv6Gd+ETVyEayu4JqtpnTtdfbdAmOqAiWb0hwFt/lzG83MtXAcvcvZnqMaY4wxgznyzzROpoySjOGr5q5HnXN3iPe5u67C0QtQAyFC5akH8489rNDq86h1Du62w0nIzI+EdEFIa3kS3erKbgOaDoBMYCMZaDLCUHl5YMwZPsv+j/vDczLjYFFxjzkLTrBTo8mTmUmi25nicXswjNeG0N49G8p7kZs2VirVDOZHaoS7REAUoRBUGGE1qgpJ/EoCD3DqWLGAxs4kvnb3xbEnlDZTd+9M6ovv0DXmhDEq1bs1TeA44zuQB/CMwmkK56QBe0pbcmTCkM5KWjx7AUDYiPzk5HMYjVrTyfWJYMguanbaOFN0iIpbmneKcdbb/UTQV5UDhEVCqho2btnVPq3jfGICURz1XUE5U9O51lnhYLXGRr/emV+2l58v6wQBq9Thfr5VSEhQCcrQrV325v+e/2/9etPH5TCuzA3+tFIM2tho/bUhmvGFMxntrugOqlfaaEZMJGpsVOGkd6a5PEsrOid7XBS4skw9LMD4W5HK4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(38100700002)(186003)(26005)(8936002)(53546011)(6506007)(2906002)(83380400001)(2616005)(36756003)(66574015)(31696002)(5660300002)(6512007)(4326008)(508600001)(6486002)(31686004)(54906003)(110136005)(316002)(66556008)(8676002)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bde8szUcnY+JJdkQ6re7oewHt2W4Mr+7QZpK1vBDlU2rz531hPpahmy/dL0C?=
 =?us-ascii?Q?Qj8fliGkuJNJJaZPR6y84YwvlkW1C0OLegY559Gufza04Wk20SZpMynrx9ti?=
 =?us-ascii?Q?At5hXdCuENfnLQjSI9078sR13I6RzooM+WDhwwpn4y08JOY1iYr5Xo91zghs?=
 =?us-ascii?Q?YZH7c/qtu9ra3fTFy75egA4zj88sQTpSNt4ql5WGbWwD/EFRWHI7vexLdTPM?=
 =?us-ascii?Q?wKUCEBgcmGaA6EIX9LjQXEm2hNJAKAvFLMEO84EXxCiOuj8N+vrwQPjv4fbz?=
 =?us-ascii?Q?OrQqmIwSwoGb7xwoT4mjihQ4neOZeVxyWmmUtRS7ThyFIOR24MMVnrWNOkk7?=
 =?us-ascii?Q?VYleJlmoKdgmpcBZ7kJY29vritQ2y5PmmoyKI35ueRLSzbUS3aVpe89ZZHu1?=
 =?us-ascii?Q?X8OXP5Yx99CZfCsD1woHVWdMhzyDqKtkZtow0AAhBY8/Gj+/0tks+UnjWlKu?=
 =?us-ascii?Q?Hf/tcYEE4KRxWzN7+cePetJIb8MXSEwXpQAj5oJxKEq7JmgRBgCTd6hJ1GYn?=
 =?us-ascii?Q?jxmjBwHHbvqe+rV1XVcok/GiaSs65mGX94JjtEGZxu8P0W+PuUAyq7Xapqz0?=
 =?us-ascii?Q?wPjFwPffEjyQy9eCVBewYFTX9ET+wR+y2OFd8obZUfmnFlEmIKpezh3nXVCM?=
 =?us-ascii?Q?1JtQMKR5+VK0PF4ITfJkdJHQAl8zyiJSm0YtrWbHhD8A9Gac5/Za8mwnUycB?=
 =?us-ascii?Q?UCSjQ6DfiKwQG6QNGH4u7GGY9baYH92C/3j8zzuMm5g15qd6ie75zLKnfeu7?=
 =?us-ascii?Q?ZE3CfRQizUdCiYgurRU8IbgYJMPR600SKwcqR+bOBnyAADhRPM/+Tk1/n7Gi?=
 =?us-ascii?Q?JIjBZujdDZNKUcGXuurFns2t5ucalA/QXWogCJZaF3kfn75Vt6TQWycckgD0?=
 =?us-ascii?Q?UH9vHKtcAf9DppjGjxShHkRokpAXKO7bpJuhv4EqpaiIZY7Hfv1SMITBOd/P?=
 =?us-ascii?Q?KO8Bf/NARoMbYTeR0hFiSjhSV+1wvIifHMwPFGanHrEnutfYXR5yVMxZ2wHd?=
 =?us-ascii?Q?DxnMG9H5dP9b0P4re6Ow6yzs/vSFNgkbxg0byV8Z9p41BhKSFvAnvN/FleDR?=
 =?us-ascii?Q?A360Zczv4W3Opm9joHPpXUJt14FfjYjqnUJDBQmvYZIRtFkHbJ2atKfyzZdK?=
 =?us-ascii?Q?oPZhsRyTOmaVMxwhEnVgy/5+f3MmK9/ZygYKZdFCCb21X3mlQJIhzsXkWCyG?=
 =?us-ascii?Q?RRW3eqqy0/ucckxEQIQpwkjAHx9NmWhlppxhsmHG4lNOH6SvTxSpLQGLgxHz?=
 =?us-ascii?Q?XkvqgyaMV9uROlkFByyEfELoqgdDhhikhA/K7k7Xj4TmYdhX5qg3CXcqry0Q?=
 =?us-ascii?Q?HYk9Bp7YEVp4HuOiMtTUpXyUsu1S8vPqNUdqJHgU2HOQfUBVT9ToTB4UuYi9?=
 =?us-ascii?Q?lnwF9JXI8Mz+MEjEqISynO0UJwQzgod8G+tx/3zavl4hdflbIr8dNZ4r3ICs?=
 =?us-ascii?Q?slRMHJU3vLVfNCBApU/SWMqMP30rf5Pmd6JMDD2brhQ8+ee+Bv9z2al9uEt2?=
 =?us-ascii?Q?qvGLrGewmIUnpPWquu1bi4xQFzDh8GS1N6KJychGGNCqZ1q4JQScThgle9pX?=
 =?us-ascii?Q?p/qUFtV2ndBhKe2frmIMYdPFbcXplp2iwS3RvG5rnH1gq7GurzkKg60Z331S?=
 =?us-ascii?Q?LD7ahG4cZABDHBqGd3n5CPc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be20ada-b587-4229-c4ad-08d9efc1c17b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:56:10.4882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QHHTXW7F+fdKXRNiYRuvraK1CiMxk3bxiMKo38kNWtwRkH1MIWJNcXV0FUztahWhryxJiVveRK8xvH00xNOhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6978

On 14.02.2022 14:50, Andrew Cooper wrote:
> On 14/02/2022 13:33, Jan Beulich wrote:
>> On 14.02.2022 13:50, Andrew Cooper wrote:
>>> From: Juergen Gross <jgross@suse.com>
>>>
>>> When running as pv-shim the hypercall is modified today in order to
>>> replace the functions for __HYPERVISOR_event_channel_op and
>>> __HYPERVISOR_grant_table_op hypercalls.
>>>
>>> Change this to call the related functions from the normal handlers
>>> instead when running as shim. The performance implications are not
>>> really relevant, as a normal production hypervisor will not be
>>> configured to support shim mode, so the related calls will be dropped
>>> due to optimization of the compiler.
>>>
>>> Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
>>> wrapper do_grant_table_op() needed, as in this case grant_table.c
>>> isn't being built.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> I don't think you sync-ed this with J=C3=BCrgen's v3. There were only mi=
nor
>> changes but having a stale version sent two months later isn't very
>> nice.
>=20
> I did resync.=C2=A0 What do you think is missing?

A few likely() / unlikely() as far as I could see.

>>> --- a/xen/common/compat/multicall.c
>>> +++ b/xen/common/compat/multicall.c
>>> @@ -5,7 +5,7 @@
>>>  EMIT_FILE;
>>> =20
>>>  #include <xen/types.h>
>>> -#include <xen/multicall.h>
>>> +#include <xen/hypercall.h>
>>>  #include <xen/trace.h>
>>> =20
>>>  #define COMPAT
>>> @@ -19,7 +19,6 @@ static inline void xlat_multicall_entry(struct mc_sta=
te *mcs)
>>>          mcs->compat_call.args[i] =3D mcs->call.args[i];
>>>  }
>>> =20
>>> -DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
>>>  #define multicall_entry      compat_multicall_entry
>>>  #define multicall_entry_t    multicall_entry_compat_t
>>>  #define do_multicall_call    compat_multicall_call
>> J=C3=BCrgen's patch doesn't have any change to this file, and I'm afraid=
 I
>> also don't see how these adjustments are related here. The commit
>> message sadly also doesn't help ...
>=20
> The changes are very necessary to split it out of Juergen's series.
>=20
> Without the adjustment, the correction of compat_platform_op()'s guest
> handle type from void to compat_platform_op_t doesn't compile.

Interesting. That's quite far from obvious in this context, so clarifying
the purpose in the description would seem helpful.

Coming back to the syncing with v3: Was this change the reason then why
you did drop my R-b?

Jan


