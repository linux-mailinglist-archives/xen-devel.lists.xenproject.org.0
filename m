Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E254AF291
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 14:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269148.463153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmuK-0006oh-63; Wed, 09 Feb 2022 13:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269148.463153; Wed, 09 Feb 2022 13:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmuK-0006lr-1s; Wed, 09 Feb 2022 13:21:16 +0000
Received: by outflank-mailman (input) for mailman id 269148;
 Wed, 09 Feb 2022 13:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHmuH-0006ll-U4
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 13:21:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23a59e5b-89ab-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 14:21:07 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-ctLprG98OjSMGQh0dsGcQg-1; Wed, 09 Feb 2022 14:21:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 9 Feb
 2022 13:21:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 13:21:05 +0000
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
X-Inumbo-ID: 23a59e5b-89ab-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644412867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IrQIcCnh+uqnDNwC2NvysJnfMKDvli7VUYxc9MRsG/4=;
	b=ckxbaGc/QU68/G6vaMLq9hMBO4LalUasQOv7L8jegirxJoJz1E4Rul3Xc1sRYUXMMJt5mJ
	OT5PFjrE32TIEgtSdUp+yhQs8w9Z14TFZxpqOGbyMAqjux8mj9CQTgnxkHLy74pc4+jtHE
	vvrvEe5Keq58JJ+X+1lawUeymclk+u0=
X-MC-Unique: ctLprG98OjSMGQh0dsGcQg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFPKg1HOLZ2u+q9BdEdhfr+j2Z/vZfEp9Jh9eGp8QuTB/DuhvqN5js9z/TjQYbsaOoYAJhrUBnqYtsAcFRdF+OMF/jAOJkKgStCmJiSKZr3SgvUETiJt9DpvMqlnw/jYS0ZZWO0uu1hVPbjErTN0apvdEeJ2vqQRVsL3lTXxAWLgQD/5dXegwAJl3291zP9DgQLhtUdGqOCUFhT/YvsGgU5qmohP+1x1S0ItN0ZiKM8nBNUD/hkqWloh7XlW9sIqaV1fmacl4I+sd0GEfpxdpCnvtief1lWYuz6rNOcbfb6K4XDF2RoTZc3fuIkLVvG4KdjxuhFx2S2v3Bv4CWzkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrQIcCnh+uqnDNwC2NvysJnfMKDvli7VUYxc9MRsG/4=;
 b=DAFzG5f+e1Eiw2A2IBdHcogMby7Y/PgzanLFsOtrOMLXr1JZVRi+YgmczS6KZrPOA6wxNpEZVliiJ/5TbkjNfkLzbkSycifXF6fnlwdWmp1edtb2pp4E30wzQS6RMpwvUZa5hh3HCElUaWsrHNEcdGTTraQtjE9v4mHMLv2lfZFPrCsJNpHKX+hGuzmQEoTjN41o7izpmDNJ5TNTms62dLMTRvtYLKC5lDklPtDuKUUTftSNk4bmqP95kWRSGHE9BIeOyneZXNdRqP5HzCsJ5C7krHR3UaRJGsRgapcsOWw738m/1BKIut0eEQ1UiyjCPl9LpP/S4D5MOJsekJD4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9f41055-c7f6-ccdb-5283-53191d025a8c@suse.com>
Date: Wed, 9 Feb 2022 14:21:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 02/11] xen: introduce CDF_directmap
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
References: <20220127074929.502885-1-penny.zheng@arm.com>
 <20220127074929.502885-3-penny.zheng@arm.com>
 <6d73e9cd-1293-d2cf-5b61-d78246509a03@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6d73e9cd-1293-d2cf-5b61-d78246509a03@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0280.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e1a08d6-44b4-439d-98c4-08d9ebcf0682
X-MS-TrafficTypeDiagnostic: DBBPR04MB7690:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7690DFC5C565514C488A7FA9B32E9@DBBPR04MB7690.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Lrf/LdxHBAyYdPVN06VY4gmsnFwG7P2gma0kwv/sqj5L5KAjsfG/h1PWikTqAnF7AzZj+kWmpC5swU8as1ka1EmJ5bYh20m/hDSmlt5E8mmq5yYbSoxsmeb5WMGa66o9QvsaoXCK1skLvsL2InsjAkKTcVgMs3FtWqfc03ixPKYh+SqwsWp6a5MEK+JxCNO7Ohk6LByCA/g+9Q046a/JczibMSmDXs4/psSGvHo1/ZViIXa1Z98ulG5yb6PTv+QfGVqRQj3xgpdg0eKDzInVgpcyZLj9i/FzGwV3qBiDjyXL0cuiJ0FNc2TMj4501CTX11dVRrgWciDKiUHRumaBp8QAr8MFpnz94s5SCfL1LUqKurdaGR2q4jJwAnqzMkLSw4Ao6IOyNdrxn+xwGyGwPqw/R8GbuTCrxAIFHEfUci/VrTNVqyFRiI0zBtntsD3kPqmLxNpZ7vmujeNV2MMQ2SF3rOuirEm7I43hNc4gO4I2EYkNBwgH1HMVHOW4+spzrW41zCan1zjWWyYytcezwkiuujtenpVca/wEKAm5FuOWMzaDSWyUfNT7wgAUEExaFTmxqyq7Vl1+F+4i1wGJBAFfdbMSDR/kklOjUosoVIn11sSQRRA7dGIgN8H6y58kBu2f07e0mgC5lKXRIsq53jyfiQoWBKl7tgpkk7Gu7nKDokmVRyqk0eyDZcMxKCSWEsWs1jYRJzW4v1euAMf6JRFuKr/LktPsVIAl7EBpw9HbdG2kLS4e7YHJ/S4yvAm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6666004)(2616005)(6506007)(5660300002)(6512007)(38100700002)(2906002)(31686004)(6916009)(316002)(53546011)(186003)(26005)(31696002)(8936002)(86362001)(66556008)(508600001)(66476007)(6486002)(4326008)(8676002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTRvcEliWDdMTHNWUC85OFJTZnpNelVYZEZqMDIyK2E0K0RYZWJJdEU1cmlF?=
 =?utf-8?B?R2c0TnNYeitKcnNOa0Z0WXdmNVdmK1FTS3dqeUgvbkpPS1hyeTV6ZFEwakZ1?=
 =?utf-8?B?aDdHM0lKblNlbFlqSTJaTEozSEhGUVJ2MVJtbmVsZHA3UjUyRTZyUlVLWFU0?=
 =?utf-8?B?MHUyR1RTTWNEQ1c0TzUrQ1VEVUxTTWxHelJUR2lsWXdRdlZRZittakRKRkNi?=
 =?utf-8?B?TWUxblcweFBzS1NidElpVDNoKzJYcHIzT2RQZ1Q5VzVaV1ZkZnZOTXVjOW55?=
 =?utf-8?B?UGQrb2Nlc0dsdC9QN1dJWTJoWnVCREZTRUVpMWVBTGNVYkNQU2F2ajNuVGEx?=
 =?utf-8?B?Y0hodmZsYnc3TzllUmhqck1xU05JejJwc2ZlNForNUhMVUhyOU9rak81aFc0?=
 =?utf-8?B?SklhcEpqSlhKd3ZHU0ZvZFh3dEJzc015M3JxVVdrYk81M2htdFlveS9LUUtG?=
 =?utf-8?B?VTQ5aTd0T0MzMW5FU2ZwOGFrVWhyK3ZWMW51QWRtbURld2phem1kTm1xWmtL?=
 =?utf-8?B?YU5JZVZicVMweVJqUEVuYVJQUUpTZy9RUTU3bkdLVVllWG9FTzVvTmR0U0l0?=
 =?utf-8?B?KzYvOVhzTTgyWDJBZk5DNXJ2NUltYkM0Q0VqdW02SStDMjc2NjJQZWkwRkM3?=
 =?utf-8?B?V3hYZ2pQSXdqaTdaRmdaYWtXaGdKSXhjM3hZTzVCUStSS0VLNldpUVlDNm45?=
 =?utf-8?B?VjUyTklvREFwY1ZzU3pLUG1xSmlqUkxTUENmZ1JzdkZwQzZXNnlYSkk3QUE2?=
 =?utf-8?B?YzhpRkYyc0FTTm1wODBvSzdZK24zRG1lVHV4V0lUWHNseUt1UnVCaDUzeVBp?=
 =?utf-8?B?eGpWbjV0c0oyN3EwSENBUDBkU3ptUVdhZ2NHQUF6OWhONzEycFNEcnhCenRx?=
 =?utf-8?B?aUtHdGdoZlM4cHhHaVhsQi9jbXlGTXFzWEZQbkZKRzFLZi8wcGhmUExqd3g5?=
 =?utf-8?B?a0t6OFRZaFB6bzhPc0ova0ZxenR6NDVJS0lrbVVqSlU2WjA2NFNEUHpiTzIv?=
 =?utf-8?B?UTllM1d3bjgzNkZXdktEamZ6QW9KNU10dGpJNjJzQmNsTnVtekJVZmJ5eXhh?=
 =?utf-8?B?UTJiR3JEdHhySjhyUGhCbm05dStyRGtUOGdsWjdSaEIreDFuVnZSaHV2SmNO?=
 =?utf-8?B?TUNPNHM5OThNTncyK0toeHdUT2RKSE5LQlBWWGoxdE1CM2Z5YVpWYzZ5TUlT?=
 =?utf-8?B?R0dZdGRpcGFQUUtkZmlpcS9oRVhhMjhFVXAyZ0s3SzhYYTBKZmw2L01ocjYy?=
 =?utf-8?B?ZWU0WjRZSjVDb2t4T1Y3Wk42dU8rMzN0a3kvNHAwUndhejQ3U0VvUU1PRStF?=
 =?utf-8?B?bDU4aHozeUZFZXNTalp4Q2FpVUtoYnRZT1BVSFVCQ3VHQ2R0U1h0aHY3QXJ3?=
 =?utf-8?B?VFdpTng2Q3IrOHpDWHhCb1VaMmFEemNUemZ0TU9uMXRYVGphUVRPTTVMT3pn?=
 =?utf-8?B?eTVxdldGTy9FNTQ1dzRVUDJjK1VuekJzOGZQWmhRa2Rxb2lvN0o5em5CU3NX?=
 =?utf-8?B?SUlxelcwa3Rza1pidDFTSGtHT3B3akdNRURXcHNIeTFzak8vL2FDS1JrbjZI?=
 =?utf-8?B?Tmk1dGFhVXhPR2IveGpraHJwMWZBMCtZMVRBRjZ5aFhFeklXbWpYeE5HSXE3?=
 =?utf-8?B?cU5LcW5uYzNIcGt5ZFkyZjhIaTRVKzEvWC9iR25NOUV6eE9UUW0rYUE4WUl5?=
 =?utf-8?B?TTlKZnBQWkk4OVpRRjdzVHJTT2Z5bDkybFN3Q1o4bU1ValNnY1R1dHpiL243?=
 =?utf-8?B?ZFFOS0lQM1BJN3cwZWFtSWZXbkZ6VXAyZkJWcjdONTU2aGxzM1lETjBEbXA2?=
 =?utf-8?B?azEzRDhQVE1BTHVUNy80RGlFeGNWRE1HL3UyZGtaN3JUV1JaZXEyMkNNeHlN?=
 =?utf-8?B?dzU3YWhYU1pxaHk0UEt3dWV3dmFRaTdwR3JCUWFDNEFrOHVNZms3aE1HQTFu?=
 =?utf-8?B?Rzh6MFpMNzFOY0x3aDVCMGx3SUY3T2tXNkk2SGoxMU5lZGIwb2NuQXdVVldB?=
 =?utf-8?B?OFR2M0E3N1QzcitvN0pGZzYrZ3VpZFk4SHdoMzFrUUl6NE9WQlBXNk9PcGlx?=
 =?utf-8?B?KzBWaGZGb2YyNzVXb2R5QkNFOWxLMXhwVVU5MlZ3YTRPbXJwMmM2SVhLZTF3?=
 =?utf-8?B?TUM3bzZ1MDNQQUNHcW1MYzNKalM2T2dPSTczak15N1lzdUpOWkhNS3dkVjFm?=
 =?utf-8?Q?P7EEfOG7c7n2f/lc5bjkA60=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1a08d6-44b4-439d-98c4-08d9ebcf0682
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 13:21:05.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jy31YiSsLFqivopbnfXd5/RyEdUFDJUUIZTD+/5XHfOdP88go+AcgqSFgCRbiZWkVW7fuloka/lOkGQrOrfKhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690

On 09.02.2022 13:42, Julien Grall wrote:
> On 27/01/2022 07:49, Penny Zheng wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -722,7 +722,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>>   }
>>   
>>   int arch_domain_create(struct domain *d,
>> -                       struct xen_domctl_createdomain *config)
>> +                       struct xen_domctl_createdomain *config,
>> +                       unsigned int flags)
> 
> Shouldn't we return an error if the flag CDF_directmap is on x86? The 
> other alternative is to...

Hmm, maybe rather assert that the flag is not set? But ...

>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -31,6 +31,8 @@ void arch_get_domain_info(const struct domain *d,
>>   /* CDF_* constant. Internal flags for domain creation. */
>>   /* Is this a privileged domain? */
>>   #define CDF_privileged           (1U << 0)
>> +/* Should domain memory be directly mapped? */
>> +#define CDF_directmap            (1U << 1)
> 
> ... protect this with #ifdef CONFIG_ARM.

... I don't mind an #ifdef here, apart from the general concern over
CONFIG_<arch> uses in common code.

Jan


