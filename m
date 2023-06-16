Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625CA733A2C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 21:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550386.859437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFQj-0001ld-78; Fri, 16 Jun 2023 19:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550386.859437; Fri, 16 Jun 2023 19:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFQj-0001jI-2t; Fri, 16 Jun 2023 19:48:21 +0000
Received: by outflank-mailman (input) for mailman id 550386;
 Fri, 16 Jun 2023 19:48:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qAFQh-0001jC-L8
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 19:48:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc057891-0c7e-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 21:48:16 +0200 (CEST)
Received: from mail-bn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 15:48:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5330.namprd03.prod.outlook.com (2603:10b6:a03:22b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 19:48:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 19:48:08 +0000
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
X-Inumbo-ID: bc057891-0c7e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686944896;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HMQvnLdnJHVivvCb+6AgLFRBwMwp8l2sE9/T5WFHXjs=;
  b=K7IIhrmWYe9tNnfLCACDs1SAR8fM/r23BUSUdT5BA+mft0hioq82FWEJ
   muSxwr9NwEpXGanEsOiO3OhgUr16hAkHsEjRaoHzbKIuQPIVmSg0swI6N
   Lch9PwwlhQ/WQHb3V9P3GebyKLL6+egmbcuXI/nMaZbN6lDbhc5my4gZQ
   I=;
X-IronPort-RemoteIP: 104.47.51.46
X-IronPort-MID: 113519860
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/5rVr6yjVQXzPtVSXUt6t+f2xyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 2sWXjyHPqrfM2v2edAjborkoxgP78SAmIc2SVM5ryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPK4T5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTlR6
 MA6EisUUhGSoO2v0OuhTu9Thtt2eaEHPKtH0p1h5RfwKK58BLrlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjGVkFIZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiA99LRe3mrpaGhnWI+zY4BhYvSWepmtOJsn6ARO9FM
 0k9r39GQa8asRbDosPGdxS8rXyNuBIGXJxOGuk+5QOK4qHQ5BuVQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAXJ2IfYS4PTSMe/sLu5oo0i3rnUdJLAKOzyNrvFlnNL
 yuiqSE/g/AZi5cN3qDjp1Tf2Wrw+N7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRtlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:SHFltKkeEAOKuEWu+fMX/aLTqLjpDfMxiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msjKKdkrNhWotKOzOWxVdATbsSl7cKpgeNJ8SQzJ8/6U
 4NSdkaNDS0NykAsS+Y2njHLz9D+rm6GcmT7I+xrkuFDzsaE52Ihz0JdTpzeXcGIDWua6BJcq
 Z0qvA3xQZJLh8sH7iG7zQ+LqD+T5qhruOVXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3IKJ8KoOOOW8zuwubhn8gAehY4psH5WEoTAOuemqrHo6jd
 XWpB8kHsJrr1fcZHu8rxfB0xTplBwu93jh41mFhmaLm721eBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc875aFwnJkijR78XBE0gCrDv/nVMS1cooy1BPW4oXb7Fc6aQZ4UNuCZ8FWAb38pouHu
 VCBNzVoNxWbVSZRXbEuXQH+q3mYl0DWjO9BmQSsM2c1DZb2Fh/0ksj3cQa2kwN8ZosIqM0kN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOMl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wt9ihn3ek6hlTAfsuvDcXaI2pe1/dI4s9vTPEzYs
 zDe66/WJTYXCzT8YUg5XyLZ3AdEwhZbCQvgKdJZ7u/mLO7FmTUjJ2qTB/yHsuaLd92YBK3Pl
 IzGB7OGe5n0meHHlfFvTm5YQKZRqW4x+M+LJTn
X-Talos-CUID: 9a23:lnXeGm2TraMvZ/Oon6TYurxfQt84Tl/n127sIl6fBn95EaeRT2CQ5/Yx
X-Talos-MUID: 9a23:115k0QuIlmX4eeRWVs2nnww4H8lj2riSGnsnoa02hda5LzR1EmLI
X-IronPort-AV: E=Sophos;i="6.00,248,1681185600"; 
   d="scan'208";a="113519860"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbarzkuIYentWXTU61sIKCPBMnrQLTyvhgfnEGakTSX/pzyf1mw8Hzpi2EsQbxdNRDVBrJksyJ1Dum3E7b4Y72I+rS7Tu0WNzcDKt7iGlh+CEM95u98W5aPLc7mC+osKURmYwbO2K6hkqt2paruWLV6P9v95k8LNz8lZb9lvFhz6mwFrz0IOwnp2MmeZs8NQae3t1dzxA4JGByzKHwObcMp2EB5j9p7uAM7iLP3IrJClinJl2H6c2uQPrFvQMC185Yr2f6/tz89+8Vm/Awf4n3j7mZEluUzRABzwXbZz1ALG2i6KgH3ZUASIcwJ7Rwvx5RvdIRWKNrQ6GveJ2/zfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Knkz+CuR2h5Nt8wHBfN9Yw57QXJvqyi0hdeSsJZ5oZ4=;
 b=YrL0Nkx/+FKFlXXHnO0xiiNtzX5xB9NWsn+VB1OxQDSvSWpqUUXnISfo0u6r0G12Uc24N2jgDeMH6o9AyUXFP7D75vYBkuuHTaS9uj4nJA9CFRRkTM0LCPJzd3fiu+L7CdcBKHcst1jPe4lSYNkQUzTmCyxRmbCNDS6V+EWiXs/9r7rTN8/smHl1OkEcnS6FOAU0rbVN1EAn6e2ucvbjWg+n98clmKk1Jwu+KtbALhOu5JWsnKiHnc4r+w5hEKorrXpulgf0xwQOAXi0EHFxYZvoqRn+3KTE2E+RDKgj5v2rEnTFub4+UkhZ1wMM1jidcIMWOKMP36k4lsWvZw5KfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Knkz+CuR2h5Nt8wHBfN9Yw57QXJvqyi0hdeSsJZ5oZ4=;
 b=Ar7WnrE8rnQ8McCqcap1bL6JcydwTvAjjHCNsRjkoFR/POfrZL9j2xD1JnFVhP+wBbKCNQ0CjW89H4izWdzs5EK1GMjzJrupX/7Q3qUT8NH+brI7d2cMBKPZZWauS84qDltFicgWwHOzpSOKQomhnTtwpV7gDZ6Y79VEXhBU1QQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f6fba5e9-7f00-e2ff-cadf-838ef1b57853@citrix.com>
Date: Fri, 16 Jun 2023 20:48:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] x86: Add Kconfig option to require NX bit support
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230615153157.444-3-alejandro.vallejo@cloud.com>
In-Reply-To: <20230615153157.444-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::31) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5330:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d609aca-833e-42cf-eb28-08db6ea29bee
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	19Qf2xqPe7q+m930gqkRTOCbtItgQrqKqaEhuE/5ZAZGXpzSCwNwtdhFQzBFek1z3cSJdhF+Tygw/X+vgcjhhl4zhS0ZEQWIMVesUVpOPonxu/e5tIc9lTYE1N1hbQxtbWsj+ExEp4v2Rv+z6QyjKvnfncHR9nlDWw/1Zuj00HMfE3Fsqt14DlqD8zP1bQoWzVpIi8ko0B5Pb+MCxdPhmLhPUX8cfz5hOxtyaAI4qNFMSRC3eW4/laCKEm3Y6PbapDjq/rbxzoJrdkpjotCwrrsoWOUyzui2R5sYlcffXiuduy506gBwxjwdM8dtlmKR1vW4H4PCq6Mi17rZ93uR8GlpqAAkWmpW/z5+VKBMYPVWlI7rb3A6axPyAPq0Ibr/DErU3itoK/3AMmT0+Neox54Z9zQLCT+qrFdPgw5Xr0sUjUgVZayDTbJRb/U57tjGxUyvU6VxrxeSYC4K6BcSawtmql62kFua8G17yQQIKGX9cSuy667SL5C23aE9EBs03MPp3D89jRTUZ5cSADPG0R0PCmFet6kKbQK7IWf+E5/deNmtBYeGpx/GC+fpbrizMSRDFRx6L78A7lH87BC0SfGHzUGe5X8r/GimKqvPV7NlMSkQYyYrW5JBrh21JmZq3Ks/cId4ClwfBQfC59Y34g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(83380400001)(2906002)(2616005)(86362001)(36756003)(31696002)(38100700002)(82960400001)(54906003)(8936002)(6486002)(316002)(8676002)(41300700001)(5660300002)(478600001)(31686004)(66476007)(66556008)(66946007)(6666004)(4326008)(26005)(53546011)(6512007)(186003)(110136005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzdSQ2JZRldYWHo5RTU3V2RWZHorZmY0dkVsUnlZNFhoaTBRb2tmdWwrTUpL?=
 =?utf-8?B?bjdsL1RLYXdpdk9mKzZ3VEE0U2pWOFJUQzhLbUFxeTloZ2NubW4rdVE4Qldn?=
 =?utf-8?B?R0NlR050R0xnQWVUNERwTXQxUDJmZTBKV00rdmswSVYzVDVickVWMFo3M0xL?=
 =?utf-8?B?TVNVdWlOT25Qc205UW5qSGRqR1A4YTl6TXFKZ3J6ZzlPZE9FazFpYU1VblN3?=
 =?utf-8?B?dzRyYVBqRDcrd3JZemRITjZnb2JnaHFuTGtMVzMxTHdDaURpSnlrcE9xcDZX?=
 =?utf-8?B?dlhFUStoS0RrN0dGK3pDZG14a0ZEL2tPeFJ3cVB1NDBuVkZWWU5vMGRRUyt3?=
 =?utf-8?B?Z0tUR2lBWmFqblNVeGJHZ2hoZk5icG5DVkdUUDlscnAyeUMrUFVHVnBGQ21V?=
 =?utf-8?B?ak1uWFpadFpadkk0dU1ZK1FUckdzNnNqMnNIZzN0Q3RrU01xWHNTNkthQ010?=
 =?utf-8?B?eGljOGVwNUJpamJJaUJkSkpMbHQyOU10RFd4L0tiWThTbjQ5SkZzZjVWV1Ur?=
 =?utf-8?B?T1N5V3B5NUxKeDNsRVhsbFdNa2lVcEFkNThXWnd0aEVnSUdPZVV4OXpJWWtJ?=
 =?utf-8?B?YmJIZXhyc0xsYzl2ell2UlBUbE9ITExXV1ZkelVMZDJNbEF2VEd2TVhwZWt5?=
 =?utf-8?B?STR1ZGd0akgzcXBmQWhZd0lPQ1J5a0RiYUpQYlF6d0tud3R1d1lQUDRCOG1L?=
 =?utf-8?B?QUJsQUszRlpFeDFkVldLbmc0bzFkNHh6cGp2bEN5cHVGVkdHbStEMDRXY2E3?=
 =?utf-8?B?UzRnOUllbHh5eU52eUlCMnF0b2NnRmdwRTY2bDhCQkowVkJQZDVIdnByYjd4?=
 =?utf-8?B?M0FzQlcyWHRFalFRR0hlMzBzMkllZlhWRVdZQjA3anlnbUhSclBHNFY5YVRS?=
 =?utf-8?B?SkZkQXpBa241aHVzbVR5WU5Ua0xiV2JpYkJlNTMzQUdQR3p4OFhhSDdheS9t?=
 =?utf-8?B?SE5ncll6ZFRFVkdpeFY2UFFDa0pBL1hBVnZqN2QvZ1hCK0tsQVN0aWlnREtN?=
 =?utf-8?B?NTk0aVVUV0dWd0taSDBVVmwwWVkxQlBTdjYwTzVDV05HK2kxOS8yTlFGMmpU?=
 =?utf-8?B?MzVyTVprMWpUZEtSdTlPQnc4UWdiMlhZV28xc2FCeVRJMWhlc1RaOWZsQ0kz?=
 =?utf-8?B?eW1SeXlkZndVTlB5Z0NUOUZxNFpHaDQ0UTVGVDBMWEJmSGY1QVhqMURLSm1Y?=
 =?utf-8?B?cDZscFo0eHNyMVNwVWRNQzVwN0N0MDA1S3R1N3ZpeHdVbWl3NXRMb3pHbXVG?=
 =?utf-8?B?RUpEYnh0dUpZc3dkaXVoaGsvYWdaQ0RLWkF5KzFhY3RhK0xSSU04V3RIYmph?=
 =?utf-8?B?dWN4a2hONzNOTERoTWhCRXd2dmNtMVJxc2liRS9qMTgzWWx2YW9JNk1uNzRz?=
 =?utf-8?B?YWV4SkhsbnpscHU0TkJFZFErVU5SL01CTTc2Q1lFRG1FbVlrcmY5RG16WXdp?=
 =?utf-8?B?Z3FPd2lRQzJuSlBnVzdxZkcyeTM4VjhXV25jTTA3bnRrMkM0eXZmMUhOaFQr?=
 =?utf-8?B?c0tiTVpnVTkvUkFKUm55Zyt0Wi9GZU5IYzBwRjVQK1JCWXkwTVN0V3BBTUZu?=
 =?utf-8?B?L0d4aHMvSVcvQ1BWcDg5UStqeHUraDRyV1NBL2dPVTYreHRMeG83OHV3a2Rp?=
 =?utf-8?B?TU8rd0FoNmpKSk9BYkNLUTZxU2NpQms3T2g1NWQzczBJbmlsL0hlT2pjYTVu?=
 =?utf-8?B?UmpmSVZ6WDk4RW1mNnE0Sk9WOVVrK1ZVRTQwK2c1ajl6MkduYURpU3ptaEZ4?=
 =?utf-8?B?NVJ1V3hOSjNPdlJrQSt0K1JMeW5rck9MN0R5RmpoMm5YRTk1WHBKSnp3UXFG?=
 =?utf-8?B?MU5rWnRIakFuV09JYXQvencrUm5jcGYxeEY4ejFKY0p6c01zUDBIRFNpRSsr?=
 =?utf-8?B?RmRYQitzOGZSSjJtMis4enhWRCtnZVJkQU1sUktMU1dLcTRtQlg4RGpqbnNu?=
 =?utf-8?B?eWJXWCtzUlI0RThRMWFKdU45RlE2M3RlVThQRVBDYVlaTGFvcUREZkwzNW9C?=
 =?utf-8?B?clFlWWNuR0lwT29vRGM4REhUeHFiVFZ5aFVITHRJQmpsemxMS1Zwc1VtWmtL?=
 =?utf-8?B?SU9xc3k4d25rL1JML1RaRVNhODViTE4zNG9sbG96N2dRMEV4Z054R1JoNUJX?=
 =?utf-8?B?YXo3Mm42UnM4RjUxeGNzUlgyWEtNL0xCSERqYmxYclh0bHBXQjlzWnIrdnRB?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a51XU2EWfRIUaqYPDEMSbTamGgB5Z0OnECriRZMiU9m2acUTIYx3hGVNPB8N21xP65w6DCIoM0fPHFFcMp3nk74dEszZBB1sDE3zUGNx4+3qGdmsgUU0BMRg/OSS/5CBrDrxxbBi0xlMH9bs7L3/4lpPC+IA+jsfDOosKxqq2gJYNsurQk3cO588MEHDoYhefcT/mbjaDWfIj3YHC1pa9EI6iudhRQaGJBarW4cTphxznQrSoLDAzrV71nOnKMZhKeu86B6De/UxIwB9VC7/kjWzKdFtdMqrK6dvotHL5W9D882OedDTGVdG7T67Jf4m2o4W2uweCXLIdr8XTokV9ExdWTRFrZIu8jt2ZoCaBoMyh5eeXrJk7KV+vL1GazxdFB2cL4fPzle/SAILpKH5JgADvO6DP+9SEpYybYBVHKGP01Hk8EXeIauy9m+bDs4KUKEvrwDa3PbbTkG41Y0RyHQ5Z7l/i1Ei+hz0J29OpQ0v9NN2GGxa2BSCZAvVV7esCmiDp9ZZNv4DMwnBdfXapDtbjs4erh4LNpl3bVchaoZbTxTJ7M0BKWAemkZ6CioeQFYqaxJq7G0LcYnZPzHdxtUbMe0SrBgd+ji2bv6SLDEtfsVX88YLt7zuBfn2ltBq75D4eIwbdVRvxWDoHwJu17A62YGfsnHJ7YAqIy4NiT5sXycRn3qaHZsrnhpI4kQNtEkCQ5Vv7Dm76WkMCUQ0EnrZnwiwaJp2u1HDOhoR0+/VTshSqenoqGQaGMEz+ts8Gvo7c8dat63ihzjBwVnpaeN+IYUpCMHNiTHzZattzsagEIKnaXIWsRoNMD8sljEHzoIinEN7dG+nI+j1bwdWzHpu03+ij/iM0CCie1FlUPI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d609aca-833e-42cf-eb28-08db6ea29bee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:48:08.5638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxGam18y9EYK8cT8UjCYd7MtDRaLngH2uwFgXfeAHDh7PmQiWqSiiE54FTXtOcQOEvx0XKArRfniE+wy8Y+7c8V7ipgreoltlq47bRFvqQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5330

On 15/06/2023 4:31 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 406445a358..fa97d4cccc 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -307,6 +307,22 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on HVM
>  
> +config REQUIRE_NX
> +	bool "Require NX bit support"

"Require NX (No eXecute) support".

> +	help
> +	  No-eXecute (also called XD "eXecute Disable" and DEP "Data
> +	  Execution Prevention") is a security feature designed originally
> +	  to combat buffer overflow attacks by marking regions of memory
> +	  which the CPU must not interpret as instructions.
> +
> +	  The NX feature exists in every 64bit CPU except for some very
> +	  early Pentium 4 Prescott machines.
> +
> +	  Enabling this option will improve Xen's security by removing
> +	  cases where Xen could be tricked into thinking that the feature
> +	  was unavailable. However, if enabled, Xen will no longer boot on
> +	  any CPU which is lacking NX support.
> +
>  endmenu
>  
>  source "common/Kconfig"
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index ce62eae6f3..ec1e80ef68 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -123,6 +123,7 @@ multiboot2_header:
>  .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
>  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
>  .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
> +.Lno_nx_bit_msg: .asciz "ERR: Not an NX-bit capable CPU!"

Still two too many "bit"'s in this line.

With these two adjusted, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

