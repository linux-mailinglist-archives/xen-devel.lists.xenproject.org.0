Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47768709195
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536745.835389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvLj-0004g9-Kh; Fri, 19 May 2023 08:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536745.835389; Fri, 19 May 2023 08:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvLj-0004eT-Hp; Fri, 19 May 2023 08:20:31 +0000
Received: by outflank-mailman (input) for mailman id 536745;
 Fri, 19 May 2023 08:20:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzvLi-0004eN-1x
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:20:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03048b83-f61e-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 10:20:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9877.eurprd04.prod.outlook.com (2603:10a6:150:113::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 08:20:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 08:20:23 +0000
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
X-Inumbo-ID: 03048b83-f61e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAKBZiMNFjXGSwa6aCrafbgtLsA0CX+SDBSJdw8QVpJrejT/oUKZj0eEcVDLDcBwVeChg59HsOooKpPKYIdG8YBwJ3fwi4xAPnk7oSVdYhBnmrkKskKsGUuPGgfuVEEu43dp4ZHGojNTVz+J0anIDvI+W9vgnsScDdtDOl2SXry47E88glIg7IfxrC/m3ThqmnNvhdzLQPb2B/XJWpUDF23TyU5KMKoLeBMdTNPu5jFSun+93lsWwBqpXrIjYiEggrmuyuD6+0gil09zG/O/UASuHISOMndVrTyevHm4P2YmAPExqqwnV1mvax2H6gqVCuBuxwa++ga6WYO1sELTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lFXBW2kHGzFklFIGhri1TV0wq4IwHvP/OC5+F2Axcs=;
 b=cGSlV2Q/QokK3QhA854NDtiyiBsKb5eo8j7MQnWCGHchuEvclmZkC646Bo7jcCQrrpe8D5umO3IknFsjLjMzfr1O0Db3bs8e1F8OapDi3epPh7XXyUsyND2KmtGayDR/OWRflMDzN4sxVXUYvVAHKExDpcci4hKI5xEzrPLynXkmTSpN71TdfdswYZzVs+/ZshFO6mzt46s1c0k3AZaIM3Lu1Cwg3i5QFREB3xMHkCPFUCQy6FE368+aMydNGYvC9rcKWf0AZN261vESCsnnHLIEI0IUSgJ8D41hWjyduKxVXz+PGxoi0TEup8x4zVNNgW+rHmM90zHDL/rHT8qV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lFXBW2kHGzFklFIGhri1TV0wq4IwHvP/OC5+F2Axcs=;
 b=FwuSjQpEJaJUqYU11Blj9bzrL2svIl6SlZbcNEV1aqf5CKPaxmH0AMiCoguRTvuayePoTE1dEIjNgheibjcoRKGWStqpJL9BScNrVEVc+tWMIrpOW4vkHFGyGNfHXrhfsjQ0AFqyX1bobpAmlhdMi+gmUyPoTdmA5euSworQlN303LobyFSyDZrI4Wbtc/3TeIeYsaP5KLFiRHWCJBAuo+NOE+zgCh5f287FrfBbgQprF7jwWBUMmKFWMtMLc9yV+PLUIt9V0h192DhDoO71tXhENVpqbznjQ4bfl2uX2rcmEacDMJ1cFR/r8sjtccaXUBV1OWCMS6hlI01Gxmrm7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a00019e-da64-ad0c-d107-d002cf6bce85@suse.com>
Date: Fri, 19 May 2023 10:20:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: PVH Dom0 related UART failure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
 xenia.ragiadakou@amd.com
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <b411f7aa-7fd2-7b1c-1bcd-35b989f528b6@suse.com>
 <ZGcnh/DZvFAIBR/n@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZGcnh/DZvFAIBR/n@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9877:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e22116-e8b6-4170-0c22-08db5841e46d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MSfN5ce46ATozQO0lxyO2J3pRgQTOVAF4ghFzCbGFzfzOPpM39lP8x4K/YZQTPEiVxV1Cio5gW55H18gfeey+wkugXcji+FVCXSLuI4WkpKqjWK6wIiN+ApRWxjB01FEsLf+MEGyCA9ZD7PmP69EldBb2yONz4K3meVqdGgugRDGEF5ExVIa+zgR9jF77wwZ8F1mg0n+seCLk1GYB1Qht4KEhBo2wkZ74OlizxM9hfiWviObpaO2Oek+szDLHlk9n+Ocl9UM5nF7v5GX4SaGi87073c5lXa8nIAXMkZYZVmqXB3sbqJGHtt53xczslj2I/NB1bwU0BF9IOxg1obJaPGFFh5lpaH7yIn0PktVqbni6EzZPL6oFwBonEPkG62Jka49/RH1T6Ki5fHbBtaaC8KWiVhbCsqOVzL9CCZ9TtOxa33DaeE3PC2vWuBEYAHBaTmDiQH7KR3KJq3ldjmeUsbFfh9gHsuV33WZhGfs4kvVbKgOPyusmzpOuCoemdcdgVxKnWrKD5Leoqg3EFZwm4Ldd+huwUEIEebaUHzYafBoZt579C+t0tuj5mXykgWX2AjqH91YvqN3RWBEM3ySwikNF/ybRH2KBiR7nKezG3pCzDQd+Yn+7R35fe+K7y9ieVC9hEmoGXwbnyv3LD2lUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199021)(86362001)(31686004)(66899021)(83380400001)(41300700001)(6916009)(38100700002)(36756003)(5660300002)(66556008)(31696002)(316002)(66476007)(66946007)(8676002)(4326008)(2906002)(966005)(186003)(6506007)(6512007)(26005)(53546011)(8936002)(478600001)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDR0YjY0N3hQZlEvTUtZelVDMG5mUWNsS2R6Z2J4K2F3VnpDeEtGeGF5Tkdl?=
 =?utf-8?B?b1F1bG5MMHNEMXRrZjRkQ3ZaZk1aOUVZdWR4Rk9qM1Q2Q28wSmpXRS9OQUVo?=
 =?utf-8?B?UjIycDYzQzE3aGpuVEJiMXRPQ1FMdkl2aERWSWpCcjNPeWRpeDhHdUc4ZlE3?=
 =?utf-8?B?Z3VnQzZGemkzSDBWYkNXajRvdnozSE0ybFlaOXpkSW9TN2MwdUxzaHd2U09k?=
 =?utf-8?B?c3hRVThiV2YyRUdBb3ltZXFidWUrVElzNFQ3UGZJcHFkSllncEpXU3cxbWZW?=
 =?utf-8?B?RUhYUEE1dmE0aS8zU3I3RUtmU214aVBtZmhNbXVLOXBublB5QXJFTVZSaEdk?=
 =?utf-8?B?QmxGYmZNcjE2NWljZU52UVI5cGlObW1qNURyTVphWW1MamtnV3lRWmtIb0ll?=
 =?utf-8?B?eWh4NjN6UXFvT3RRcGNUSk1xRUxKbDdncWlzR00zNFdwY1NvUjFJTGtFd1dm?=
 =?utf-8?B?dWxVbG9xSWxpQUp0YVBaOVpDbVZkQ2FnTzJ2UTYySlVkVDhYTGpYdnJpU2hU?=
 =?utf-8?B?Z0JhR2x6dkM2UXVWZ21QNnV5MVVkNHlxdHJaZGFqQktNQWJJV0wyQVJKb2pw?=
 =?utf-8?B?N1g1RDN5MGQwd0FmV3hnK2lNQW5mVDRXa3VrV2ZVeUcvOTcyTDdHVis4T2VL?=
 =?utf-8?B?a1NwMU80bGppUk1hUkI1dERxRUNRSy9qMWtHQ050RzVJLzZYWStIMC9la2tq?=
 =?utf-8?B?S1V3RlRvdWFVSGNJcU9qR3Zsb2VPa2h4cmFpcW1GMXU3QkFSckpNNXR6Wlds?=
 =?utf-8?B?Yk9vczlrOW5jYlk3azh0TmROTjdyd3pIbFZBQm9NWUZwWUtGYXpWZnBQbEFr?=
 =?utf-8?B?WDN3c0ZQQzU4cFQ1cjJRY1J5eXIvMG1VeHFRaWJzRUJHT29ncXNHWG4yRVFF?=
 =?utf-8?B?dnJwYVRTSWpjd0UvUHdYcmI1RFRJYVQ3N2ptRkxUK0tWYmJieS9rZXM4Nk11?=
 =?utf-8?B?YW43NVZjOFh1R3JxWDZpaU50cTV2M1Y4bTZSbVRkU00veHJJNmFJOFduZ1Vh?=
 =?utf-8?B?VGRNSFNQeFZCVHZQdmV5NGtHcDE4MTZHVURuSFhJQ29jV3ZUR3V3NzFrQmRu?=
 =?utf-8?B?eitoMkR3dXlNbXBqU3hzbTVZSGpQSWJtSjliZWFndllRaEdmNVBEZW9mUWNh?=
 =?utf-8?B?akVLWDYyK0JzeWYybW9GZjh5cmorWWtJZTRsTlI0TGs5eWhtZzQ3Z3llVFB5?=
 =?utf-8?B?ZEl3dTFFays2S0FkR1R1dC9kSGJXK0VwQ2E3elB3SXo1VlQxZnFLN0h6bmRz?=
 =?utf-8?B?NDhuYSszMDBrRUkrRERvSDNmRGFiS1U5UC80T1pmOXNXTllFNG1ZNkJoK21l?=
 =?utf-8?B?emZzQlluNXlLL3crdGdZSU5ST1ZWeHdzMUJPa2ZRVWhDdEZQeTRSb2VYV0hj?=
 =?utf-8?B?aHJOdWdDZlZWQnVueE5nQS93UnlLRTF2c3ptVWV4Q0FESzJtcU1pWUZzNUk1?=
 =?utf-8?B?aWlEZFRWTlhUS3dkdnhGSC9qaHBLZW5XV0F5UVQ4NW1rejhHVmJPRzl4UWhX?=
 =?utf-8?B?cC9GeExEZkFsbUJ1MkFVeHlydnljenpaMDgwdkhjUk85cmFpTHVQMWJIYWEv?=
 =?utf-8?B?NktCU0c1cWpBcGVwa1gzOXpnbGhQYVFjTmxFdVVpRVlvODZIZTVFREIyd2JZ?=
 =?utf-8?B?WWpLTEpVNlVXazFpUHhZQjg5dm10Mi9JV2EwM0c1YmVkYnc5cDVwc0tNT2lt?=
 =?utf-8?B?RHhWcHF2S0lVcmFCWk94SVFLY0s2aGsvMEdBbjZnZUMzUmxUNUZRZU5rZXpL?=
 =?utf-8?B?aUJyR2dUSU02K3huZE9TK3JCa01ZYTRYQ3FDN2wzSTBPbmpvSXRKQkxTeVRZ?=
 =?utf-8?B?K2V0cTJKaTFJNk9UaENvWFJXblJ4ci9WemhmQ2pBRXdkOHpYcDVFWnJXcS9Q?=
 =?utf-8?B?YjVMUUMyR2xlYnMrZ2hKek0wZmU3d1MyV2c0SU9oNlRXUWRHd2RpeG1kdnZm?=
 =?utf-8?B?VlRYVnBRU3M1T21UOXdHRUMxcHN1dHRMT0k4dmw4TFRPMUdQSGRuTFl4NTFt?=
 =?utf-8?B?ZjF3SkdKQW9GekxreHJ6UDQ1eVk1WkhPaGxsY0RJRnBmR2E5dTVZQ2RSUFgr?=
 =?utf-8?B?QUpMVXJsNUVQVFZYUGUwNmlrUDVKT3R1NHNNS0MxbGlpcTVTWFdrTENLVnQy?=
 =?utf-8?Q?n31wvDk29u6uOSQ8GohWc7eNc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e22116-e8b6-4170-0c22-08db5841e46d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:20:23.3057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LU2s6lTquIchcJI1W+T0P4o2l6fV6ogKRSDVbTpYRORqbfj3kJMR10W5s351UEKRgl3UNu9agtBYz2jIbd0TWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9877

On 19.05.2023 09:38, Roger Pau Monné wrote:
> On Fri, May 19, 2023 at 09:22:58AM +0200, Jan Beulich wrote:
>> On 18.05.2023 12:34, Roger Pau Monné wrote:
>>> On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
>>>> I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
>>>> test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
>>>> Zen3 system and we already have a few successful tests with it, see
>>>> automation/gitlab-ci/test.yaml.
>>>>
>>>> We managed to narrow down the issue to a console problem. We are
>>>> currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
>>>> options, it works with PV Dom0 and it is using a PCI UART card.
>>>>
>>>> In the case of Dom0 PVH:
>>>> - it works without console=com1
>>>> - it works with console=com1 and with the patch appended below
>>>> - it doesn't work otherwise and crashes with this error:
>>>> https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
>>>
>>> Jan also noticed this, and we have a ticket for it in gitlab:
>>>
>>> https://gitlab.com/xen-project/xen/-/issues/85
>>>
>>>> What is the right way to fix it?
>>>
>>> I think the right fix is to simply avoid hidden devices from being
>>> handled by vPCI, in any case such devices won't work propewrly with
>>> vPCI because they are in use by Xen, and so any cached information by
>>> vPCI is likely to become stable as Xen can modify the device without
>>> vPCI noticing.
>>>
>>> I think the chunk below should help.  It's not clear to me however how
>>> hidden devices should be handled, is the intention to completely hide
>>> such devices from dom0?
>>
>> No, Dom0 should still be able to see them in a (mostly) r/o fashion.
>> Hence my earlier RFC patch making vPCI actually deal with them.
> 
> What's the difference between a hidden device and one that's marked RO
> then?

pci_hide_device() simply makes the device unavailable for assignment
(by having it owned by DomXEN). pci_ro_device() additionally adds the
device to the segment's ro_map, thus protecting its config space from
Dom0 writes.

And just to clarify - a PCI dev containing a UART isn't "hidden" in the
above sense, but "r/o" (by virtue of calling pci_ro_device() on it).
But the issue reported long ago (and now re-discovered by Stefano) is
common to "r/o" and "hidden" devices (it's the "hidden" aspect that
counts here, which is common for both).

Jan

