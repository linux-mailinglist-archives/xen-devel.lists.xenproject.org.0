Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187106DA580
	for <lists+xen-devel@lfdr.de>; Fri,  7 Apr 2023 00:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519010.806143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkXi1-0005R9-Jh; Thu, 06 Apr 2023 22:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519010.806143; Thu, 06 Apr 2023 22:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkXi1-0005OJ-Gc; Thu, 06 Apr 2023 22:03:57 +0000
Received: by outflank-mailman (input) for mailman id 519010;
 Thu, 06 Apr 2023 22:03:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkXi0-0005OD-7j
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 22:03:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e940a5ac-d4c6-11ed-b464-930f4c7d94ae;
 Fri, 07 Apr 2023 00:03:52 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 18:03:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5260.namprd03.prod.outlook.com (2603:10b6:5:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 22:03:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 22:03:37 +0000
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
X-Inumbo-ID: e940a5ac-d4c6-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680818632;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=22ew3TdBsJAvJYmXneHqEiLeFfBjaF1cF229izoB/Wk=;
  b=c83lxsot8b7idIMqiDFdtz7CYf/gSwweaFCT4//zNx0n0Ls/J3/ScVxd
   vsv4j0LIupNy3FhVFCDZXL3yb//6s1XZm0avJGHXooShUKCOEAPskDzU/
   oYsqSI942+tJN7K06cLKWDnKckgL7xQzi10YXp+SPvbIVln4OvPJ5OzN6
   Q=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 107055567
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LONriqtjJIHCYm/izojw7imfiefnVIZfMUV32f8akzHdYApBsoF/q
 tZmKW/Ua66OajSnKIx+aty38B8EvpCDytQyGQs/ry49QyoR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNGosdy2MqcaP8JG2ReRtiNQKB5H7BdZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xaLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXnrqM33QPMroAVIEAGDHGf/Pqcs0WBBfRaA
 Uc+4RMwrpFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakcsTgYb4t+lvIA6iDrOSMpuFOi+ididMTPtx
 XaMpSs3hbQWhOYK0bm2+RbMhDfEm3TSZgs85wGSW33/6Ap8PdShf9bwtQCd6utcJoGESFXHp
 GIDh8WV8OEJC9eKiTCJR+IOWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdo4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:QGDupazBMF60XE0X39P6KrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="107055567"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKJr553KU7bXVVQFWZ/Lof42RDWBPBh6kcPFPh5ux3JAa/vEeIBAbPeJdkGEz6jIEGZcsl00O1spx1z4SNXsWoK9AKcZhgsV+smE7nDyBYuB7U0SBwuAj/GHaCIqJ7+LBO/Xfk11ga23avco7jtzDu/SiXttgRI3Zku6eN94KhfaxeE6yXbWXFhwuHdPDZIey1Fscka2aDFD1cQEmTPtaptTSqdpROrXaHxjRiqtuRaUPknZ11OtmcbYMX0JT4Q/VGyL0wm8eHQCs9YX8Es0zi4S820jNIpzpRmJihoriEkvlJQ70rMPfixpTNaYYUga7+oqnTv6bZddOo42ZrJ2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nbgt0HD9hbY8GSlnvGTyg7OhKOvJp4JMkJSv7rMRKA=;
 b=Cq+d5o/MMMx9YXycIlJr8MMzZC6Cuy5SY1WPE72xvPwktgQj1FOC6CfOsgmF9yvYotHq0HzZIk9f6yfoVeNe5S6MXfRlPbe4XuhOZIPb/GhDI6F4r/gVZdRST4xJrT51l8LfsUAs9VsmABI1JQCpyTy1RbmYFXEUSvSto9bU5MBjfw7Hrg/dCT6VvQoIWl8l8RyfTUc1al36VZmVXBPhxmGKxBYdk86/VkT7qT7+FTVjuGJ7GgbwaW2+egzcgMeTDsUbKxuf1ykGd9RJO0DBeVYStEGAtL+Z6cxQYaKP1scL2Y4+aAUtJluw0JdGZWao4+7oA5z2db2AzqMZLlYcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nbgt0HD9hbY8GSlnvGTyg7OhKOvJp4JMkJSv7rMRKA=;
 b=RUzvXovRcnz39/bijGDJojREk7SBGWOUZBr9VvaPkDmoPiCP9pXTy/lix3uyd7V3otC/I+YLmRCyoicGnb+xkghJSYeOZklgQS9Pb2Av+pjFRDbIYuAdq6Gso/MLxlqPsUfX5j/6IsmAbSjVdjRQsvID6z+M/bJz4PX8KS9Y1pE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1c2cfeec-d64a-3e4b-013a-840f812da12b@citrix.com>
Date: Thu, 6 Apr 2023 23:03:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 9/9] x86emul+VMX: support {RD,WR}MSRLIST
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <b567e068-dcab-b294-9706-ffbecb36de3c@suse.com>
In-Reply-To: <b567e068-dcab-b294-9706-ffbecb36de3c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5260:EE_
X-MS-Office365-Filtering-Correlation-Id: 980e2fdb-114c-4412-ed96-08db36eac585
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	34cwPhEuZB159eksHxWjaRqZL/wrZ/r6Pi/DclVlS/Vy2d0rDDBv2tKk1lq/9z2720rlHjo1s2Gm0T+zmZQFlF8XJXHYweAJKM5p2+2OO9lhi/CXAT24E8IR6Q3z4blhgr8XBYofUrtIVBN+LQkN57A69lYZxGkWqiFSpn253GVHwfMK0HwV/Shy8jwJOMfuHCwkktcN/ertW8fXWMmxKU01A7yBz0qchcu77u7bRcHEyJ2SJoJqvkvAb3V7sRnUfC4ytZS0Lu0F4cQN/Av1ATjJ7rGA4t1ijWTKcNKs7pAj/b8wRaqy7jpPZpphBk5ICYNMMOeNQ+KXc6mNhw3R4moIVGy1mLww3HSOY7KllWAWDBifF+TEDMVttUbZ0xieqc8tCHDxQCI6JBIndyM0nojrRqlV9NNEut8d0JHWFFUrUe1w7xjiOL4Vt4pOSP/mf8O8H72AnoWgKBRH3FHrOmidvMjcfLtU+wzUucaSdYI0uLLVffeBH9v2J1OoSL1o+4rVDivLdotW9HBEt1uGisn/iSfKV2qU0b/rnnuSsDNdC0roQhlnTWNEShq4suVIRE5QN331A2l9cdE1jbqG9mem0dQNVGY3n7jhnofkdIlV+MKTYBEaMJ/Kz/XM5HKoXFw2yq8+8dtEgpATKldtHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(31686004)(478600001)(83380400001)(38100700002)(66476007)(66946007)(66556008)(110136005)(36756003)(41300700001)(6666004)(2616005)(6486002)(5660300002)(316002)(54906003)(31696002)(8936002)(86362001)(53546011)(82960400001)(6506007)(4326008)(6512007)(8676002)(26005)(186003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGlOeWxYb3ltdW15VjJHOG5hVTRvcHdjaFBBY2RVTUxkeThUNXoyYXd6ay96?=
 =?utf-8?B?VkVoSUFZOSt4azVxTkZ4K0dMd1Jxbk1La1F1ekM1WmlvWlVNRXVKcmxTR3or?=
 =?utf-8?B?anV0bzRJaTRjTkFRbitnMHdjbjlMTUt5TUh0aGx0TGxSaHpJb0h1Z1NNcWlo?=
 =?utf-8?B?OVllay9KY3NURDFNQjhsVW82Y1dLcFJyTVVzL2RvKzQ1cm50a0pEeWo5RWFE?=
 =?utf-8?B?Z2hDSUl4MmU0SGRUK1JZbVpjdVEzN3ptMzNEbDNscCtRaGd4YmJGMDdzb09W?=
 =?utf-8?B?UExBQUFVN2lFcTNHZTh1NE9FbG5RWlJFVldiWW9XZmxrTFA3dU9YMkpITCto?=
 =?utf-8?B?QXRXek5KTGRHNUxnZFVMUk5KUWIyUjRMdnAveS9SZ1MrY1NFL0JZT1Y2c3BE?=
 =?utf-8?B?RWpER3hqYy9WaXlra2pJcG5YNldaUm9qN2tvemlUT1JVSjc1bWtDdHdpbHM4?=
 =?utf-8?B?RnNtOXdsQzIwbUFSU01hblZGSGxrUU52Mk9TOERZNTI0bDYreUpYRzR4d2Y0?=
 =?utf-8?B?QW1QNEQ2NklaZzMzMVVxQnkzNFAvOXVkM0grc1lPRVpRVmNacG5FWVdGU3VM?=
 =?utf-8?B?b2htTW5TTVR0WTRJanhZOHJTQXZJektzOGR1VEpUTWRQRWxqeVhCd2t5ay9j?=
 =?utf-8?B?K1RQQVZ1TWIvTG9KT1JVOW1JZnViYm5ZdUJ6aGtqMDMvTmx5eEV4YXgyMUQ1?=
 =?utf-8?B?NGxqcmQyOWdBN200NWc0R3hkYnZKTC9EcllQZjZrSVErbTlQeS80Nk9hcUt2?=
 =?utf-8?B?cktqaWJIK1lKUmpNNi9WS1U2UmIrMURkV3pHOUJKTUxYN2FyQ3VDeTNSYTJp?=
 =?utf-8?B?K3lOVFQySCs2ZDgyNlNYVU5mei92Nm91cmduM3htdDEwYnlydFpPelc2YVh3?=
 =?utf-8?B?UXBvdXd4RStFeHdNa1FqQkM4REc2NkJCTGEvSUZZY2lYekxyVmkxWndBaWVX?=
 =?utf-8?B?dlFXSCs4aXFnTk95cTMwallCWGNhbkpMQWd3YmpzcXFlWlNJSlpVWUFnRGRn?=
 =?utf-8?B?VXNMVFR4SHBFVFJTbHkwV2luaU53bU16Yk9KcE10V0NWU2plYTRpWXlGVGxm?=
 =?utf-8?B?RmFNVTRsWFNWdjlGNlk0eHdZc2ZHTXpJTUI1QU5qOU9ac3U1TkpkSm1sMXNR?=
 =?utf-8?B?V1NYODVnT25EdG5COEQ2cU1Gc3pEQmNYQnFXbmlDWUVJcm9maDNaY1RXdWk1?=
 =?utf-8?B?RkJWdUliNzFKL0lOOVpSNmdoY01idGJjMWlIZ21xNU1pYU05Y013dFd6YkxV?=
 =?utf-8?B?eDhFSFlVcWdsQS9sYlE2ckpmdVdHM000NnFVSWhsZjBRZS83SnpjYTVSZ1h5?=
 =?utf-8?B?UEkzSVNYYitvQlNOREtFNWtvUCtVUzROekJjbjNNOWE4dFRVM3pwakp1RlZo?=
 =?utf-8?B?bHpWWGVMeVZmQzVESEFoeUZ6ZFptRXhybU9pOG9ydFJ2YmxCa2pSamNBQ2hv?=
 =?utf-8?B?ZHlGUmxoSlIrL3haL1FtMGxEVkc1VTZ2TkxVNTlJR2lKMDFCSGI4bi93bkZJ?=
 =?utf-8?B?dnI5eGlsZldnUytGbHora01JZGVTbXVlc2t0VFhGN29MN3RJMkF2M0l4Z2pz?=
 =?utf-8?B?eUpDQTRFSVc4YnErQi9WcTBKblEwSVhIaHJEaEhTUWJ5clduZWVub3k2YzBt?=
 =?utf-8?B?L281U1U3amhyOXhLWjYwVE8yREpHSFBFeFVyd3JBenl4U2phS0s5SWtUa21Q?=
 =?utf-8?B?SmtRN2huTytsNHoxaGp0cnp0RFRqcUM1cVJDR0ZnVUJFdEtXRVpEMnlTcjl5?=
 =?utf-8?B?b2FyZmp6Uk9GNVRGelYxTnJ4bW5lMk5LcEE5TUdaY05yTTZXOHZrWS9MUjJC?=
 =?utf-8?B?UDNJTzJCcG91ejZpQlcrenJkcExQSXU2akxkWTE4ZHJQajZBUDFvMHpUZnZi?=
 =?utf-8?B?YzJvQWo2VVZzUjI3R3ZSNHFCUnBRTHBHZHV1eWVXaEVVZ1k2cHc5d3ErUzVE?=
 =?utf-8?B?dktzbWY5SEsyU0J5ZXpXT1pSSDkyaWlCR0RiWUJyRm5VU0RmZkRqVC8zMVYy?=
 =?utf-8?B?WmljVkM2N0tHd1dadGEvWEZNbmF4NjdHVVdhYXlUSGxVM2dvTysvMkREajJh?=
 =?utf-8?B?Z0I0Z1pxZmdZVTdialpsZ1VsTFBmSlpCTC8wakJ0V210eCswUmQxdVI5cHdE?=
 =?utf-8?B?dTViQ1Z0K0srODlzY1lTOWhnTlc5MnhZWVN4M1FwblJRcEMzS3NydGdFak9p?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hf04QenghfBAMMnlDrmuvFglmFI9FuhvOob8JfcTj9UsB/zrT543XzziQSnSRO96srW2rf3M/lyqflRwlcSMcIJ9xY7G0bO95A1k7tr1uBcPLg2WOeg39eO5khxJE8t7ypzEUPHhLapXHtamVLFe5yPDkJBjZirAV6ewjW2VQrlAT0BwlkF7F+fV/ekZ7QL7EjmKi9++GqGIyS5FfOP5JBRhevNmzUc4LwSaGBOxc/n4bd/ZzeetZfjWjv+NQBFHSrhf+/BkDZjFfS0vo/J0Enzb3e7Nzb5xiPpnkYbZ8xPW6PmIcLsk4dasG2R8IRIBikjkQvYdM58Zk+v207F9k3nUJr6mO4MQYhvUXR8S5MW4soN6xkGNQqRY3fr/sQTP/CtImoxaNAyhmtKjSH5zLxUnf7hRh4YQ9MTWFx49YbF1TLU7kSe4BEEWWiJTER4KGjZmclP6rTRMQUFQv1zlTOFKBASkdGKod+je6KHmizv88INNiWqJaY3NEwvWGZET37dMuJMHwdQUwvjxKC5KtErUZQQrxcLmrTei2aPaplWeduDnyXaNv3+wLoIFwpI9kdyPqUrZDKn4cLzylQImyahQPuabw9bbyQp0JRxgb7J9h3Yo1LtNZPNYbdsIVWaBtvzzyAp6z1jdGqRb7CW5zuOfMnj+SGHKLmV1a3T8CscwHnRcD67bLOCE4+/JsZpUIV2uZPt9ecO3P3RUnDIfUWehTvRdJGCuflBCrfG9csyks9u+Uit2zfT7+YxzkIQ10Cuwy+BsA2y/Q4g9b3UsaotW0OO3ffx4afVQjtB+J7t3S61XI+fWsOJCPCTK+E0tQHqyNOxvNz+PZOEzwZkmK880224i9LuAK9fyRVEk47A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980e2fdb-114c-4412-ed96-08db36eac585
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 22:03:37.0421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wc6VZU7FY8yiBhj8DJZUxgOmz6MYNZq2xcsGDtNnVu3cpTUw32FFXaQ4w59nnDNWC0RXn+dYgrbbL4fqxQ72evfpvjJj1dT8ORN/0SPouSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5260

On 04/04/2023 3:55 pm, Jan Beulich wrote:
> These are "compound" instructions to issue a series of RDMSR / WRMSR
> respectively. In the emulator we can therefore implement them by using
> the existing msr_{read,write}() hooks. The memory accesses utilize that
> the HVM ->read() / ->write() hooks are already linear-address
> (x86_seg_none) aware (by way of hvmemul_virtual_to_linear() handling
> this case).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TODO: Use VMX tertiary execution control (once bit is known; see
>       //todo-s) and then further adjust cpufeatureset.h.
>
> RFC: In vmx_vmexit_handler() handling is forwarded to the emulator
>      blindly. Alternatively we could consult the exit qualification and
>      process just a single MSR at a time (without involving the
>      emulator), exiting back to the guest after every iteration. (I
>      don't think a mix of both models makes a lot of sense.)

{RD,WR}MSRLIST are supposed to be used for context switch paths.  They
really shouldn't be exiting in the common case.

What matters here is the conditional probability of a second MSR being
intercepted too, given that one already has been.  And I don't have a
clue how to answer this.

I would not expect Introspection to be intercepting a fastpath MSR. 
(And if it does, frankly it can live with the consequences.)

For future scenarios such as reloading PMU/LBR/whatever, these will be
all-or-nothing and we'd expect to have them eagerly in context anyway.

If I were going to guess, I'd say that probably MSR_XSS or MSR_SPEC_CTRL
will be giving us the most grief here, because they're both ones that
are liable to be touched on a context switch path, and have split
host/guest bits.

> RFC: For PV priv_op_ops would need to gain proper read/write hooks,
>      which doesn't look desirable (albeit there we could refuse to
>      handle anything else than x86_seg_none); we may want to consider to
>      instead not support the feature for PV guests, requiring e.g. Linux
>      to process the lists in new pvops hooks.

Ah - funny you should ask.  See patch 2.  These are even better reasons
not to support on PV guests.

> RFC: I wasn't sure whether to add preemption checks to the loops -
>      thoughts?

I'd be tempted to.  Mostly because a guest can exert 64* longest MSR
worth of pressure here, along with associated emulation overhead.

64* "write hypercall page" sounds expensive.  So too does 64* MSR_PAT,
given all the EPT actions behind the scenes.

Its probably one of those

> With the VMX side of the spec still unclear (tertiary execution control
> bit unspecified in ISE 046) we can't enable the insn yet for (HVM) guest
> use. The precise behavior of MSR_BARRIER is also not spelled out, so the
> (minimal) implementation is a guess for now.

MSRs are expensive for several reasons.  The %ecx decode alone isn't
cheap, nor is the reserved bit checking, and that's before starting the
action itself.

What the list form gets you is the ability to pipeline the checks on the
following MSR while performing the action of the current one.  I suspect
there are plans to try and parallelise the actions too if possible.

As I understand it, BARRIER just halts the piplineing of processing the
next MSR.

~Andrew

