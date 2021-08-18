Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF23F0381
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 14:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168231.307147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKOE-0002ng-6O; Wed, 18 Aug 2021 12:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168231.307147; Wed, 18 Aug 2021 12:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKOE-0002ky-0W; Wed, 18 Aug 2021 12:09:50 +0000
Received: by outflank-mailman (input) for mailman id 168231;
 Wed, 18 Aug 2021 12:09:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGKOB-0002ks-SA
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 12:09:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d91f25c-001d-11ec-a549-12813bfff9fa;
 Wed, 18 Aug 2021 12:09:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-x4ASIRBHOBeuH3rC6-wwfg-1; Wed, 18 Aug 2021 14:09:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Wed, 18 Aug
 2021 12:09:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 12:09:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0159.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 12:09:43 +0000
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
X-Inumbo-ID: 2d91f25c-001d-11ec-a549-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629288585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KPWinKbWR14fGcKfhcZWMUqQPi3/q/25h9/w5coZ1k=;
	b=TMdtCrAiy+hNS1H0Lr+ARlqFi0hEhniPdGMhjs8Hy8p2IF/FJ52Ra8dTssmV1zhWMifl5K
	8P12Ftad7X3uNampp19b2bYHTDzia1aquOOzSjH6nkQkjMS/9zYvKCF3fmf7sIMnoGQBEJ
	UsS5mgo8DjnfJhnaQzCX1iDypNWdqN4=
X-MC-Unique: x4ASIRBHOBeuH3rC6-wwfg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEDRI1DNb0yWNESuatfFVkyIgh4jsabzyhbWEBasQSH/AGKU/C1awQR1pXZ1vXzexhxGVDOLp3JEZofzCipZtLi5qpVM08HLmzYk2q25ItjwNmZ8SsS4/APDNXrOae5j3ryPtD0s1Sd7+rztQzy0Pha7Wm6OY5ZgTXlmAszHO094aBhX942wy0TtwkrY171O4PSxsamPjT6yt08Kz3Se96xA0lEFMIE8Okh3PPyg7EbWJM1YA6QTgt7O8beqCFBqnalb9PuPVfAaUhnwGWcdHiHf4Is1pn14MbkzJYml5B9yo0ymWNFJ2KuLzB8LWRYVJfLGqdoPFbhc6PhazhvkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KPWinKbWR14fGcKfhcZWMUqQPi3/q/25h9/w5coZ1k=;
 b=N3WFPN4rh2NP+VJsADnKsMHEq30G9OK4GRAkbA6TkF4ENnAhPnxjah1+/mvXv5W+Y1Ej6Y6QiVb1VpFtM1g/Lmy5jBGpM4+ggNOlzXbkiXRMv8jhejshCKT/1vn82Nacb2T8BIAyBIr4xe5R8oTeevcDr7EUV9yzRviD8Zs1vn10FgH5uqnH17XneQX7wmABWNzNWx5cs0pGIe9qz6/dDUc31VeKSdEFDNrfDzfaWbmyCT097ZQ5eDKybsHJI2Xamlw79u39lHdQMUAacp9Wa9cYyzjjyIwWK9XrLHSITQMGNsJXxT93FEpWGYtfTKqc+L+gPR/jvmfcQMQ9rrkpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: meaning and use of IOMMU_FLUSHF_added
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d6a6e5a3-5ea2-638e-1eb5-2fee73d82188@suse.com>
Message-ID: <496eb0fb-138e-d807-ebad-fc4b792dd9be@suse.com>
Date: Wed, 18 Aug 2021 14:09:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d6a6e5a3-5ea2-638e-1eb5-2fee73d82188@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d29f0aa-d784-4b58-77e2-08d96241101a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48479971BEC9EF445D07FE84B3FF9@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dcS+HJ2DPsbq0Vm/cSCii3UME4SP0gMYzqu3/eMtaoG12Hnvpz5ewuyUGIpvWDhl1wBzetPQXlpL8z0mJRcAqGkwIhEHh628+HZh4EdD8/sVQbgZgz3qaLojKL8zoKO8Uga0C9ZvELC+jcmN3Eh8bj8sFfiEkSHd0OlEaoU/aFEcD/HdQHbrwhBiQE5t6ONajIPqBlxrSg2VIg0M+ZPl9N6BwMIiGMIkGi4s1SBD17hgvDwWM1TgjuXOX+Qhnqzk0tf3kofZq/cnFwaowsmPYE65EzMbVyBlseFLKPcHee9PHHuOUCABWo8obRabFdnBGlRW2yxsvcD7HYeYjuo31cNQxBLAyqGZn3GkWlWQiC95UknFp+XQh79UGe8bK21ZJpgwKad9BV9pRXkX0Rs6J2oMAUPoDCCB6eVc7NaHX2QUhOg8xWNQANaG5QeCqFwQiPEnm1xbjAhv84VfAwv36439yKek7bMvNYbZn4TsFqjuh8uisj343CIrob4RWGYGdVJUj9OQbqtZW/l+hQ+Tyno2vnW3vxYMoUBTxdUiKIiVsqal6tOvoq2+gJrJmlO6LqIwAuC/bKTTdd+ZZE/ZSUVrPb3adikhf0kez+tOMtEj2b+ILy4pykqrwsffM2iX9gwTVluVn9tH0VsifcTNMZiABCfoTkTNghvSs+isAv2EI8aHj4TuqE1vYBkrsUPc3fRE7OMCroilZpCWO71Hok2K1G8c/lK3hXgYSW2WYXU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(8676002)(316002)(8936002)(6916009)(53546011)(16576012)(5660300002)(2906002)(66556008)(38100700002)(66476007)(86362001)(31686004)(186003)(956004)(478600001)(2616005)(66946007)(6486002)(26005)(4744005)(31696002)(4326008)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tnh6ek52em54R1VlSzJXcDlacC81Z2p3c2RZcm9YZnZaclpGMDd1aThad3dI?=
 =?utf-8?B?U2puKzhOclVid0V2bnRDdEVlVU9hSSsyTEp0TzV4V2dMYmFNdlFFSjluZTNE?=
 =?utf-8?B?MWpPMXlZdldFNStCQlc0NGFIb05CNTN4Yk13Q1g3bXlFSVRlT3M0c3RMdzRS?=
 =?utf-8?B?d0FxdmFwS1VtQXdmZE9VTkZWNjBkQlRmY043S21LT2ZiZEpRRHFjcGFMd2NW?=
 =?utf-8?B?YkUvV29Vc25EcCtGNVNlRGJWWUlrMTN0alhGM0tJcHlMT1AzKzgraC9tYldw?=
 =?utf-8?B?U2tEdzVWSUZFN2lTRlRRdnd4ZjZSbjZVUFlLSDJlaXhpeEk3SFE2dW05VEJT?=
 =?utf-8?B?MnVPK3FwS1Axd1Q4Mk1LVUpjRlFsREJJOUJxT29xY1NXSG9wcDIzWjRycjhz?=
 =?utf-8?B?VlpWRW1WME5lTEZNbTNOVStZU2U5K3BpYVBrcWdUZnJ6TDNDTWppN2hzcnVL?=
 =?utf-8?B?dnRlM200ZnlIdFR5eXo0a1RDRTFwQzRYOFdldWJTS2ROSi9XT2x5cDJheVBH?=
 =?utf-8?B?bGNqcElVa3hrT0RLTHhKWWVocEhlNXB1cXJmemhvSWFUSUpodEk0bnNXR0Rp?=
 =?utf-8?B?cnZRR3R1UkFINWFPMTVZV0Jzb0JCOWJIdGNlbWhDZEU1T3JsekV0bmZYeWUw?=
 =?utf-8?B?SzJEY1lRSFBOb0Z2STQwdk14V2R2a1BoU2RwcUorZ2pjSHRZZlRtaXlGdDNm?=
 =?utf-8?B?U3hHclA5VWpDMmhyUGVLU1lYSXlybDJsTUUyZnlnZ1RUNkV5MWhIK1FwbURW?=
 =?utf-8?B?QzU3aDZZL1VFcEFBUXIycWJMSHJCKzRYNkVKbEIzU21laGo5NUFlcXdXdVl1?=
 =?utf-8?B?QktBaW0raUJ3dFBLZzdoYlppeWZRSnNKNDhNUTNXeDlCZk82V2RWWDY4cU1V?=
 =?utf-8?B?bFRkdEw0WXl1VEQrclNaVUFBSHliUW5la0YyNk5CVVk0UHVtOVRZd3BlRENC?=
 =?utf-8?B?R3U3bUREUFlLMEJSSjgxbEFRM3N4VG45YWhQM2ZSWDZuZVk2blBlcHVNTHBv?=
 =?utf-8?B?NGViaVhVOTdOM01FbjNyVDRGVHdvWlRhczkzQmU2bThtSGxPWTdaRXQ5K1d4?=
 =?utf-8?B?cm9NUmFHWXFqU25TeUg3VWw2TWQzK1pnVGl0ZXBIQnVVcUFEWTQ3T29LNFdw?=
 =?utf-8?B?cEVlZHZEaU5ZZmZsOWY5V3l3QjZpbzFpZEIxbWQxRjZLMzVMNGNYTlpjcUNn?=
 =?utf-8?B?aENYVm1ZL0ZOSGtFbFZWazdnWEpHanV1cUFzek85YnBJdnhPSTQxMDgvOXdP?=
 =?utf-8?B?MSt1dkJiaUQ0WVI3cEx5MG5uRlk1VWdkM2RYVE1mdWMyZEt1cjlLdG94UDQx?=
 =?utf-8?B?ME5na1d1WG9KYkVNUWN2ak1Rb1lKa1hFUndkUmFtVk8remRsd2JnbGFXSS9N?=
 =?utf-8?B?MzZjUW5uWmxzMk40eHdMbFJDYUFON1MwNy9iV29HR01adXBnN2hZc2VuZmtD?=
 =?utf-8?B?MHU5RFh2Z0p2eTM1QU1vSGJ3dHplUEd5ajZiN3J2WjhLcldwbjlkSHVFcEpx?=
 =?utf-8?B?UVN2d0NEemRWRmdQd1ZPdEtTM0xISVZHUEl3S0RRRjh2UGZkYXU3djUyaisy?=
 =?utf-8?B?dEI2NlBna3NqcTNvbG5nQUJBeWtxL0RCdkFTVEZINEsxSklpVmZhQmFyV2kw?=
 =?utf-8?B?V0gxeGpmR1hYblEwOENFZVB1ajZrd01IcG05S1VqTnZPNmkwQTYyTWJqZU5Z?=
 =?utf-8?B?akFmcm5Kak9IdnBZaElGSzJlVDVtZlpLczR0TDdxdW1BZ3h0UGY4RzN2WTdn?=
 =?utf-8?Q?SidioULXEf20/cvsUQG76gMiG0jGf2DQpvUT/Oc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d29f0aa-d784-4b58-77e2-08d96241101a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 12:09:43.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2E6uFLAZcgFkIWpTTu6jnVtzhYT4QuBkuBWcQyC/vXMpG/7+y92uIPHN7PoL32gd3H7RRNtMQkH6Ytq7bfKRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 18.08.2021 12:51, Jan Beulich wrote:
> Paul,
> 
> back at the time I did already question your intended meaning of
> this flag. I notice that there's presently no consumer of it being
> set (apart from yielding non-zero flush_flags). I'm afraid this
> model makes accumulation of flush flags not work properly: With
> both flags set and more than a single page altered, it is
> impossible to tell apart whether two present PTEs were altered, or
> a non-present and a present one.
> 
> VT-d's flushing needs to know the distinction; it may in fact be
> necessary to issue two flushes (or a single "heavier" one) when
> both non-present and present entries got transitioned to present
> in one go.

No two (or "heavier") flush looks to be needed upon further reading.
I did derive this from our setting of "did" to zero in that case,
but that looks to be wrong in the first place - it's correct only
for context cache entry flushes. I'll make a(nother) patch ...

Jan


