Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5474CC349
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283605.482683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoj5-0007N5-Fm; Thu, 03 Mar 2022 16:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283605.482683; Thu, 03 Mar 2022 16:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoj5-0007LB-Ci; Thu, 03 Mar 2022 16:54:51 +0000
Received: by outflank-mailman (input) for mailman id 283605;
 Thu, 03 Mar 2022 16:54:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPoj3-0007L4-VB
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:54:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2f90470-9b12-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 17:54:49 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-saU999qPNm2r2pxzOVrQ7g-1; Thu, 03 Mar 2022 17:54:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4397.eurprd04.prod.outlook.com (2603:10a6:803:74::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 16:54:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 16:54:46 +0000
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
X-Inumbo-ID: a2f90470-9b12-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646326488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uy537r82tTzX1+NV/ybruwDcslf1cl8YysuhP0X/usI=;
	b=BiS9D+s5+96FF4kfDQGILBy4RLj3UvNKTPB5k5+VPFJJRa9uVoz9grJLBg9Ey6AU0Q3xkY
	fHbOhoJSAk2JxwGHz8UbRILwvtH/vjEkNmu4vxKHfWDSGM3Ifu3tQyz20J3HVJQhc0EyZz
	bSjrQ5sClZlb7unzKX+bG0TcefUJeKc=
X-MC-Unique: saU999qPNm2r2pxzOVrQ7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/rh9PXHh2l2MH9UOnHeLPzXA09WEfh+rWeKKY+aQPFZV5S04jhsOPtaA67635spVWjV+vI9Ix0GC5qmgkS+weciQcfpAhA8wsK0vEPzrRcRjUi0N6s/GBPts6V1KUN+Qr1SbY8m6wG/WyB2ulCp+1qYd+Pm9Z/leBDZ4mWlslmTQ0dv3O9+uI/ck5aeLTg+dnleAzosId1CXhs5nZ8mSPJKGbbCh7kLFXM1BnIuh9diB3A5FaSeyk79rCDkXTekdxvuLNU/pp3qYq88t4kq35MTVXB7pcya/+j5uV5orSOdesCC3hY9CZcwUAfPYCKeUb777Ez/5KPpwznKFC7FOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uy537r82tTzX1+NV/ybruwDcslf1cl8YysuhP0X/usI=;
 b=hSJZbMmCpbzUtAVaQA2roUVo1g8IlwXiHWrXQg6CXZT7ggFDYiT794lq8Zr5/1mOyehr3yxPxdw7kfK69SU96rnblqTgYgzi+yqVr1ObtRE18A/XCSMCEm1FYM55A8H3Oa874LVonF+SbjUcTw+AeZLqC6hbK84dYOmc9ySNVlMhUHV9oUfZmuRt4U5U5djOnyckTv+XAc2nwtFtc1Ja2nneme4UyS36cCWnaCR123J55cnuW1CE7xGy0cDs3p0sAbEGvxO0P363XOykGCKgd2LT028zwK+Qihi0bVkQeBryX+9gTlDP0YukqiOhZ1xT9UhKJXh6aY5HoCaNq5rEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62510b9c-734e-35dc-8ae6-a780f978c811@suse.com>
Date: Thu, 3 Mar 2022 17:54:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [XEN PATCH v9 24/30] build: grab common EFI source files in arch
 specific dir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-25-anthony.perard@citrix.com>
 <3bde2fea-f3fd-3926-b98d-aa0afb549bf8@suse.com>
 <YiDhpSZC1z/duG4q@perard.uk.xensource.com>
 <48c58217-30c6-790f-a058-49b887fc1355@suse.com>
 <YiDxz2QcpzV7NGQ7@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiDxz2QcpzV7NGQ7@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0041.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94093f1d-2fc2-4b9a-9cce-08d9fd3685af
X-MS-TrafficTypeDiagnostic: VI1PR04MB4397:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43978B7C59AD31E76CE34573B3049@VI1PR04MB4397.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zJRrC8kbLifpHND4cBCAsmqpUVV65v09U6ZOuu6/Q2EHqG9TfllWtad711/uGwiz2dG2+0rTtqYbaukC9ssHby95c2Hkjt21JJefypWlATLfOR86lTp9hQblUgac4pvEe6r2DrQwAUjImvztNstILtrji5N7DV4n53M2Mett/hULJi5A0auzt+RRK63hQjuHw14R2tFFvUQ3ISdsN6WeuwCYZICljmib9g8lCV3JYYei+3wUjveStBhP6R7vXfXcRH9/q94e41Ut+xu+8h4izJ2K8pvFhr3GKIxy4mLi9hiiDHCcxprMHUKso66p6zRl2yG0xdPpWx/nUHvLpRQGweeN56OBvm2RerlPMBnWPf3/5+Gd4ymLp4ZpElOOD3QZ+GpUhXIpLcnxoMxP8xcJ6+obqWBoZnwarNvawlnBeg64KR20i1FtT81+WbbKo8oTd/bjpQgGuufOtuJDtH0lFoSp5jOTTUxvaD54p+IatUsxASKY6jfk5B9GwdHRqbxjMY8Wbrgqi4XtSwBdc9Wlx3G1fdHABAtv8JiLaDuvchfmaLi29E7N2CxAxH+0WS/RGU90JXSvnM/CXBw6dWO2/4kPKn4uJcpQEHPt6K/8S1yWPB6ShipiXhKviGREM5ldNUYUghmmsx49cJ4/mAyrjHK386nqUkEAEfFFEuBYAiysa8qF0ju8YuTsM3pWuCSS7kUffHaPcYHs+0ZfdVjeOE0VIU3Y4/rpAGu4XIEWfc8Z2wW2QjqwyH8lSwP4EOjF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(508600001)(6506007)(6512007)(6486002)(7416002)(2616005)(8936002)(26005)(186003)(38100700002)(36756003)(31686004)(86362001)(31696002)(53546011)(316002)(6916009)(5660300002)(54906003)(83380400001)(8676002)(66476007)(66556008)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUxTM2ZXcHJwanh6ajFwQzFQU2JRNzZuMTF4UVdMYzAzRFFvZjdBdUJleHRH?=
 =?utf-8?B?T2pkV1BxQThKb09WaFhlYXl4cTlFajg0bGtBV3pYa1NqOGQ2MVQyVFJhelU5?=
 =?utf-8?B?OC9VZzdGYXpidld4RlNiQXpZZ285bURHVzVIWGpWRVVDa1M4bEtXRkpSSkQ5?=
 =?utf-8?B?Q1FaNWtUQmZUZ09iTFhReGcrZ3RqeWdtUk5yOEFzTHc2UXhxc1pCNEhUcGVP?=
 =?utf-8?B?YWNMM0F2OWZiVnl5NVQ0SEZCdzZRUEk4NEhGWlRReVNteHVmeEJVbWcxR1hr?=
 =?utf-8?B?REs5ZFFDQzQwNk90TU8zdTNQSmlVNXBVZ016MFFNU1ZJY0dlRi9aUG9QTzBN?=
 =?utf-8?B?SkhuaTJuRUZzMStWOXRQVUQyK2hJTThELzM3UUtNSTZuOEEybzV0amdJSktw?=
 =?utf-8?B?VkJFem45NmRKc1NqMHdYY0hENlJqOGY1Y0pVQitsUlBsNUlRUmVuTzdDYWZ2?=
 =?utf-8?B?Sm0yOWM4dWp1SEVGeTJTeXlCUGRhN0hMWlF6SUwwSUdZZWtVRHg1bG43QTdW?=
 =?utf-8?B?UnVkNUdHc0JwalZWYXVnc1dsbDRPWWtETk5KVnl3TnBkWTdnVWkxWmxVdWlv?=
 =?utf-8?B?eTV3V25VOTl2QWlDRVUzVkZwa1ZGbHdiaWlDMUxCZjJ1TEFXWTFnT0dtQzJP?=
 =?utf-8?B?cW1CMWIwNXc2VVFoMUxJa2o4MXZCOHNXY0luejZ0cFAwN2R6TGxXaWJucFN4?=
 =?utf-8?B?aUpxOTVzZWhkdCsyemFoRG44Zm4yMG4raWdoZ2tQb0kzTlpzWVEzSWdtMVNE?=
 =?utf-8?B?NDJ5OHNpL2hicGsrME1SeEtQOU9QbE1YR2hqdXpIeEo2NTNHZUhZcHV2L1Y3?=
 =?utf-8?B?OXlhZ29HQUtzUHpUR0JPMXdvSFRTRUREeExBSnI5bmwwYmtPdkxENHlYanJ4?=
 =?utf-8?B?L3V0U1lGYTRibnh0a1pkNytaVS80WlN5VmFNdmg1THZEQ1dZKzM4YXJMWkdm?=
 =?utf-8?B?ckdrWXlLSHlPRHlCTDdKbWRnVGhxQkFUN0NIMVl3MFllaDRxdmpMOG1sdVBu?=
 =?utf-8?B?d2pJaFRxN2puRWw0OXplbkRYbmdRZ3RGeGtNZHFENXQ4WWlsWU9QUEJFVnZi?=
 =?utf-8?B?ZGJTVmpveWJSb2VRNldMRWsva09zLzV6MEdaclVBTFNZeHc5aDZaMHF4eml4?=
 =?utf-8?B?US9xZ2xjVWdPTW9zRE1BSnpZN3VqMFZzWno2akFyVlpCY0FKWk5WT1F6cEhR?=
 =?utf-8?B?VlV3NTMxeHZYSVNhQ0pYY2sra1BnRndiWGF1UC9XTWE4VTUxL2FrY1BxWUxP?=
 =?utf-8?B?OHY2bTF5b1ZsUjkrWmJZWFRoSXMyNUI4VEo0ckxCZE5OOHRDdCt0aXViUnIw?=
 =?utf-8?B?d2RndlgrK1FWMEs5OUdVZ0tBcjllQUJzdmlkbzg1WmFNK2pVOG92eGtHRi9v?=
 =?utf-8?B?b05TRC9YZC9Xd2dQUC80QWU2RDdqaFJTSVNEK3hndVVVZ3RuK2RKNmFWYUVK?=
 =?utf-8?B?M0lLWStENkNHSTRKSmd2bXFCQVVGN1VVNTRsQWdvcGhHaHZmR2c4bzNFQlRH?=
 =?utf-8?B?QlBjQW9JcXZmZzBid2ZYTGJIN1BzRFNMYWZLN2xJRThjYUhsSHVrUnRpWlRL?=
 =?utf-8?B?NWwzVTkwVUM2bXpPNnpoemxUMXA4dU9jc1l5K2hXUXY4b2NvMGJ5aWgzMGt2?=
 =?utf-8?B?blh5Q3huT0J5bTdPWjRhdWcyK2t4Z29YUXJTTlgwYUhBSDl0TTY2UG5waHZR?=
 =?utf-8?B?NldKRFhYTHhKUENoc2p6L2NWR3ZCM0Y3eHpkYTRSaUtXSVkzNEk0Z09qTDFK?=
 =?utf-8?B?OGxLNndlN1cwTzd3TWdRdHlLM1d1VzVkS2lHOHFkeXVyYjBTRis0MUZLVmhU?=
 =?utf-8?B?bUppbkxMTW5LaU0xN1Q4YU1kb3NKcmxCUGdqWFIwUVlnOEEzT0tWU3Vva0hs?=
 =?utf-8?B?TitlUzMxYmtKRlZUN3hhSk1EUnpLZThpa1FwWHpKTVlpNzUvUmdtSEQ1dzZF?=
 =?utf-8?B?Nm1qakE2a0RuNlNuNGs5eUVkR09CRTAyWEJUelFhU2U5NGtCWVkrczJWeVVH?=
 =?utf-8?B?TW1QS0RxZ1dReTgxVVJBWlRmSDlmcGFMM1dEOUI0TFlVRFJjZ1NoWE9DcWdF?=
 =?utf-8?B?OXZpN1VNcnpINExLWXp4UnFVZUdLdGt6U2tQL1ZqN1hnQzJBTnQ0UDI1S3Vh?=
 =?utf-8?B?b1oycENmaUg5UFd3dWN2MGF0cXVMekxrVlJKa0dEKytTZmt3NnA0Sk10YmF1?=
 =?utf-8?Q?F//0IQO3keItbxgG9wihztw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94093f1d-2fc2-4b9a-9cce-08d9fd3685af
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:54:46.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQJh2wzg2x7lcd4rs7BAXpngzsly2deeoSMkJgHC//+kzY/n7CtBFH99Gce7Jtj++GeoZVY5vSd1DppePB1XoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4397

On 03.03.2022 17:50, Anthony PERARD wrote:
> On Thu, Mar 03, 2022 at 05:01:07PM +0100, Jan Beulich wrote:
>> On 03.03.2022 16:41, Anthony PERARD wrote:
>>> On Thu, Mar 03, 2022 at 11:37:08AM +0100, Jan Beulich wrote:
>>>> On 25.01.2022 12:00, Anthony PERARD wrote:
>>>>> +# Part of the command line transforms $(obj) in to a relative reverted path.
>>>>> +# e.g.: It transforms "dir/foo/bar" into successively
>>>>> +#       "dir foo bar", ".. .. ..", "../../.."
>>>>> +$(obj)/%.c: $(srctree)/common/efi/%.c FORCE
>>>>> +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/common/efi/$(<F) $@
>>>>
>>>> What is the "reverted" about in the comment? Also (nit) I think you want
>>>> s/in to/into/.
>>>
>>> I've tried to described in the single word that the result is a relative
>>> path that goes in the opposite direction to the original relative path.
>>> Instead of going down, it goes up the hierarchy of directories.
>>> Maybe "reversed" would be better? Do you have other suggestion?
>>
>> I'd simply omit the word. In case you're fine with that, I'd be happy
>> to adjust while committing.
> 
> I think that would sound kind of strange. $(obj) is already a relative
> path. It would probably be better to just drop the end of the sentence
> in that case. With the example showing what is happening, that would
> probably be enough. The sentence would then be:
> 
>     # Part of the command line transforms $(obj).
>     # e.g.: It transforms "dir/foo/bar" into successively
>     #       "dir foo bar", ".. .. ..", "../../.."

Fine with me. Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


