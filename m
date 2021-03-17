Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEF733EBDA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 09:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98590.187095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMRuk-000561-Py; Wed, 17 Mar 2021 08:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98590.187095; Wed, 17 Mar 2021 08:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMRuk-00055f-MZ; Wed, 17 Mar 2021 08:52:26 +0000
Received: by outflank-mailman (input) for mailman id 98590;
 Wed, 17 Mar 2021 08:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSUP=IP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lMRuj-00055a-7l
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 08:52:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9563a52d-c816-43fd-89e6-e8544d550ff9;
 Wed, 17 Mar 2021 08:52:23 +0000 (UTC)
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
X-Inumbo-ID: 9563a52d-c816-43fd-89e6-e8544d550ff9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615971143;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xiyVtiiGMxHuZ31sEqNBV4I0rAGUMo395hxy9E97LLI=;
  b=GqV6u8msiSgbRUYYHecwf5anH91PSTH74QVBCC82FCzkaBPIxEQ8zwv1
   SHjkfZTVoj3YGHiw0CGLxF5sCYFJUEcrtlC4P09DnNtYf3l+GHa1/bGHz
   4AUDZ31lFIYUIxC8Wd8CLaA6/riUtFKNjTQUS8ExHwi+lQxNXBK0ZheoR
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: O1nk1fK76BgWlVcv6A7LKeKjpJUkJ8Z53qwVVjHVjOi7D9HobMvGckgpIxRsPJ+7QA1aGObsCG
 iz4Nr25Zatb+K3Nfl94dHxWoV9TMSyUkorMnzXP4WfFn1GH/MTRMbuyu8Axd6xO+MJCoAoEX9K
 NzQ9BqeaU0AXxbC9cA4I+C0gIN41mDQlzEQUE8ZLS2kYnKgVg64C2d+LV0xkwponHMEZRAF2Iw
 QnD3lgrAb3CeojK9BHRojDYx5O20JgR23jL1Q+DXR1m+xV1QkvubiYyqdUCj6l8q/3kbAona3S
 FEA=
X-SBRS: 5.2
X-MesageID: 40897749
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DDnFfK3ri6Tgn14W2/0t4gqjBQJ3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrdXFebg9AGJY/Cd
 6w5tBfoSChZHQQaa2AdwM4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZibxpkx7A+/W
 /Z1zHo/6nLiYDB9jbw9U/2q65Xltzo18dZCKW35PQ9Bz3whm+TFeZccpKYujRdmpDL1H8Ll5
 32rw4kL4BP7RrqDx2IiD/M/yWl7zo08X/lzjaj8AveiOj0XigzBcYEpa8xSGqh12MasNtx0L
 1G0gui3vI9Z3Ow/1WO2/HyWx5njUayq3Y5+NRj90B3aocCdKRX6bUW4UI9KuZwIAvB9IslHO
 NyZfusgsp+TFXyVQG8gkBfhPaoXng1Ay6cRFkDtsG/w1Ft7Q5E5npd68oFknga8pUhD7FC+u
 TfK6xt0IpDV8kMcMtGdas8aPryLlaIbQPHMWqUL1iiPKYbO0jVo5qyxLku/umldLEB0ZNaou
 WPbHpo8UoJP27+A8yH25NGtjrXRn+mYDjrwsZCo7Bkp7zVXtPQQG2+YWFrt/Hlj+QUA8XdVf
 r2EolRGeXfIWznHpsM9xHiWqNVNWIVXKQuy5cGcmPLhviOBpzht+TdfvqWDqHqCywYVmT2BW
 ZGcyP0IOlG80C3Sl71iBXcQBrWCw7C1KM1NJKf0/kYyYALOIEJmBMSk06F6saCLiAHkqFeRj
 o6HJrX1oeA4UWm92fB6GtkfjBHCFxO3bnmW3RW4SsDM0b+d6c/q8ySEFoimEevF1tadYf7AQ
 Rfr1N49eacNJqL3x0vDNqhLya8g2YMommJC7MRgLeK68ugWp5QNOdpZIVBUSHwUzBlkwdjr2
 lOLCUeQFXEKz/ogaK5yLoOBO/ecNF4qByxIdFdrE/esUn0n7BtelIrGxqVFeKHiwcnQDRZwn
 dr9bUEvbaGkTGzbVckjP8AK11KYmSPCLdgBACIDb8k3YzDSUVVdyOnlDaagxY8di7P+18Jjm
 LsFyGSZMrGG0FQoHxez6bs/m5lb2n1RTMCVllK9alGUUjWsHd61uGGIpC+1GaccXMu6OAQOj
 OtW0pYHipeg/SMkDKFkjeLEnsrgqg0NuvGFbI5bvX4wXW2MrCFkqkAAt5Z9JtoL8rVr+cOSO
 6TEjXlag/QOqcM4Ui4t3wlMC57pD0YivvuwgTi93X983glA/beSW4WMY0zEpW51SzDSPmJ2p
 ki0o5wkuu0L2nratmJjYvQdCVOLxvPoWiwC8EkwKokyZ4ahf9WJd38VzCN6VRsmDMZB+3wnF
 kFQKt67KvaU7UfN/A6SmZ8xB4RiN+LLEEXqQT4De81QEE1gxbgTqa0youNjYBqP1aIqwTxM2
 SO6iFx///KWC2YyL4RYphAVlh+WQwZ6H54+vmFeJCVIAK2d/tb9F7SCA72TJZtDIyEE64XtB
 B0/pWhmPKWbTPx3ET1sSFgKqxDt0ahTsXaOnPAJcd4t/i7M0+LmK2k/Yqaiyr2UyKybwAgvr
 J+HHZgJ/hru30Fl4040i+7V6zxrAYEqjJlkE5av2+o/JOn7mfdFVxBKivDjPxtLGBuDkQ=
X-IronPort-AV: E=Sophos;i="5.81,255,1610427600"; 
   d="scan'208";a="40897749"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLH2CJGtHtidGAwidq5csmJUx/ejEa3+k8Z/xOwFGS4tZh5/ZReriFx0MOULJAQEBjGy/O868ECso2ZC7V0jcDeTlvNUSz6tj489MudEHJHKvKnRYDu72CMsdgUll4aCElbxjoivNxLjN98bY0ZqPdlbnHa6Bk7olM6LQANhBjnCg/UZlynDPE442rFcplxRlva0eg72+wt1q4ZCZmEjmA9YVRQwD1dIMzxArZrZJ3/HCJPFZdXkvOcivjzHUCJFyRv3Rp6Tz+u6me7e1Kl5OxV9izhD35KQwbTWHvc7kHjU6oTXxO4lYFfkyFZCH3sKTs4XitAvj2pDipbJMs/j+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHQUwttASt7RhW2MN55+wcIRzwQZgBIkB/veUU4YPEM=;
 b=mhr+mBe2JXgKRobdZOEY8ap+VNVRpkItG2LkZcGtPx4YBvP73EEOtDkTjfW1eHJLj42iBIg2cgRSOOqAzzSwMD/qKz1DiwQu0QBDQDed61Y2k8D+8QSkH4OqfSi/OUvSmlrUJmJFMoMzHESutn9buKKme2Ew2FuwVKI29FhjdgR9vs2fE70N3Kla/F+c/RmFo8IVtGzXcltZwbi6pYr/BIA/4lGAMMakpIM91iS37PfufaQtjRPS/slSUmqZv7PDBCS7ZZTS27jLoN/qHF3032bTt2Qy5B/8MNE+pTD+7PpZJ9esw8JU97VkAvi9030lQMGv0WBit0qDCfuldRSfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHQUwttASt7RhW2MN55+wcIRzwQZgBIkB/veUU4YPEM=;
 b=wRK3enjzP7g931kqT2xCI/hEzU9l6c41U0uZ6Vjzec6hym0EeoQ0BcgzTcgr9GW3Tur1gCnH4yfkejXv6cmiy72c1oWk1kU0psTnR/rPzUXl3L2iRjUnUPuSJ97njzC96EvceYa1hjywBOJTIxl8XryGNyafKjcY5TYbZU2hueY=
Date: Wed, 17 Mar 2021 09:52:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 2/3] x86/msr: Forward port XSA-351 changes from 4.14
Message-ID: <YFHDPISXNv6mnl+2@Air-de-Roger>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210316161844.1658-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PR2P264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::26)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3ac1124-8b66-4937-ee87-08d8e921f88a
X-MS-TrafficTypeDiagnostic: DM5PR03MB3291:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB329147C19CB0080A3D39BBA18F6A9@DM5PR03MB3291.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CViDytryaFgJo0u5Mpq0MrK48fMrXp0bSlyyEWNGcerfB0sCFDw71JH4mZ//JgRED9Qotw8jL40ppUadoQcyOrKUqsGnDw1gwfcf5cYJZsyJzQsr40Xb1FHj8C+Q7lygDly0aXGFUwGcIVOphm+g0zu1GqObY+Lrn5OQh4xIvCyAjgT/+M07soyisyRck0qzmXZgWqkMxUgfH90U3+58WnB4At3dG6nK9uPc+8IyVhwI0JF28zhOeNDMgQwpeMZUptvKsGjp3HVp2KvKNMP0/rLvHZf7RwsS/ip5cfcsyJDbBR+e1tuuz+KbDt8Rd0vd+BHpaGLwzCGF1l/Czj1MFP0N2K+vphChQBF0FPxO0VmtY66F5bWchPq+cqamP7j+v6QN7T2n7eacLIK3Eyno7EUNk9vPpp4WODkQOocOm7r5NkCW/HGy+JVCtXdjZjQ4qKtRpUapVd9hp+vGCUzTf/z3ShexeJSvTzFZpPZnmMzjmkFvnFJywwIlnL/RHLLaFqqA0xt4i/YRNXIuJGVe7ZQLUrQ4oayEno8D5GZlYA9l0Lz3RXOGhGlPlIjK3/ic8ili/fjDKGrtFchBnyLZPOrRnPhtreAndicwfg9AJYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(366004)(376002)(396003)(346002)(2906002)(66556008)(85182001)(4326008)(9686003)(66946007)(6862004)(6666004)(33716001)(6486002)(86362001)(83380400001)(5660300002)(316002)(186003)(956004)(54906003)(16526019)(6496006)(8676002)(8936002)(6636002)(26005)(66476007)(478600001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGV3eUFQNWlkOE9LTzA0U2RreWN6ZDRKa2FLZWMyeVNuSnpzME1vRVZiLzJW?=
 =?utf-8?B?SUdKN3kweWUrWWdrVUV5eFZQTnlib2dxNG9hSmlDeW5tdnVXb3lUbExNMkdr?=
 =?utf-8?B?ZHd4blhTZ1o0TDhNN0VaZ21ZWnB1SURqMVB5SkJzeGpvZmlKcWdjaGdTdzVG?=
 =?utf-8?B?czJ4OExLN2ZkbHJsa3NFS1d3Y29ObDlPY3NnbXNNZEJzOWlSdU05T09FdUtH?=
 =?utf-8?B?VmVmLzVXejJmTnJ6RElGRlNrSys1T3pEOGdqSXY0WmEzRmZ1QnUxUkFLSFJT?=
 =?utf-8?B?REsyb2R4aDRydDI1UVpmRUFOVURCUmd2a292NmlMaE51QTc1RHpXcllpWXBY?=
 =?utf-8?B?TzFVQkk3enV3emRZUTMzWlBveDAzaktTQmxqV3IxZmxvNXFPd2xRek12MVhr?=
 =?utf-8?B?cERKSXp4WUxLUXNUQUxUY25QMG8ycG0yNnlBVnQ0WG8xWk5HRkpjMFZCdjZu?=
 =?utf-8?B?b2NHalhvTnFiUnE5Ykk5UE80c3FwVDIzSkVla3BYM0ZsbE1SdVhDZUh0SmZ5?=
 =?utf-8?B?SjBwaWpHWW41blJsVnNFdWNIR0dlc0puRThsMzdHNWZ0WUFIUENkOWU2VCtw?=
 =?utf-8?B?Rjh1M2dKdUpLUjlEWXJDaUNsMnppczRUaDBlNklra3Nyc3dXZFN2VThLT3d3?=
 =?utf-8?B?QXVkWHdHa1VkQ3lYRWlOSVNLbkRkbFFrZjdFUDVYVXBOMkl3anJENy9SU242?=
 =?utf-8?B?S3pJc1VIRUs4YStQNDhyTFk3SGc2RGZQZERVT1VKbUt2QkFpbFdadkhMdFlG?=
 =?utf-8?B?aThwNlEzVGh5RVBHY0paWklPTFAwUzVYaHo3OWtDV0w5OThmempuTXo2Z0d3?=
 =?utf-8?B?U1F5amN5Y1FPc3ZHQlhKVFpQbzlQaE1raStSRXR3MDgzS3g0Nk0rUnBPNjhB?=
 =?utf-8?B?WGQxWEZQamFDL0pNSFBWTGh2T1ZxUEdXUlRWU0ttNEQ0OEtHbkZOQjNDRklQ?=
 =?utf-8?B?T01UT2p2cGNQVW9iUTN5WVF6ZGVXTVhYR2tEMHh4U3dYTXVUTVhiak1EemQ4?=
 =?utf-8?B?akpJWmxGSnNTeWlTdEhlTmIwMGNDdTFqdHd2d2hkaUQrV0IydGhTRWpLN1Z3?=
 =?utf-8?B?MFdITlF4RHhjVG45WTVmNGFCMW5maFNvTDdmYllkNStJSldmTTZ1Wnd5b2dH?=
 =?utf-8?B?TmFpREpFU2NaWmV6ek1Wa0g3a1NaeFBxYWo3RU9wUjZTRVhkd0c1cUdWSDNH?=
 =?utf-8?B?SjFCdGd0QytqazN1QXluMzkvZGYvTDhlMlhkVnZsb1ZONmtabzU5MVVNYVJJ?=
 =?utf-8?B?Vkxjd1ZxTnNDRnVGRWJNei9SSW5aNVloNE5mQ3dWUFdxa0VpNTZNbGZhOG4x?=
 =?utf-8?B?UFoybng5bytrSDM0RGlmUDlKOHVGUDBmZEx3VWtnOCtJcHFZTEF5RUhOYkZL?=
 =?utf-8?B?ZC9Sb1BvM0RZaFBIa0RQU2U1dGVoa3VNOTBMcXFURlpjaysxUjJHelRTOEQr?=
 =?utf-8?B?YkFOeVZTeXloSXdGTkhFL1FUQVJQclBLb09hL0FodkxHVTkwOHFyZklGaUVl?=
 =?utf-8?B?UXoyQzMzMENoY0k4L3lVSnNESGloaUZ2R3RzM1lVa3ByRW5lYlkyT0l0bzBv?=
 =?utf-8?B?TjZxb3NVWlVYSVZMNnJnZG03dkhtVEVua2dTYzB0aHdHRW03azRtVXgrRW00?=
 =?utf-8?B?RmNMVm9NY05ISTIzMHd3M2dMMXQ0UDlxcjU0dnl1UWZwcXpQUUR3aGZuUGxr?=
 =?utf-8?B?SzZsdjFIYmEzSURuZUM1c29TQXBFNGR4T29WMjlFUFBiQVNIb1dHd3JUT2FS?=
 =?utf-8?Q?mgQDUXMBDLCXAKNT9atz/W+kbgZET3NDiJQ6iI8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ac1124-8b66-4937-ee87-08d8e921f88a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 08:52:18.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uq2lZJOfBFI5296gcrLfBF31rw2UrMc6oZ3HDlaMa6BeRv6xF9y71xgNXLAkrqb+BtK/BgFnLrZ0Kq6dqJ9brA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3291
X-OriginatorOrg: citrix.com

On Tue, Mar 16, 2021 at 04:18:43PM +0000, Andrew Cooper wrote:
> staging was not impacted by XSA-351 at the time of release, due to c/s
> 322ec7c89f and 84e848fd7a which disallows read access by default.
> 
> Forward port the XSA-351 changes to make the code structure consistent between
> 4.14 and 4.15.
> 
> This removes logspew for guests probing for the RAPL interface.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> CC: Ian Jackson <iwj@xenproject.org>
> 
> Technically this breaks Solaris/turbostat insofar as you can no longer use
> msr_relaxed to "fix" the guest.  The subsequent patch will unbreak it
> differently.
> 
> For 4.15.  Restoring behaviour closer to 4.14, and prereq for a bugfix needing
> backporting.
> ---
>  xen/arch/x86/msr.c              | 19 +++++++++++++++++++
>  xen/include/asm-x86/msr-index.h | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index c3a988bd11..5927b6811b 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -188,6 +188,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>      case MSR_TSX_CTRL:
>      case MSR_MCU_OPT_CTRL:
>      case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
> +    case MSR_RAPL_POWER_UNIT:
> +    case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
> +    case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
> +    case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
> +    case MSR_PP1_POWER_LIMIT  ... MSR_PP1_POLICY:
> +    case MSR_PLATFORM_ENERGY_COUNTER:
> +    case MSR_PLATFORM_POWER_LIMIT:
>      case MSR_U_CET:
>      case MSR_S_CET:
>      case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
> @@ -195,6 +202,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>      case MSR_AMD64_LWP_CBADDR:
>      case MSR_PPIN_CTL:
>      case MSR_PPIN:
> +    case MSR_F15H_CU_POWER ... MSR_F15H_CU_MAX_POWER:
> +    case MSR_AMD_RAPL_POWER_UNIT ... MSR_AMD_PKG_ENERGY_STATUS:
>      case MSR_AMD_PPIN_CTL:
>      case MSR_AMD_PPIN:
>          goto gp_fault;
> @@ -412,6 +421,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>      case MSR_INTEL_CORE_THREAD_COUNT:
>      case MSR_INTEL_PLATFORM_INFO:
>      case MSR_ARCH_CAPABILITIES:
> +    case MSR_IA32_PERF_STATUS:

Should the MSR_IA32_PERF_STATUS addition maybe be part of the previous
commit, as it's not related to the XSA-351 content?

The rest LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wonder whether we could squash this with 3/3 for staging commit, and
then only backport 3/3 for older branches. But it's likely too much
work just to prevent breaking msr_relaxed for Solaris for a single
commit time span.

Thanks, Roger.

