Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7882531897B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 12:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83853.157025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAABJ-0002Rv-C7; Thu, 11 Feb 2021 11:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83853.157025; Thu, 11 Feb 2021 11:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAABJ-0002RV-8j; Thu, 11 Feb 2021 11:30:45 +0000
Received: by outflank-mailman (input) for mailman id 83853;
 Thu, 11 Feb 2021 11:30:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzmj=HN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAABG-0002R9-O1
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 11:30:43 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7f0b0cf-c033-413e-90e7-edf39443ea5c;
 Thu, 11 Feb 2021 11:30:41 +0000 (UTC)
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
X-Inumbo-ID: b7f0b0cf-c033-413e-90e7-edf39443ea5c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613043041;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NxirOC2dBWp+Y4kS0+ky1iYNwg2E7hOxgG6lu1IJ2lU=;
  b=N2x8IkfFz2rWNo4CPWgoW2mBBueAXGCaYHf7AmUxpSQMPorsCrA9PnBi
   R5enkW2KFCI0rTQDo7qs5arBMSX3FQMDMrY0Ra/VWdUYTmP2StF01nGyz
   d6zhLdqGTyUIkPsSRf8Gf7tBnrueVqvvfJliSKO2zN9bIlU7o97jMCM5I
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QxDqEM/EBDAEmROhn2SH0coNZvqL2bUkVyaSV2zEW/QvqggHeZ9EhYquuAE0qbogh1a4aT6aTs
 LpPzTDNlM3IOWHaoZ7t5vDHSAuDpcrFiZXiNEfdcdiM3+hngSH78/9c+/ycY3DqsTzF7nplTof
 uFN8Fl5Hvv0TS2mLHKAybTGtK8ijf6om6bGv+bj9glK/MU61OTko8y+MvWaGNIZxILk6eih0NQ
 9E3T+4PFtybUCoqoiGmNdR2tVXb3yHbYd3eILCr95H5uFEiYWi++8YK8JYGsW9Ty5MomG8u+hj
 AY4=
X-SBRS: 5.2
X-MesageID: 37058724
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,170,1610427600"; 
   d="scan'208";a="37058724"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9NC+NHHSEZquE41fmxjKbYoc+rQa+4K0QpZ3Ln/oNYoTlHSfMXDwGPiWk8aMEPBtiDMHA9my5uN+OvdsctnHE4V369GJTOfYyrVcI45K6XBIGkSM26MsrLAIgwk7OHFrEa5+T691e17C+UVJh/GVa6lDRT1M62d+MRk1uIlPsaqcbfKpjmp6KeivnJnIcK4VerXOhcxCU6TStrOlBSQy0pFaUsYpZbPQH0U/jTx6WNUY4GXFeZSoIEdxrRjBMq8LuGI5Qao3D7JWbqs0whuFT53+QrhUaRzrwqa+tmgDJIhXk5EWS2GsCnx373LJkxqUhUKmyMv7AWJ3Ksdi4nwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxirOC2dBWp+Y4kS0+ky1iYNwg2E7hOxgG6lu1IJ2lU=;
 b=AI4fwQYDWmRgl/2Kr+uAqRMle/PgYPBssn/T6OalkzDUnPJyTU8sTvnLJagcDKWhcJJgLh/hPW7UiBEIprOtu7Rw5hMjpiikL4jXE0xJln9ohMIxR8nRi4KOhQ9vLFAXs8gU7Tdd2cfzVsRHdpHCIfNSz5W3QEtUO8r6lsjM8NKa4qFSp/SuHc+niGYfF8Msf+hRFw+jjHwMV/oRLaPz35PT/8eKOyJZuE7Uj9kyHLW83Uz8GHfMrdYdPKe9B65GdkKFoEx3RB55tAjOguK9d65hPFk2rKztIpVnOBe/KwDDdtbAZyXrwXVf1I7Ycomr/Zw8EzMixPf/Tw2n0RQhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxirOC2dBWp+Y4kS0+ky1iYNwg2E7hOxgG6lu1IJ2lU=;
 b=LnlCo2Fpu/g/SNAHIW4cd8sQJ2A86oJz6UeNlfMGMhk+mOtw3zjugJvLQHJao5AqNd0BSfXSwcSnCGTVvaRpO0MIKvLbY5TVwMMQA8m4qrpkeX7HH+jgAjp0VM9YFtK+dA7sLmYteqvprT6/OBIsiTbxoaIzL23QA6URAIGkn5I=
Subject: Re: Stable library ABI compatibility checking
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel
	<xen-devel@lists.xenproject.org>
References: <22a01569-1ea0-bb87-eda1-1450d0229cf7@citrix.com>
 <816d28b2-df85-9259-de96-5a6654c8b341@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <35654104-5445-9e44-792b-3059d601db5e@citrix.com>
Date: Thu, 11 Feb 2021 11:30:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <816d28b2-df85-9259-de96-5a6654c8b341@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc3fb00-19f9-4a8e-0bed-08d8ce8072fa
X-MS-TrafficTypeDiagnostic: BYAPR03MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3622F13FDB6722FC6441E804BA8C9@BYAPR03MB3622.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lQeN392+/Jw7PeFwuy2zKXM17CQVkM5U7ceExG9MTIxO4UsnpXqAclxJYyB1kySdEhgwyE8IHh6GzXG/pl6nUknim1fPPdDLO4pvgxk5yFYyaitNguGc7Z8kY2TU2QfWHw4QEMP7utHajvvzbpPAYL+xnDev9Rj56ll4gPZhIcwGps8U2xUZrjZxOg1+oSMbr7ZvA0j78qZiANfGKPAkLnFtStZnVYyTumzeq4OzYEKMuOm++FSu2tYzMEoWL7DDLBBinr7+6NdK2OxyQxeJOJrqHJup4xt8AkIoaIiOJBU7YEcZeZQL7V5MYpSGswUfIP1YvKzL2LUYqI5w87BAwI01y/Ljoc/eciFEBA0uLxTxdVEssa1zOVu7dnng1UenCLxa+yT4K6+ZbriYQwiR/asFLiPaLfta3v3bsZwEGgNzS9YFNv8zXTewr9MXOrXQYXBwTfxCZ7d6ACz+dod6bxyk7v5emBBP9Z8K5pimtC2hH/83J6KdoAZZjknyXuw7RmXvCO7jLzKKt6MJlgooojrgDweb4RJbwiYNp/W1Crf3PuwGyiRPoGlIN+dbVBM2VDQwZ2jt8WF1YBrlFQLxYPJzm0dRUID0pAa5Z08aw0OV57q3hK0EdjHcpdxh2JZgPiDusUzewTnHCS9+7ZtFCqhq++u5TpQyUmoWfewW9GPb5qD5P6+PjNQSgyC89QQS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(366004)(396003)(346002)(8676002)(26005)(186003)(16526019)(53546011)(86362001)(966005)(6916009)(16576012)(478600001)(31686004)(316002)(8936002)(6486002)(54906003)(4326008)(6666004)(5660300002)(66476007)(66946007)(31696002)(2906002)(66556008)(956004)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enJhS0d3emhTcHZHK1JtOFhUdGNsL3l5aEZyYnJ1OCtjcXpFeE8yN0p3VVFF?=
 =?utf-8?B?L2RlWXRLd2pqMStjRkh3dGg5RkU0a2NsOW42MXUzWkdjWVc4L3JuWXpObFhY?=
 =?utf-8?B?Qzh4bUtjYzRJMS9qNWYraEJpRzZiUUFDS203bXN6N0VtcHdlTmVUTnpXSjdw?=
 =?utf-8?B?R1VYMmdoN0ZDeVJYUW9LMHUzVTVJcU1wQjNXZFRxeHpYbVp2dzlVUXR4dFBn?=
 =?utf-8?B?YnJEYVdURXpCSVZSVFczMmpPT1gvYkN4UHFRSE84UFZRZVFsRk0xVjkzUGgv?=
 =?utf-8?B?NzFsaVpJVlZXSk9Gc1V3dlJlclFYMk9TMklRZ2hnZmVFZDl6K0xMSldFUy9V?=
 =?utf-8?B?UURrcGdHYy9lQU5GK1p6VTc0TmpaQThScGlOQ0lhbTZRUXlrOEZDOVhVSjBo?=
 =?utf-8?B?MmdNKysySDNhM1NlYTI3YVlBdDlGWHlPclpENGFnbFdkVm50UjJ4QUozRGEx?=
 =?utf-8?B?bzdVRnVDTU9EQzQ0NHlCa0hHM3dtZklncFM5UmlSWk4zU25LMWhBZGh0ZTdD?=
 =?utf-8?B?REkzWXRJdkJ1TERmQ3Bac1BJTk9HTEZqL0ZYTHVOZ2NOUkFXbitJOURSNUQw?=
 =?utf-8?B?TzRibTlxMUpIQm5WSUppUUtadkFxVUJGZmFmZHBDVzlPVzlIYzFxRGJpUWF1?=
 =?utf-8?B?blpvbVZobi9iRGE1K00rVmU2TjdkR0g5OFlrRUVDZlBHZWpxcWM0V2hLL2p1?=
 =?utf-8?B?eEt3UGhWRE44RmVnUGdEcVNJdHRKZ0hGQ2FXS05vV3RRRTMrOU9rbFIrREhv?=
 =?utf-8?B?U0VlNWlKSWVxYithbHdtOXJONTVHMVpZR0tQTCsxYXllSk5SOUtQTDdkNVZP?=
 =?utf-8?B?cEFlTlJ1M2JiZTFvRGc1UC9XaDk5eG5ubE52UWN4UzNLNXg4Q0dkWUtVcEk5?=
 =?utf-8?B?cE1ndzFDVzlySXRnOFhqei9jd1h3TkV5Njl2cXpPSHpTb3NOSDFnN2h4ckxI?=
 =?utf-8?B?c05hOFBzZDZZallyT0d6d3QraGxOQlhpT1NZUXl2NS9iZWpJUUttdmFvbjRo?=
 =?utf-8?B?L2MzOFVNMGY4WWN0MURKTVkxT0UrOHloaWNmVVRtWk5nYTV3RW1TVVliVFhO?=
 =?utf-8?B?TDRIQ29tRmxyc0prSms3cy9rWXpuZkdCbVhYSU03RjA5eWowck12ZDY2S3JL?=
 =?utf-8?B?U2xUNWR3YTN1TUFrOXdkYXQwZkZJOHpmcXhGeDhpb0lyVkJaVHZUd1JTQ1NK?=
 =?utf-8?B?NzlrZmtwYXFQOVRpdml0Znh5Z1FJQVdsYm81WDFCRXNPMDNTMjlRamduekti?=
 =?utf-8?B?VDUxb2wrbXd5eXRSbDNvcWFvTXlPLzl3aWhSUjkrUjhvUkRDTVZKTE90bnd4?=
 =?utf-8?B?WkFraXprNFNsVDNKaVJtNEV1bldEM3MzcmpvVW1sWHM4a3dXNGdPZW0yOFc3?=
 =?utf-8?B?ejhEaFpqUkxzNjI4eU9ESTZ5MnQyaE55UTUxOW5LUWgwNkxiTHFHVEJGbnpr?=
 =?utf-8?B?dzZINWNzSXN6aG1aWWNtaUZGWjNmd29MV0xhVi94d0FXeDJJcTN5WDQzam84?=
 =?utf-8?B?dTNlRG0rZHNucm1MdkJ2NXNkdEo1Mm03RjRDYVNvVjM0UnNmZVhFTzJRdExY?=
 =?utf-8?B?SG9idjN0WktObUlhSm1jdHJqOWdkRisyS3ptSS9DdEtKNW0yWGFVcVg5a3p3?=
 =?utf-8?B?cEQzWmxuSmlQUWFySStCc29oWTVPTFZkeW00M2lsTUZvNG51S1daQ1pMMjYx?=
 =?utf-8?B?Vjd4T25TbmM4R3Mwbm03SDAyUVIrT1VRQ2R6NzZRWUFlWHJRLzRFbDEzR0FL?=
 =?utf-8?Q?AhE4KNlj781xfVVIkcj6Io5aKlwG/a7xq5U7Q63?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc3fb00-19f9-4a8e-0bed-08d8ce8072fa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 11:30:35.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3I0E0Fddl9IL+jjuRCCzt2aLeeV8amswGkEtwERhJAK/4ihVMFczhJuDXPK03V6P7OKgjtA3JdEgC/0ZeGqS41L0qoOaFSqwXkBl1F3qcfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3622
X-OriginatorOrg: citrix.com

On 11/02/2021 11:05, Jan Beulich wrote:
> On 11.02.2021 02:08, Andrew Cooper wrote:
>> Hello,
>>
>> Last things first, some examples:
>>
>> http://xenbits.xen.org/people/andrewcoop/abi/libxenevtchn-1.1_to_1.2.html
>> http://xenbits.xen.org/people/andrewcoop/abi/libxenforeignmemory-1.3_to_1.4.html
>>
>> These are an ABI compatibility report between RELEASE-4.14.0 and staging.
>>
>> They're performed with abi-dumper (takes a shared object and header
>> file(s) and write out a text "dump" file which happens to be a perl
>> hash) and abi-compliance-checker checker, which takes two dumps and
>> produces the HTML reports linked above.  They're both debian tools
>> originally, but have found their way across the ecosystem.  They have no
>> impact on build time (when invoked correctly).
>>
>> I'm encouraged to see that the foreignmem analysis has even spotted that
>> we deliberately renamed one parameter to clarify its purpose.
>>
>>
>> For the stable libraries, the RELEASE-$X.$Y.0 tag is the formal point
>> when accumulated changes in staging become fixed.  What we ought to be
>> doing is taking a "dump" of libraries at this point, and publishing
>> them, probably on xenbits.
>>
>> Subsequent builds on all the staging branches should be performing an
>> ABI check against the appropriate lib version.  This will let us catch
>> breakages in staging (c/s e8af54084586f4) as well as breakages if we
>> ever need to backport changes to the libs.
>>
>> For libraries wrapped by Juergen's tools/libs/ common-makefile changes,
>> adding ABI dumping is easy.  The only complicating is needing to build
>> everything with "-Og -g", but this is easy to arrange, and frankly ought
>> to be the default for debug builds anyway (the current use of -O0 is
>> silly and interferes with common distro hardening settings).
>>
>> What I propose is tweaking the library build to write out
>> lib$FOO.so.$X.$Y-$(ARCH).abi.dump files.  A pristine set of these should
>> be put somewhere on xenbits, and a task put on the release technicians
>> checklist for future releases.
>>
>> That way, subsequent builds which have these tools available can include
>> a call to abi-compliance-checker between the authoritative copy and the
>> one from the local build, which will make the report available, and exit
>> nonzero on breaking problems.
>>
>>
>> To make the pristine set, I need to retrofit the tooling to 4.14 and
>> ideally 4.13.  This is in contravention to our normal policy of not
>> backporting features, but I think, being optional build-time-only
>> tooling, it is worthy of an exception considering the gains we get
>> (specifically - to be able to check for ABI breakages on these branches
>> in OSSTest).  Backporting to 4.12 and older is far more invasive, due to
>> it being before the library build systems were common'd.
>>
>>
>> Anyway, thoughts?
> +1
>
> Not sure about the backporting effects - tools/libs/ had quite a bit
> less content in 4.14 and older, so the coverage would be smaller.

tools/libs/ has been the stable libraries, since IanC split them years
ago.  The only odd-one-out is libxenstored IIRC, which moved during the
4.15 window.

~Andrew

