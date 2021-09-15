Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274140BF8E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 08:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187233.336027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQO2k-0005Jv-5p; Wed, 15 Sep 2021 06:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187233.336027; Wed, 15 Sep 2021 06:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQO2k-0005GY-2S; Wed, 15 Sep 2021 06:05:14 +0000
Received: by outflank-mailman (input) for mailman id 187233;
 Wed, 15 Sep 2021 06:05:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQO2i-0005GS-6F
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 06:05:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e223580e-15ea-11ec-b4db-12813bfff9fa;
 Wed, 15 Sep 2021 06:05:11 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-55XKYy4pMzClJ4mJWTVE9w-1; Wed, 15 Sep 2021 08:05:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 06:05:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 06:05:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Wed, 15 Sep 2021 06:05:07 +0000
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
X-Inumbo-ID: e223580e-15ea-11ec-b4db-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631685910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2E+WEwgOtIX1OCyW2woDo9w/2jvsNO81sEG/PAJhb0s=;
	b=NP1AksTXgCODrw0yfrWK+V51mKetBQG9LJcD5auj3v051Gyw+lBzJqb0qvn1ukWXaSqAgw
	hXRk1YxjL9BlvWDkDWiSo/LwJo43swdSb4iBBF8slhu1tRm+OoLhK6DrqhesR3Jw8R1GNu
	Tcx1r4FFbziWqeHU79hlyEBk+jkGqK4=
X-MC-Unique: 55XKYy4pMzClJ4mJWTVE9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndnpmZQDOzwdHTWxxKt9tGLto0MuJ/MR4F0oWyCX16cTWs5aeYVTMVmzZGm1AGq7T0EZzikyUptFmzlUupDOXvnAZESjNsBHmgPZJ+7SHmy6KnfysxvkE6gJA/Y3vc9IXMb1EsjmByckZMc8w74+vR90btEokk6ljKLbu8XWcnRUQzBhlW6FCtRUTvuGIeMU/ndhSIyXXALchGRvzZpuumlfrpfa5kD2M0vp8kJEvVaQ0Jf6oMeQP2R1uO0g9r2koTRrC5oM1l826gTmY2CbNpq/Kj9nyigRnKRWL1RR2gwBfDoBZ/lff4+YSw0PUd0tzgnMFpPPbhy/cy30Vuqh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2E+WEwgOtIX1OCyW2woDo9w/2jvsNO81sEG/PAJhb0s=;
 b=cG3kG6kgW3leC7tXviqr4Ni3hWqF4v1MopQIMJG6KVTLASUAjEchWMPyujj0zX2gy452s7uYAVI2mnx18mMPGEAsGU8e7dCwORRBCTsgQm/SlmY1NyNasFvh61xeoYiBUxWD8KqWuyxO2oyT1IlzJu44HhlvP73YeIhXBqqzS4G9qEzUpHtl2NEWKms2+ndwH04vTsOaqIzzuQGfqGVNPjUmou017f7acejqwgInM26QfGkNkjZQFIjzCZKocuw/I2wFf5c5jDHTHKFL8VYjP6ykXmBqTppIZjCwBYGSfdAuKaBQ9MUrtaNzDtnSpu6RrFnRHTg7Iql+CLq3JeE73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: HVM/PVH Balloon crash
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
 <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3efe115b-1ff7-dcf1-8198-37bd7d7fb52f@suse.com>
Date: Wed, 15 Sep 2021 08:05:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5dd8198-443a-4a11-cc3b-08d9780ec4a0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4445C63ED0FA59CFD2F82EF0B3DB9@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ai/YzDbBWPD3fZMnseFVN+xdIh6DxAmYTUfZ+agkEheEkHBDNpd5BjDK/SJr/16pEnLMDh1XyYLylhT92gsuu6bFxJ53/Do/WaaZ1c0zYBWT2hXmXw9VQIksWu/L8W/KOO9/RgaDVozcRPfXmYgY0EbaeimPhYO0wRHBUUoUIZpbE34KZmUuxhWRWFNZbxmINHRiK3m0IOaNt7asZsq+Sd0ByjEBSXigcLSGgPCfVMPwvbgqkuPW9iciPvN006jzrAZ4ydVU7gp355zciyyqJK6X+ddfL+TPZT1bp/eQPecAu5wlzLfnDZ+xO60ZrjmNeDELVhOQrw8sNRLj3DNI1tKf8rspCJtOrSmtJyzqETBaBGJXg/tVXqo6UQuVzEctKW+OnP05aXzmoMErw2/Zzpb3nHV/IVCGojtaea0OmX8eBadLBV6eVNBvLuoeAKOkSiUrKlkGOEkh4zBQXxaHx0Bx8BqmVIXAxbZO3aqp03fRNKkxPWOogRpEaKJj/cSlKD7xGtndlQvyaG68DOZupbLp+1M6Bd/Dx/xY/8skT0bUk3ttRykxjVOS3di2nSbHacr0QfDc3IYSTQMyKvG0aZKknOX4FFkE41WXnYAOVT87atD0REJx33k7JXONRchutFtZGb5pvqILDI4hhl05F+NGonrdLCaDgVobWJRaiI/LyNaY06MOd0D6oynJ1r1ua016AuMHzv/7T23dR6UGXNI+JD1NpB/v+k0RiTyI6fk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(4326008)(66946007)(31696002)(8676002)(31686004)(6486002)(508600001)(38100700002)(53546011)(316002)(66556008)(66476007)(8936002)(3480700007)(2616005)(5660300002)(86362001)(16576012)(186003)(36756003)(26005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmNjTmkwa1ZidTJZK3l3MUtoT0xHMlFhWitRRCs0c1F1eFJnR0h4WUxVNWR2?=
 =?utf-8?B?eXNYL3lCUE9uSklUdFJXV1RrZ09lQzRjRFRGd0VNK3UwNlBtNklZTlVoazRk?=
 =?utf-8?B?QkFrb1NtUVZ1VEVESlV1RnVjbTV2V202Z29KcXRTbTZNV0Y4bGxBT1pkQURz?=
 =?utf-8?B?ZW9wc2RNLy95aEN5VVZ3czRsQ0ZSYkFoOGZtZzZOSi8zOHdVWnZBRHV1aG03?=
 =?utf-8?B?RDZQZmhubmZXZ3owMmJmQUdlcXhFZDMyY3lRM2NtM2NmaXBkSDdPcmVmZHlD?=
 =?utf-8?B?djJDZjBHQ1JxQVZEV202Y1hqUnFtVzE4VVczc2ZZeGF6MDEwZXluUTBiMHVw?=
 =?utf-8?B?M3hTY05tSWxhVmYrY0ZQUUxQOVRmSVVIVmEvRDdsT2wrMldGcVhJeWQ1eXRu?=
 =?utf-8?B?SEpBN2Zzb3BWQnRYRnYwSVBmdUxIWjMvcVM3WXo0elUzRG51d0kyekxzZElX?=
 =?utf-8?B?OWF2R0F6c29NOUNwbnZRUTdmYm45cjUxWERjY0NiV3cxRlFxU1Z2K3hEUVM0?=
 =?utf-8?B?SHYxOWpLQmFTeW9JSEhtUE9OblNnV1lmTHRhVm9QSHFlK0h4OGpkblh6aUVw?=
 =?utf-8?B?ZFF1NnU0cXFydmxyWWV5b3BjQVhjaUtKNnNkMjlkbklSeEg3cXJOZU1wVmwr?=
 =?utf-8?B?WnFCcGlFVlJLdGV0UkpZSlhjWGI0emRyUU13cm1EVHVuTjRZVXk4MEg3M2Y4?=
 =?utf-8?B?QVJlUm42QmlSMVg1L0RZK1VYNG5ya3dRN1VDSm9QQ0ZsY2tnZlFOK21CR2ts?=
 =?utf-8?B?dUpNUnV6WnBTYldEQjl6cHFHZUhhSDNsVzJhT3NkTFl6RDRaZnBGZE9MUk1O?=
 =?utf-8?B?ekNtZlp3WnRTaTB4QnpFOTFjMlJncG1WUE41VURDZHpGOWJPMnAzcXVXcWVF?=
 =?utf-8?B?QURxR1l4NEk5aVMwK2YvT0FaVkJ0amxFbFM3OVFFUHQxM3BwVFZSM0hXaS9K?=
 =?utf-8?B?M3lKTGt0S1NFdFU0R002aDhTRGtYWmJTSW8ybWx2S3lSNmpCaUdDVlArWTNx?=
 =?utf-8?B?MGlYYWJ3bXBMcHZVZFYrVlg5dVdTQUJzRndkOVVEbkNiSXpkV1ByN3kwcXZl?=
 =?utf-8?B?NVBDQU1EZ0pxblFMK0o3UHVwUUlNYjdpeG1VTW5NZFJGZVE2aVcyMWJFMXBo?=
 =?utf-8?B?L1dmSUpuZXFiaExzdTNNRE52TXhhLzJ4WDhTeENyVTY3Vys5U3JsNE05ai9a?=
 =?utf-8?B?L3M0NTZoWlNJQVlETmtwWll2SGtPeVhuYTlIZ2lhWXJ1KzYwb0U3OGVEQXpS?=
 =?utf-8?B?clQyZ2NSOE4valh1RnpFRjEvQldjenF4bEZQTk5TL003SHBtRGFXVFp2SmlE?=
 =?utf-8?B?enBOTnlPRUxlNGMrMTJuUStVcG12Z3k1VzFGQkE5VlJVK2UxRFBHK05BNFZY?=
 =?utf-8?B?NndUcWZqa0YxTmUycnp4VzdLS3RNUVk3M2d2VUtPVjRwaWpxMFI4UENYTzN5?=
 =?utf-8?B?R0NlS2tSOXlFcmxxRkszMTVUcUsrOVZwUXVFOHhWWFhQaHliU25CRTEwLy90?=
 =?utf-8?B?ZU5Cbm1sZURtRGlzVitnczZkekN2M3JjNHVXOUoxVVRjaWN2M1BsQnc0R2lz?=
 =?utf-8?B?WWZOdzJiL2UySDY1UEUycWdNZmkzaHVueHhRYktFOWJwd0JjUzQvRFljWHZ1?=
 =?utf-8?B?ZThvalkxajVVcVVNaTlnYTBwTll0UmxvQXZtVFNPWVUvV1RSTEs1aXA0V2V2?=
 =?utf-8?B?elhhZ2RmRUNJeEs2anFVNVV0NitBazA3WE8xTFJJdnB2aDBLRHpYazVMMHBX?=
 =?utf-8?Q?wkI5T/e4cgVdQ+deb2d9t+lxO9wWgQhM4GvJsC/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dd8198-443a-4a11-cc3b-08d9780ec4a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 06:05:07.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XmOHC6lN2IUqjf47JGNLw8p8/lTwSbsG5MwpjVXq6AP5RbHJxGNyHUL2/kB5KXtEqcaDiCrdMyus/cBtfFUWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 15.09.2021 04:40, Elliott Mitchell wrote:
> On Tue, Sep 07, 2021 at 05:57:10PM +0200, Jan Beulich wrote:
>> On 07.09.2021 17:03, Elliott Mitchell wrote:
>>>  Could be this system is in an
>>> intergenerational hole, and some spot in the PVH/HVM code makes an
>>> assumption of the presence of NPT guarantees presence of an operational
>>> IOMMU.  Otherwise if there was some copy and paste while writing IOMMU
>>> code, some portion of the IOMMU code might be checking for presence of
>>> NPT instead of presence of IOMMU.
>>
>> This is all very speculative; I consider what you suspect not very likely,
>> but also not entirely impossible. This is not the least because for a
>> long time we've been running without shared page tables on AMD.
>>
>> I'm afraid without technical data and without knowing how to repro, I
>> don't see a way forward here.
> 
> Downtimes are very expensive even for lower-end servers.  Plus there is
> the issue the system wasn't meant for development and thus never had
> appropriate setup done.
> 
> Experimentation with a system of similar age suggested another candidate.
> System has a conventional BIOS.  Might some dependancies on the presence
> of UEFI snuck into the NPT code?

I can't think of any such, but as all of this is very nebulous I can't
really rule out anything.

Jan


