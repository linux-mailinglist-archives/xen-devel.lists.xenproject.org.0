Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6E752CC53
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 08:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332735.556495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nra85-0005jT-U6; Thu, 19 May 2022 06:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332735.556495; Thu, 19 May 2022 06:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nra85-0005gl-QX; Thu, 19 May 2022 06:59:25 +0000
Received: by outflank-mailman (input) for mailman id 332735;
 Thu, 19 May 2022 06:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nra83-0005gf-Rr
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 06:59:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36687cb7-d741-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 08:59:22 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-QgKjtH3-PoqWj8Jcpzz5cw-1; Thu, 19 May 2022 08:59:17 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2294.eurprd04.prod.outlook.com (2603:10a6:4:46::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 06:59:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 06:59:15 +0000
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
X-Inumbo-ID: 36687cb7-d741-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652943562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvDDzknZzMcxfntwIJvK5bXWbo7dri2NsUaVwghPuUQ=;
	b=AHr4KaJmSVud2SVEVBu4GPb8T8rIMw1/ArdOFTGeipUwDO3QuPzpUiWBU9Zl2rHTxcaNC+
	3HBTtI4qrj6Aaz4nqoQFUKtpY6s41lixiBw3GeVk0BOym8VcUlTShjBrHn3jkchkY8hutS
	EY7Mx52zonykSYqEiG6n/guVuzcUIuY=
X-MC-Unique: QgKjtH3-PoqWj8Jcpzz5cw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqmds8or1eBAMD/mpQcf4OreaFB4GyoZtP3tml2x+XFCJSFuvEwbs4acOwfTkvIKRnrYjWelzb9fe1M5FgGgYVDCBx+EFakM6uXZxiSane8QjF9WQ7ji6jrQLGUrVXbsJBpayjAhFzwsVKyCMCuHajdtEeICqn4ZBwUFd41s9V0CICNTh9i0fqc06+JE41rxWP4RHGkFlgMxdRvHJxRYQjoKnabUtLq9rG8da1Pn2XrsRy4exfKgvWNhElRQLFUk8SNIsTe4grCcqmg8hjfSw0zYeLrZLzQ8BDXVL+utIzK/GL7MCgoNjMUrPJFM+84AKaOKR6hX9NUZKA0tJGyfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvDDzknZzMcxfntwIJvK5bXWbo7dri2NsUaVwghPuUQ=;
 b=A12kr4qG7XHtd16zrCwcNI9UN3mwDxnjsXHyqbf0j+n2x5svNDQWDoXF69EvNMjVepMUc8lpM2Fln9Vl+EHxFPA11EL8PO6E61ckH4Se99GT/jHEgu2dsV2Fup29nd/bT4kbKCUIapdNm29dFiXw/rJuNqnUPN3fFtpomZFqi9uBzDA/JXS9hIflcoWd8RsL8Ore07/232EKW9qTMS56sk4dTCSnSPCflIb+sZcuxoHlGM078UozkpS+3jkKOlnAITqGDEy2x4gH5I66gJ0tSaPcyjolBTt4cGZo9JBcexVcqL2DeDHJjINcbQqw2waL9/kDrmvLeuWWQPUc1Fd0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5001ec3-f0cd-dd9e-a18e-c7e5788c0668@suse.com>
Date: Thu, 19 May 2022 08:59:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-3-roger.pau@citrix.com>
 <ac220eee-937a-bedc-509b-bcc75b376001@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ac220eee-937a-bedc-509b-bcc75b376001@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb96770f-e95d-4a5c-bde8-08da39651625
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2294:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB22944CCF2F69E880F5AC6430B3D09@DB6PR0401MB2294.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L+O/YD9Ade3ERgbCcckgNUBoMYkraNGlJZa/yr/SmTfSvKJLL1H67hijpyDx1VgmA35JczNjUqXXxG+ja/1/VPQ2c8GsSdf/avjyT5X1zTPTBrHKnxwfMrntGLL0vpo8Y18Yhd67/7yDA0aveQtDUKRdzRjIasVRM2QHUKzeL9l6U6Ety+NrzjwoKlzBUKrLIZP0oZ8q8rYepKSifl9r9wbwQDobUovv7zIzkGyYPHZaDNqp29MKQ2EKMyqF7seY7M6dpYo+axBT930+xmB0eSjciqv5OyZEyASJL4hlPDgaXFRja3yARfxyB97CTYxHeCEebWQ1dp6m1AY1s1gZ99xhgUrcdFRvom8J+zRmsI6UbBPSsyClNnVyAbyZvZHEB3qtAWqNf3ctZ3zFKAY7mEP4G8DPmm5s5TnRlknrvDxOLcU9Z7zm1Tz1yvLwLKmDoX4Ay3jw+U1uKx+/okLLhdBAudimYVHjieNCy3sgDnQLSSzEDIzgQfZ91RN6JioQq0jrg9zxWlZvLGAqXZ5wm8be4QE4rRGsy8u9XsDn5AtkkOVypcuRAkgFoVL965i6D8ykCX8wvqUxCZK7y7Zb1TfGDD0qvK6g6DvZuGxjBhD5PzTFEBuDN9C9E3G9CjJOPj98w3rV1IljHqEQ+Eo0QWZPNc4lZGrbGP380mgv3zXCEOwimCamEONeSAE5Q88Sml+BiwKglY1oIEWNAquTWDq+8dpZ5TRdIqjyj/zcOJ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(186003)(2616005)(2906002)(31686004)(6506007)(6512007)(6916009)(54906003)(316002)(5660300002)(53546011)(66946007)(8936002)(66556008)(8676002)(38100700002)(4326008)(31696002)(6486002)(86362001)(508600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0ZQZW9HTFBkeGNaZUx3Zm9KTW5sZ1dXbkFleFpnVTRvSFZDem5ucGNLSTcw?=
 =?utf-8?B?Znp0TnlRSm0vYjh5Z2ZxaFNzQklScTQ0cXhFN1hSTUFMS3c5ZHlBRno3dSta?=
 =?utf-8?B?cXhCd1ErSXpLazVjdytpZmFxemp5bWJtUWtmeUo1LzdYUTltM25iUDJ3MGVQ?=
 =?utf-8?B?NHkrOGQvaktGWlZLaE1yUmFkRXBuOEdYdXpWNGZiN2orQUxibEVLamtCWjV5?=
 =?utf-8?B?OWtyQ2pqMUczVmtrajUzZW4rNzU2ZnlSeUVSMkhldldQck9UVEVUUHRuY3Yx?=
 =?utf-8?B?dldMZnZhb28yZjFNbXF1VmV5bEFwYVpqTDdrQTRYajF1VENyb3BwbGY0cmRY?=
 =?utf-8?B?ak8razI1emoxQXNvSS94WEJESFBHQ3pGME1NVEM1S09IWkEwd1VwelBqekRh?=
 =?utf-8?B?dUpTRisyMmlxNXNrQkMrNnp5cU9jdU9kMVFMb2RrQlNHU05rVWJpL0d2UmxV?=
 =?utf-8?B?RlZNMGhuZk1yQmdXZ2gyRzkvOVRycGZqYUg2YUpWVWFOY3U3cmNzdXR3eStD?=
 =?utf-8?B?bzNVOUdSbVdlUWlpU2FOaW96dXNtazdzZU1rOSs3TERvbzUyUTd0TTRDVjRx?=
 =?utf-8?B?ZndxcGJvc2RKL0JUR1pYS3VONGxoS1FJQmVNNkRoSmdMU1pzbkVsTmdPL2py?=
 =?utf-8?B?bEFDOW04SGRUMmpXYUdwUGd0N3d6d3p1bms5NXlINVhmaWdSNVF6NnJhWERC?=
 =?utf-8?B?ZTc1RmhPajBJOUlUQ01PNW54RmJiQmg3N1d1QzlrVDJJNzk4WTdEN2s0bk4z?=
 =?utf-8?B?ZEMwMk1NU05lczFiV1JpNnI3aHBzMTgzclBkdDhuSGU5RDdLcFVkZ1Jadlpv?=
 =?utf-8?B?V1FIVHpqeEF1U21yT0ppTGdDYVhpVVJNNUsxM05yK3h3UTV5b3BoSDQ3eWNK?=
 =?utf-8?B?SjY3cm0vb2NPQkVJWVNOZ08zbjdDZDJtRk4wYUtweXZIbElnSXdYY2h1TFNa?=
 =?utf-8?B?QmdOaWV1N1liK2dlb3hzeS9hUTlEeGtETWZjemc2Zm1wRWpiZG56eFc5QVRB?=
 =?utf-8?B?WWdFa1Z6bTZtNTF3b2NnZGx1d29Dck82SXFoVFNyOThIaldXMUtTMXVVY2J1?=
 =?utf-8?B?dXM3N1ZRZUlvWDZ1dGllMld3UjZYT0tmT1F6djNoTGdWQmRGbFBSYnByeERx?=
 =?utf-8?B?VE1kK3d6cEwrNXRjUWh6azU2R2NRZWhxb0FhVU8rdkZTaVd2Z2hkVnNqdkRr?=
 =?utf-8?B?dEFqa2FWQzVEN0hvK3h6eTlUY2RTTVgybTMrTEhjbFpQeWZTM0grL3VsMDFO?=
 =?utf-8?B?WUZiUFBUYVgxbVI1MHlLc0tPbmdMMnlHb0thVW00MVhTK3M5Rk1HRFFUcnVX?=
 =?utf-8?B?MmVES0h4R1V4bWpSY0NBLzA4TmYzdkROUUN2b0VhaWR6QjBXclZMTUZFR2V5?=
 =?utf-8?B?RDdhWW9xemt6aDZKdVNVOTQrdzRENFEvNmxiSEh4N1E2Tk5HTUdlQVJsUE5P?=
 =?utf-8?B?a2h6SFNlSlg5cVZHTTFFelRyOGZoMHR0aThHMGljRXN6dVowdFRkcXFYSXNP?=
 =?utf-8?B?VjM4azRFTzFwTUtrSUl0b0IvL3ZZS3VZUWVQbWZSQk53WWpEVng4VDFDMjVN?=
 =?utf-8?B?MEErVHEwNXB2V1ZKZDNWNHU4RVZMYUhPcVBQZytydEFheXR5UXdkS3ZGMkRW?=
 =?utf-8?B?cDlUbExNNFdVdER4VTBSQ2w4clozazNhNlpyclBGMTRwS0FkZk1NSEFvRSsw?=
 =?utf-8?B?UzlUS3pLUGdKTkVpc21lK2VNTFo1UXFjYlB6cnV3U05qMVlCMGR1YnRjZ1hI?=
 =?utf-8?B?UnBTL1pCdTBqZjVaYS9CY3llRlQ0TjFHYXRkZWlsU0N1bGRnV1FtazBUR2RI?=
 =?utf-8?B?aFllWVZnUHpZN3hCMlN1cTcrTjY5dEp5ckY1YWZQVGtDUWFna3ZlUHVucmNB?=
 =?utf-8?B?SDRDYVE5cm9NVnF5S3Bvb3NCQmxVYmJ2UHk4bHBVVjJORllwZ1JsZnBCbjdr?=
 =?utf-8?B?UHB5NGQralA2ZDlvOFozTmVGSnlvUlRrWjVYRGU4U21aWmVDeERXclJYUHEv?=
 =?utf-8?B?SVF3bkY1R0hYQW5TS1VzOGVIZnpJd3VOWHE1VzlvOWNSbTkrTjFhNVV3MXps?=
 =?utf-8?B?Q2hOaGxxb2F3N3cxcXlWSjF3a3dTRFc3M0JCbVN2UGs1eDlSQ1UxOFcyMjBi?=
 =?utf-8?B?VXhvdjEzUXluZUREK21MNlduRmkrYklrSkZDUVgxM3pKQ1JIaVZ1OXU2dGZN?=
 =?utf-8?B?U2dMMzBHSTNHWm1zOUhZQkZoWVlzYjdPdU1hV0syN0RtcHQwVURDdzc5R0VC?=
 =?utf-8?B?NFFRanJJTTdUYjZGQk5IeUxHbUlleWJIQjB6bTNPOFBqem1GZ0pDakRYR2hi?=
 =?utf-8?B?QXkybjN4SUMwSDlUVUdKb245a3hmbDFsQ3RCeEFZODdFQmlIN3NTNGxLMmRs?=
 =?utf-8?Q?imIjLfGbIwJTQoouFWVTBcaIXFlgMCfnp+OUR6ixluPOs?=
X-MS-Exchange-AntiSpam-MessageData-1: TL4Qxk0PNqDaUg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb96770f-e95d-4a5c-bde8-08da39651625
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 06:59:15.3804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tK0lYdsgeYcF8qHFhkl93v0hXvGgVnvdDPyJDFkuXkYsJAAtRukxpJZkMeXJGQUl1UxUDaB74FxPoQ4pISWDxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2294

On 19.05.2022 02:10, Andrew Cooper wrote:
> On 17/05/2022 14:21, Roger Pau Monne wrote:
>> Under certain conditions guests can get the CPU stuck in an infinite
>> loop without the possibility of an interrupt window to occur.
> 
> instruction boundary.
> 
> It's trivial to create an infinite loop without an interrupt window :)
> 
> Also, I'd probably phrase that as an unbounded loop, because not all
> problem cases are truly infinite.
> 
>>   This
>> was the case with the scenarios described in XSA-156.
> 
> Case in point, both of these can be broken by something else (another
> vCPU, or coherent DMA write) editing the IDT and e.g. making the #AC/#DB
> vectors not present, which will yield #NP instead.

"Can be broken" as in "the loop can be forced to be exited"? If so, how
would a remote CPU / agent become aware of the situation, and know what
the cause is (and hence know which IDT entry to clobber)? After all it's
guest state, which we wouldn't want to alter for no reason. Nor should
we put a guest in a state where #DF might eventually result.

Jan


