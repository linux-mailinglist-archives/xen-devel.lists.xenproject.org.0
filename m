Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B998142C047
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208401.364508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madZv-00041D-Ea; Wed, 13 Oct 2021 12:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208401.364508; Wed, 13 Oct 2021 12:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madZv-0003z3-Ba; Wed, 13 Oct 2021 12:41:51 +0000
Received: by outflank-mailman (input) for mailman id 208401;
 Wed, 13 Oct 2021 12:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1madZt-0003yx-7y
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:41:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bba4426-6096-4c68-a898-54ff7d123c4e;
 Wed, 13 Oct 2021 12:41:48 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-zcaSWsxlOT-4IsphOj98kA-1; Wed, 13 Oct 2021 14:41:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 12:41:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 12:41:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:20b:489::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.26 via Frontend Transport; Wed, 13 Oct 2021 12:41:42 +0000
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
X-Inumbo-ID: 7bba4426-6096-4c68-a898-54ff7d123c4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634128907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXJy3Yc0VlLtKDC1/od/Qu3vi8h1dQ6pxGZx4yZk6FQ=;
	b=g3FM8eFYei1vBKpiSFjrBdu11eVbZ0TSTKiNlB800Cb5xBYdrZRpuWzbeI4ko4fUQPiFp/
	mkOq6mfdCSZ1Pyoo4BByQ42hqYfC13WHlO7XtnHiSNTX01JC+XbQxy8vcDNEpBfDiQ3UpU
	jTMKlFvtn0uIaMiO7lZ5/rVhi4jJeVY=
X-MC-Unique: zcaSWsxlOT-4IsphOj98kA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmUIgWgdUUbs/EWPXHfQ3FPfSo8ibT+DjfqNz0pxV5NhmZ0TBK3tBt12trCND25YVfZxckjPPQ2XytgMV+Q3qvgPx84TEP4G+s8zcScaEf0SuQ9Dm/Bwa/vNDODemGn1sUT/XAmsW8I7fHU40eMQUcTeI1/bb3I5gYoktmgS6hCIp4LISUQOEpGontgRNND+XfAeZYJw6Nr8PpCv2x+j2rMX9jf3og4lGlbm0X/UkU7PSBftLNpil1hv42CzDVY460kbAXKTu1AauuMNqEXu7U4ZsTuk3BIsKzop5WVMWd3Ct4Qrthdn6DQm4GM2/vdTLYrM3NygHYYVoRJHhr5/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXJy3Yc0VlLtKDC1/od/Qu3vi8h1dQ6pxGZx4yZk6FQ=;
 b=NspsEGnEhzek9pNN196TpMBxuYpqGzcd3k6h7I7eCRdbtEP+E350IR+UYhhwGKomyI8J4mPK5Ak/Vli3/5i6QvmURrowyk2ofqFmdFXPtjgL5h/DppBUYZn3tjkjPXFS4TzVpl0DAHaGtzRk2tzVzH49N4boPCgp3oVGKnKSakbuch3XVfBGTyJ9zqgcZpTwc6vh4YcmezzBcB8Y8sfgUahM2jeFDVrcRtAOdntA46M1hrjQWS8CLUi1Hvm8l0+vAuimdGmC9DHC6+ds0rkUqNDgNECUjxf/39EPDzhzFD/dFrhh0fOwoM/E9iFx7a6Xk7o+RUvv75emPg8jwSb2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 21/51] build: set ALL_OBJS to main Makefile; move
 prelink.o to main Makefile
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-22-anthony.perard@citrix.com>
 <304c1ddc-7bbc-e942-4c5a-8395a750b13d@suse.com> <YWbRUNgGX0sEHMUo@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b7b6c03-3de8-ea9e-986f-d999665012bc@suse.com>
Date: Wed, 13 Oct 2021 14:41:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWbRUNgGX0sEHMUo@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0034.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3612e1cb-5fbe-443f-757c-08d98e46cfd2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3776042A9BFBD09EC62C6E48B3B79@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w2xqt6re1O5CkNrxd22zrk0IvM4CqW+VSuwmXL/zzSD76Fr9b+k3KBcrCy5Fdwuh3SvsopqEaU7IrJBCuF+Ny2EO6Xy2r46xTcOq7xtx9h7zYimNnvkRE3ErKDFSMyGJIq8vUBeg8mac2wwLmYYiFzi7rrpjJAhnwd99iEKMjy26ObxvYLc/tVVj+sR/5O8rSxIj3PRG5ab/JXitOmpUbx6cS7hdLe8LhcVh80dp8IZQJHiA1prU9QFj8zaFuUiGcH36GX0ocbA2yvD/ajr1zg/at53HpuohcPJ1B+XA63H0Rsz5eaqov9gHHTLR0t4QSXyq4l6yY1mPVxPHm6yYEvaWBPbuNNJZkEAiNzOWLbs77bvCRcDPulvyDUmHr5YVVuC7NmiS2sCaQVnTnE8I9UVwnVcE+5Mg6BzK4cWc5AlG5/yasJiKPH1lyh4TYpUU8zfk24nhpPZ/0WuI+YJ683dTCTwVN1+5Ia5r0lE/x+ibN2yifstN6TtdyEt86zM4QNnsqLPdAZv65flczkHrFbaP5Du85MDlg2V2IQ8Mx6XrYAG5fp04+2mJtJdL2LgM1hJ6dpcoovBSV/wSuiEEBqwaeqxI20JhulQgZTfzZjEmatUsauP4Rgpk/g3AxDRuh/CEMHSPjXXoVWK/PZfETjvX7sFlkACbPgqC9EbzBzsCGcTPrMbxocFiUw9YsClZcLxLXQhC7FydZaDYVDb0KuQNtEnz8GlWob+4tjHI5c8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(5660300002)(186003)(6916009)(4326008)(66476007)(26005)(7416002)(8676002)(38100700002)(54906003)(2616005)(508600001)(316002)(956004)(53546011)(8936002)(6486002)(31686004)(86362001)(16576012)(36756003)(66946007)(66556008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0ZWSXB3eno0Y3V3eEZxQTJnOFlIMy83RG4yVDRjdXVjQkhZdnBSU1JROGVu?=
 =?utf-8?B?cVNNRjBsSFN0QjlBU25PMDNPVmVoSG1jOTc0Qy9MczhjNEdOQmh0QU9GQ2pI?=
 =?utf-8?B?TzRvUnUrcTNOT0tHaXFCSnVzZnZmTkVMR21CYXpuNmVjdktrK3BmMU5ELy8w?=
 =?utf-8?B?QlBzYXljV25TTXVKUDNKd3R1YlMxR21INHg0dkdOQUEyTDczUGxrUlEyeUNF?=
 =?utf-8?B?M3k2ZFdESStEN3dkYjhMdDFvZmlRajFOKzZsdkN3TFJGS2dERENWMFkzZzFS?=
 =?utf-8?B?ZTlGdnovMU82N2owKzZ3OHVhMVkyeVhKMWZXS21hL2t5SUpNK09ERkJUMVpn?=
 =?utf-8?B?WG82UUx2c2ZjcTMvOUVza1gzeWpJcGtZdVVVOTE5Y0I4UGpMRXNKVmZSMDRr?=
 =?utf-8?B?QTQydlZHM240NVEwem9BZmQyM0d1WnM2REZrczlPTFRjM1R1bnRDaE9sWlJ4?=
 =?utf-8?B?ZHBuOTFSc2gxNDdlMHFkZnk4bWlhZU1YdnNuVWNaSlJLZk5rU0tvZ1p3TnF5?=
 =?utf-8?B?Uko0S3lTR2JPMExUUjhTM3cyczVseXEyUVU4eWNGRTNVNkovT09rZFl0OGZJ?=
 =?utf-8?B?dHFXNGpncHlQaXBxYytBOUFvMXpnSlA2N3Y3MVhSZHd5eXFEK2dneWdOMGVU?=
 =?utf-8?B?aS9NRGRSY0QzMHBGT3ZsVmRiZTkwVExoY09DaFdjTXJvbzQwajRHVGxoVXBN?=
 =?utf-8?B?eldEZ0x2cTZwd0toVE5iUGpRaVIvdWZzeXJlcUpoNU8zQS9aMXhIU2pJYUpV?=
 =?utf-8?B?TlNKbWtDbkdhOTBzTEhvRTNwRVJhNzZjdmpjRXNGYzdqWFU3b3FsOUxYQSt5?=
 =?utf-8?B?Y2tXSERmbCt4VTVkT0FId2hiOExFdno5cU1LM3F0TDZSTVBoaWgxWXk5SWh0?=
 =?utf-8?B?YUJPVnA3UDFNWld5WVBEUGFhTWFNSWZ5ZW5NWTVhaDFHejROTlZ1SmNwdm5o?=
 =?utf-8?B?QVdUdEF5WFJxd3VqVFRKL2xmZUU3TUtTUWMvVlg4dm1FYk01VXoreHdGL1Nk?=
 =?utf-8?B?WWhKS3p2VHB0ZTZoVkdsdDUxNyttNFpCQUJiRG9DSXFRVHMxMHNMVS81YllT?=
 =?utf-8?B?MjFxV3J4MSt4bms2V2xPNHhaeS8vMzM5VGRXOFpMSDRXOWY4bHMzajFJdldR?=
 =?utf-8?B?WE9SUGxzcUxxLzlnTW8rMWZLOTVvVFJNSS9XRDFhSm5TWTh4dmY3RmJDQm1j?=
 =?utf-8?B?NDhHSmZhbEVrejV2RGI1VDQ2WDY1TTBId2ZCeWNwdlh2ZTArS003SUJRSjl6?=
 =?utf-8?B?NnFaRDRCUktjQ25SWWg1WDNOYkE2YXUvT0sxL2JNSHVtZjBBei9adUhMM0JS?=
 =?utf-8?B?U3UvRlJLL2pUMEtOc2c3Ylh2MytVRmFSQm52dnYzTW9hRU5ybENLV0ZqMmpF?=
 =?utf-8?B?d0cveFlBZHJwYnB5U2Y2MXMrRW8xTSswbkY5TUVLYUxqMXBDbVdzajBzK3lP?=
 =?utf-8?B?VzRFZHA4QlFoTk15dTI5bGZpSk1vTVhNdklwUFpMMS8zQ3NuVWpnSzZMbW9I?=
 =?utf-8?B?dWQ4Znk5WXprS2ZpNU5DcFhkT1lEUkdFNjJWSm44R01mMU5OTndRWk8xSElo?=
 =?utf-8?B?bHRtTGtuWmxMNnM1NWxoWWdaOXpISG5iZUxRbzNiQjA1NjZ5NWpoQnVTTTB5?=
 =?utf-8?B?TkxacXY4Zk56NkxBcUo3TUYzTFB6NEJtZC9WcFlQQWhZYlJOZWt5cHJ0VlM5?=
 =?utf-8?B?cUdMMHBiM1ljd2xLZnVtWVAza3BCaFdMMzU5Z2l0a25aN0E5SXFUcmdUcWZN?=
 =?utf-8?Q?P4NQ0W4uJOAcf9RQYkGlx9O9AZeqZEEpuGg9EbT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3612e1cb-5fbe-443f-757c-08d98e46cfd2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 12:41:43.6336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqqUkbbDPy7PyRV1c+AXTl7/B7kCSa49TTGnCIJwh+C5muy2XOPI7XskoeteNgeF13R2R+K98p3xhjUbfp2brA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 13.10.2021 14:30, Anthony PERARD wrote:
> On Mon, Oct 11, 2021 at 01:31:59PM +0200, Jan Beulich wrote:
>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>> @@ -393,7 +406,7 @@ $(TARGET): FORCE
>>>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
>>>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
>>>  	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>> -	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
>>> +	$(MAKE) -f $(BASEDIR)/Rules.mk $@
>>
>> This merely results in what was previously invoked from here now getting
>> invoked from the very bottom of build.mk. I'm afraid I don't see why this
>> is a useful change to make.
> 
> Would you rather have this following change?
> 
>     @@ -393,7 +406,8 @@ $(TARGET): FORCE
>      	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
>      	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
>      	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>     +	$(MAKE) -f $(BASEDIR)/Rules.mk prelink.o
>      	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
> 
> That would probably be fine.

Hmm, perhaps I'd prefer to avoid yet another $(MAKE) invocation. But
your reply made me understand why you make the change: You need to add
the prelink.o dependency to $(TARGET). That wasn't obvious to me when
first reviewing the change.

>>> --- a/xen/build.mk
>>> +++ b/xen/build.mk
>>> @@ -56,3 +56,27 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
>>>  	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
>>>  	  echo ""; \
>>>  	  echo "#endif") <$< >$@
>>> +
>>> +# head.o is built by descending into arch/arm/$(TARGET_SUBARCH), depends on the
>>> +# part of $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and
>>> +# build head.o
>>> +arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o
>>> +arch/arm/$(TARGET_SUBARCH)/head.o: ;
>>
>> This previously lived in an Arm-specific file. Moving this here in the
>> given, still Arm-specific form is imo a no-go when done alongside all
>> the other good changes you're making. Is there a reason this can't go
>> into xen/arch/arm/arch.mk?
> 
> This is temporary and it is removed in patch
>     "build: build everything from the root dir, use obj=$subdir"
> but I could move it to "arch/arm/Rules.mk" I think.

Moving there would be preferred; if that somehow doesn't work out, please
mention the temporary nature in the description, or else I (or perhaps
others) would ask the same question again on a future version of the
series.

Jan


