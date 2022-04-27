Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D402511200
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 09:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314409.532472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbm4-0006qy-45; Wed, 27 Apr 2022 07:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314409.532472; Wed, 27 Apr 2022 07:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbm3-0006p3-Vc; Wed, 27 Apr 2022 07:07:43 +0000
Received: by outflank-mailman (input) for mailman id 314409;
 Wed, 27 Apr 2022 07:07:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njbm2-0006ox-Qv
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 07:07:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baa00c15-c5f8-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 09:07:41 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-OgBtSbAbMhyJyoJMcLcegg-1; Wed, 27 Apr 2022 09:07:38 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR04MB2962.eurprd04.prod.outlook.com (2603:10a6:206:6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 07:07:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 07:07:35 +0000
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
X-Inumbo-ID: baa00c15-c5f8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651043261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lb9B0eYhSQb3LyWAZxhNXx7pYUyYE2DyU1ePw2QmiEM=;
	b=X+PqnXG3+RnqTk+bHJQl97ec5ZukD15JWC4jLwDpia+2p6iZ+FBbv8lB45XGUPM/LJvksq
	q63tDVmlYDITT+4fznZyldaFjeH6U8mnHlBJUMMQINGVlk9zILMsQm4Lh/FIPwG+RCSmCj
	Lh+CwQ6rR3rSjCN5h1lcs/2NkJsB4pA=
X-MC-Unique: OgBtSbAbMhyJyoJMcLcegg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVFQfXfJ5f+/jtXeS3nr1n0oLLokXF7mgH/8glcxfQoYbVBVyrQzQ9MbTQLx/LX2+t8BPB96WSXytv7/UrG9hIK97iMjJ5HGD5EpQH7JhopAdEyKpfogyoE697m0p7MDs+soS2vaf6mmYQss9IrV5e8ZDcU1JHb/Opo/XA+aVDKC2uqOLiaRZNjKBvFFqx2iKXkxU9n+luDrc6FUbyf5VZ2f0yPJ8E8qbOJdF8SrShym/2BMGfdZ92tYYsh2WUU97l0baY+MZEDlqaVRCRnfnnp7AiE3oEML+2p00Tmv6qNy/KVQRvNMo0P3Av86lYAKUo9zdlczW6qp+HW8gsIWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb9B0eYhSQb3LyWAZxhNXx7pYUyYE2DyU1ePw2QmiEM=;
 b=iW7bN/4HTa5cCqPFbAHtraUdlIaykvuStFQTOr7ISczZmPz8TAq9p+xBDt2NHotuWQlgmX2cO2LW9IFJFMFlGZHMfBpHesGYmydGf9I/9jhfmln7whpcPP3Io4R5083LNFcW+Xp/TCE+gSuZTFZl1dSd+FRuihqI2OYkuM8NhJaVpCv6jaUp52nbkItpEkFSJrCu6QkyrmXEFg/ngHU47zZKsyziH6RXimR+eRI0u57Z7EEZ9CXbkzXItWN+0hIRD43h2puUPj5nOD1/Xy+OESAjnQDZqjsYW/TWO/LZzztSRDMy2Bou8qPz0Jq+MM90qVde3+5c1ksp8Z7gJP9fVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6c2b3b5-6eb4-e094-fc9f-5214f8c12df0@suse.com>
Date: Wed, 27 Apr 2022 09:07:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5] x86/vmx: add hvm functions to get/set non-register
 state
Content-Language: en-US
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Tian, Kevin" <kevin.tian@intel.com>
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
 <BN9PR11MB527638D2BE6087C1A4D796D48CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB527638D2BE6087C1A4D796D48CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0489.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15eadbb1-39fc-439f-42c4-08da281c9b66
X-MS-TrafficTypeDiagnostic: AM5PR04MB2962:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB29629B9D40FBB98B29C009D0B3FA9@AM5PR04MB2962.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K/dGHFK/RAdUKtRx3/NQC0aBg99VGagiX1OiF/A4frLhummPEaSU3mJNcozvw19GOYq88B/shzIuuUMiWLQYoq68mYaOpX1F9D32XrrwD5PjFM/j8rCo3i9PHgJi9RzG/tNnbTDr7SjjfoElJn+tsbtfynL4r6E1PBlXjypnumO/w8fHxW+1Dd8CB5ZHGoNwikGvlWrYiS+5B9Tx0H8oUDRrhudCjI46AKp0hC3PYinQ69/9HwGigzWghu765HK6PqEPsLQHn+ARtaCPPwnoAmzSrFg64Yp/PCtuj6X8vBOp1unpsD08vcSEEHRpwXny7oUhrV+iysXISy0PJV+/62NnV8mzeIT/afF841awiZxONLrEYuCHkkLe2bJ0FApSdi5AnDYwFAf2bb72qh58gS7oqLQPFpT5wv6CrPs+VsRp8EruS9wFe5CR50IcwQw8VTsAaaXIybnxmZXMXO/i1nZ6F1oc8TF78qKN+ALqXhmFeuxjyHeVtDu39f1jkfm0SkBbIHYtl/0jaYC8wBBROAO/PAqWLw6LsRY0xOpZPdg2YkaHxaZ26nZ36pwcyAkHWZeNeS/DZvKFWxjNK10qUFrM1J2xyhxhHo8/6XsBJsQQSie03T1xj2GnfH7stgM963f7hcFudJrC5WP30PfT6IhgM4D6SECimVAMvgQ0oRgRnTXx1GugEhUMcBXYSNvxMJci5toBDei1TKpHfRw9Akp+MKwh4PrQFNXMjE5fkr3iWuh+v7Cr2NYVEZhTjSqc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(31686004)(54906003)(26005)(6916009)(38100700002)(5660300002)(6506007)(31696002)(53546011)(4326008)(66476007)(86362001)(8676002)(66946007)(66556008)(36756003)(2906002)(8936002)(508600001)(316002)(186003)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2NLQWxSYURPQzYyR0FvVUVGOW1KWTExczRwN040Yno3OW5QV2ZLOW1tN043?=
 =?utf-8?B?N2lBbnFvL0JNek9lenJDZFJDbTBhUFJReGpSYTNIVXRSQ0NhQTdDVWFMRXFn?=
 =?utf-8?B?djluZkt4ZjF2aFRyT2NZc2d1TlUwM2FYWWpxVFlRbDMvUDFPYWNhTGhtV2VK?=
 =?utf-8?B?eEZwZGRQNktSNWY4WFNwbVd4WFRmV2M4b2VyWnZRMkpCQmprVVlUT3MrdFhT?=
 =?utf-8?B?MUNxVEpwVnVEclVvRkxyQ3MyWkdzb3pXbk1xSWhqcXZxQS93TWVBbmFnZEsx?=
 =?utf-8?B?ZlpUc0xzdmw5NkNtL2xpbGNBV3hXM2lHQjlOQnU3anh0bzNkTTFoOG9nL2NK?=
 =?utf-8?B?Vy9ZM3o0dzlJNFhQUjVuVzBXQTFNcVRmVXV0RHNYektHcWwrU1RsTlBkUDIy?=
 =?utf-8?B?Ni9JZ2U5c3hkUTFIalZGUEgxL0N1a1ljRWNNMFBZZ0o3Rlh4R3VsaGdtMktr?=
 =?utf-8?B?R0tsVWtLUWFXQnROYmVBRkduR2h4djU4MCtraVZYRmUxU3BVdW5wSVZmM3NU?=
 =?utf-8?B?aFUwb1hidEZBTk9PUWJwL0tlaS9KSkNMbk1NT1o4dDFQSkE4dTdIZ2JrZ3NY?=
 =?utf-8?B?RVk5SzNsT3pHcHRaUHRYS3hmYStJSms1VDIwUXV5T0dBZ2h4Nml1UnJJbG5F?=
 =?utf-8?B?M0pLNkxFZFZOVld1TmE0cGMwMWFDWWxzalVHamZ1azVIU29pdXc4YkUwUW5u?=
 =?utf-8?B?bmgvY2c3cDZOTHNNQ0dmWTM2TVFFS1N4UkpmSHk0UDhpV01HVmNiQnNIT0lQ?=
 =?utf-8?B?WmVXYnVIcnZxOHBOWHorb3k3ajlZT2JuWnRGZm1rOXdrTVA1cW4xSy9XUU5y?=
 =?utf-8?B?c20rUGhSYlVwQTlRbnlibmNmSzQya2tjUEtlbDAwZ2o3U2R5OFJSdFM2emF1?=
 =?utf-8?B?a1UxOFJkazZRS1NuQ0Z4bjFmNnQrbEN2L3JnTGhCQkl2b0J2Z01kdk1tY3pU?=
 =?utf-8?B?OUhSVHVESG04NWtyZG1uQjZmZTIwZVBCNmhpUldoZHFiTlFhWDhPVHR1TEd6?=
 =?utf-8?B?T1NpRzgwajlZajBmNzZ6M2MvNnpOVVMxN3FLaE14UWdMV3FVSDJEbE5OaHdl?=
 =?utf-8?B?dFphcHk4V1F3bVhzY2hzNWk0TzRQMHNjQWJVRU9RRGpua0NmbkZZdXFpY3dP?=
 =?utf-8?B?KzhacWs5bzhFTlRkelhHNHlaNGZTT2NsV3N2RmhrRGFydGE0TUFpYUtCMEI5?=
 =?utf-8?B?Y1FCRjVGSjlKU1VMU1lmT0xTVWFuaTNsdmJWbnYyTURUWEhDTE5JV0RiWEox?=
 =?utf-8?B?bXZsWExxT3pld3JXVVB6WmRISzYrU0R2Y3prWUtCOGN0QWxoTjBSUVpaU0dM?=
 =?utf-8?B?TERFd08ySERQZlArdDVOeUlHanZPUkNleEJSemRsTFZuY2E2ME05NHhHYkxH?=
 =?utf-8?B?bFNkbU0vWXBaOGx0N0VNbTZHdFRPNE1HYmU1RlkxbXZkSXp6YWdwN1RaU09u?=
 =?utf-8?B?KzNRY3dEYjNRRWhZM3R2QTlQek9zeTRaVGU0QmExSTZQakZDOVdXeFFOK1Zm?=
 =?utf-8?B?NTBNZGp1TkYwUklkay9uaUVBUE9FbFBWZC8veEgzQ1drZENZRDJRRUR5VkRs?=
 =?utf-8?B?ODFmY0g1WFlTM1NhZHc0UmpTMzRzNWhEWnlNUkJ5cVhrTUMxZjhQZmpidUNM?=
 =?utf-8?B?Vjh5bUNqRUhVaTlYVXZwL2VPaDM3UUdVWE5vMHNFUzAvR2ZSVUFxeXRlV2Vl?=
 =?utf-8?B?SEc2TktjS1hjRnV1UERyU0FKTGhWaXBPNHB6SWkwTzZWNEh3T2ZNbVdOVmJJ?=
 =?utf-8?B?M2ptclg3cmJ1VmRwNXlWaEx0SHJsWVJhdGtDZ0c2YmJnYWkzei9ycm9kd0s2?=
 =?utf-8?B?Y1plaXNtMXZzY25GdS9WY3VxWFlQbXhwcHp0ZlZ3bG1oT3VRemxTUlVQSmFZ?=
 =?utf-8?B?NHdERGF4cVpFMDQweE96OGViWmZNQkpLdjhJZDBYSklXanE1Tjl4YVdVOFpz?=
 =?utf-8?B?bVU0eWE2Q0dSTlpsR2Y2TEtXeGgwZEhDeTZVNnNnc0FKUTY0WGREcGFCMnQw?=
 =?utf-8?B?MWdlcnMzR3hCUW8wQzNQL0hiVHk3VEhJaERaMWJPSnJtYWkxUVB3Tm81MG1C?=
 =?utf-8?B?TzZiR2hJcTh1Mnk0c3htNEZVRDhhdUFJY1RsQ3pUdlBGMVd4SlppdXZUcms0?=
 =?utf-8?B?SUE2UTZnMnp0VytPemNGTXhCQi9pb1JBZCtzUCthUUtmQkF5TkpuUFJMUmFy?=
 =?utf-8?B?K09SNXByTytUd2hZUzQ4bzhnUVZGcm9JQ0hZZzZVS1pVMHJOT296UEl3NzUv?=
 =?utf-8?B?aDIrV21UUW9Bekd2NDhMMURQbnNhTlR5RUFmQjZDSHU0QVBGZzZqcUk5aXZ6?=
 =?utf-8?B?UXBoQXVUTkhHZnZNSnp6WGkralIzWHlyaElaeUxNTFNkRjk2bzBudz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15eadbb1-39fc-439f-42c4-08da281c9b66
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 07:07:35.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wi64s7SDjpgrzzjv0NtNw1B2KYqLjVpDuidYQ+hXjSBz4ngjeqn2Sn6REqHjxbcsfeQYAQD67of1J20jU1pD1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2962

On 27.04.2022 05:46, Tian, Kevin wrote:
>> From: Lengyel, Tamas <tamas.lengyel@intel.com>
>> Sent: Friday, March 25, 2022 9:33 PM
>>
>> During VM forking and resetting a failed vmentry has been observed due
>> to the guest non-register state going out-of-sync with the guest register
>> state. For example, a VM fork reset right after a STI instruction can trigger
>> the failed entry. This is due to the guest non-register state not being saved
>> from the parent VM, thus the reset operation only copies the register state.
>>
>> Fix this by adding a new pair of hvm functions to get/set the guest
>> non-register state so that the overall vCPU state remains in sync.
>>
>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

>> @@ -863,6 +892,17 @@ static inline void hvm_set_reg(struct vcpu *v,
>> unsigned int reg, uint64_t val)
>>      ASSERT_UNREACHABLE();
>>  }
>>
>> +static inline void hvm_get_nonreg_state(struct vcpu *v,
>> +                                        struct hvm_vcpu_nonreg_state *nrs)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +}
>> +static inline void hvm_set_nonreg_state(struct vcpu *v,
>> +                                        struct hvm_vcpu_nonreg_state *nrs)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +}

... these unnecessary stubs dropped (they should be introduced only
once actually needed, i.e. when a caller appears in a file which is
also built when !CONFIG_HVM), and ...

>> --- a/xen/arch/x86/mm/mem_sharing.c
>> +++ b/xen/arch/x86/mm/mem_sharing.c
>> @@ -1643,6 +1643,13 @@ static int bring_up_vcpus(struct domain *cd,
>> struct domain *d)
>>      return 0;
>>  }
>>
>> +static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu
>> *cd_vcpu)
>> +{
>> +    struct hvm_vcpu_nonreg_state nrs = {};
>> +    hvm_get_nonreg_state(d_vcpu, &nrs);

... this missing blank line inserted between these two lines. I'll
make both adjustments while committing.

Jan


