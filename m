Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473EA690BAB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492527.762108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7sa-0002Rh-7M; Thu, 09 Feb 2023 14:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492527.762108; Thu, 09 Feb 2023 14:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7sa-0002P6-4R; Thu, 09 Feb 2023 14:26:28 +0000
Received: by outflank-mailman (input) for mailman id 492527;
 Thu, 09 Feb 2023 14:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3QCz=6F=citrix.com=prvs=397b6fb01=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQ7sZ-0002Oy-2S
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:26:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7ddb38c-a885-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 15:26:23 +0100 (CET)
Received: from mail-bn8nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 09:26:17 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5293.namprd03.prod.outlook.com (2603:10b6:208:1ec::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 9 Feb
 2023 14:26:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 14:26:14 +0000
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
X-Inumbo-ID: b7ddb38c-a885-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675952783;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KunQBhK7Hj4Hztta0KGeACXw5xMSAty9n5B7VdzjNFI=;
  b=PTDMHVV37dkde/YA0jEkPWhOfnfQ0LJGx+WEdsp15NvA1XEo82BtAhAK
   9zTxbSSoBuK+3/8P6004Grs7Wc6D17Yq1Oc2ygafAACjiOPVEf3FEnkLd
   GbJUCTaqqIOBx2/qHgVx/FjcBpJCtMOUTQAcXOVqRR1/F/zWszpRBXDqz
   w=;
X-IronPort-RemoteIP: 104.47.74.42
X-IronPort-MID: 96772526
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IchvKa/fOwe8oV+41X+7DrUDWn+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mcaUDqPaP+PZmL8ftx+b9/ioEJVupaBzIViSQNq/ik8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6ga5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkltq
 /5GLikrTCvY2d+p/uO8F/BTqPoaeZyD0IM34hmMzBn/JNN+HdXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTePilAruFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqBt1NTuDiqJaGhnWY2mwvLQRHR2GWmtWYs2Odf9l7N
 xULr39GQa8asRbDosPGdx+3unmfpTYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1U/DqyKhoN7OVAFd2+nMdmes7wc8boj1YYWtsQTf9awYcNzfSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB0B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:EMN2parn7/ke7rZyv6YfVwEaV5ofeYIsimQD101hICG9E/bo8P
 xG+c5x6faaslgssR0b+OxoRpPwI080hKQFhbU5GqznZgXgtS+DLYlk6ofmqgeQfREWn9Q1vc
 tdms5FaOEYImIUsS+Q2njcLz9P+qjlzEjh7d21858mJTsGV51d
X-IronPort-AV: E=Sophos;i="5.97,283,1669093200"; 
   d="scan'208";a="96772526"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alySsNWia1HRXUZqbfqCqZL4zkE4Q/iD4FLKK28BU3/a/OxsKgtkX7RxWXfH2oMkaKBImeN8twPXedCfS99BHM9N5W2qjmaZFx98ElmPbu13T2VNstMkvM30cbneAt+Anyt7dFA3wHE/yoUgo5ZiiCoku/eJQ2muCleleSiqW0Qye7XR9P5A7vaxjctBdhzDupxH5b4d81sPrLF8JGF4lfrUR7G1ZgA0lLCaub6CqQFvpsQRXYgmvX/YvdKimEcX0of4jmtQ8RzBI+Cs3bBVtC0feqH2ELWDfw6tg1pup+InYdqncmeZW/hUgbj8dtHQzeYB+epY9PywNvwlU4bbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KunQBhK7Hj4Hztta0KGeACXw5xMSAty9n5B7VdzjNFI=;
 b=KiUPhAoFtXB8L1oKb3+9IYnw/+gzzAoYgxBGITSFFIt9p2/wfRPN7Y7umBJ7G3yyjW5yNoazOlhLIqBfqf4hbRTWP6YIbt+XcPguUfhqAacDUA2Lkqef4jK58T/Fd0F15iyo7gIvzuJHcD+LZ0QKo2pf53OQ55dXx5tqKOE5wGSRB6pSkxybWP5ORWR1LhbUVrx/SW/XLKQVFtjd1c89O7gm6flU9j1VvKJDyhjrpIpawkfV5XFTNb9n5HaVRdO1hGx0ZMFeYkL6HLX7+EiO7U2ZuuNc1ls42J+Za5w9EYLEugdCPEx+/DlMIC1N49vN+kyaxaYVbCIUb6voPWsfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KunQBhK7Hj4Hztta0KGeACXw5xMSAty9n5B7VdzjNFI=;
 b=HDe0lkNaTQmZ83aVvwu+CfMLq8yCfIQNIUz/MeBXLqSX1DALY/lSqDMcTdEnoqL/aA6itBf9MZ2YtxLUtKl5bR+7etiHiEAbTXVTrLyZSu0EDE9wJqKiIJROF9QPcd5HI/7tpAV8MZHhUH0Wj2cyMa3iNq9MjL7Gijoih6uivDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e18e36c3-6478-cb63-ca92-330392efe0db@citrix.com>
Date: Thu, 9 Feb 2023 14:26:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] SUPPORT.md: update version to 4.18-unstable
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230209142357.3270-1-jgross@suse.com>
In-Reply-To: <20230209142357.3270-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0242.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: 327fdaac-5c5c-45e1-8b46-08db0aa99926
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mDVBfP/eeR+tsB4bGp3kLwvbR6HvdyCrtESSYLgq2R0He17o+2GFJEWkqNmwA6246AVa3deF4Y3WPebU31gbqCxAa2FJTX3UuKkfVU7aK6dXuehLX0W95QBXYlUtSCHKgj+CRN8Y40aRKid+KRsunxtyHfZ40eOpJeL07ltIf/8khSHew9hjyLg5IPfTKUyvWpgbCvPADo56ZjijRCGH3UO5AYt+jTBbxf+Iwj4NtRY7jN7PRr9TVoPnU87T3NeDhvrUVOON0v64lGYlNS2ZMDtAQnJcvfg+HB99A//IMAUndqpcDJvGgpfiIdhHqY2cRb6Q6gRU22ooIpL8L8yrK0JIeAPlTyjpeDxsfA6KIEt2yTxwWbR1idCRVISX7i20/i1CmSnU9gP3t2m6kvTMvdifN9qKpWYL+KgF28jGo6pVNl6vc5Dh33K8ywSAo+xZdJLWwfDYv89p52fjXvA6/fFpPesl4WAd8hmWoCUOmy+bWsTKAeI4Ar6xtkVCfZ/2xajlc6AW5IhFUt/Yq0LJdVmivfcam2PC2fE/GFHVVVcu4x5FEHwAYO8hQXjHIbphJuziRbwTMgLirflCINiwMxagpJukadywQKfM7J/+0k40+iMGSAnpWEXYMng/Z5ygzOfaIkW4YqSlJTxkYkAXIt32vEWIK2mUBSu8oRnJhvEVg+C7MS9qC781Xi24jVVuR4hg8apT36qZ43CLEGF7zwswqavbg/4xTK5dGV/nM3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199018)(8936002)(15650500001)(5660300002)(66556008)(2906002)(31686004)(41300700001)(4326008)(66476007)(66946007)(558084003)(8676002)(53546011)(54906003)(316002)(6666004)(31696002)(478600001)(6506007)(6486002)(86362001)(36756003)(186003)(26005)(2616005)(6512007)(82960400001)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmF2VEYwWkxkMzNTY20xbmVqZ2RSa3phelIxeXFKV2czS3RybHBqWnFDT3NQ?=
 =?utf-8?B?Q0JwSzVVM05od1RaZitZaTN6ZEMxUS8yczhGQnFodmFzenNJSjZ5N1lmMHVN?=
 =?utf-8?B?R1g4TW1ILzY1UHVaQlY4eThsUnhpSVF6cXVLZmM5S3hxdGZIRkFHWFRIZ05G?=
 =?utf-8?B?ams4WDBKVkxIRHgzRDduSGQ3RS9EcllYV3RnMFdGbTUxb3E1R3BHdmFYaVpD?=
 =?utf-8?B?bjRsYXJKcnlmNVFLVjRmMGJ0S01jdzRsZFk4aWt4NkF1eG1zN3Nja2tDZEll?=
 =?utf-8?B?Zk8vaFZMdmVieXdrWmdMYXVCWUdHNXVRVURJbFV4VnUxTDB3VktjNGl5VEJ3?=
 =?utf-8?B?RjZQMjMyeE5hVzJjd1VzMFpVQ2Fxc0w1MXp1cnNzMlZ6QVhBR0wySVNVUlAx?=
 =?utf-8?B?ZHNWd3V1VFRINzEyclFVVlBlU1BRUjJwM0NuS2dCREhPYU9yTmM0Y296ZWUv?=
 =?utf-8?B?czY5UjNpTzFkb1B5b3E2NStkRmlpTWJKNVh1Wkpia001bnhsa0oxZHpTdkFI?=
 =?utf-8?B?eGJzQm9MZ2lpYTA1ampoY3NJaC9RWEJOWjhZaU9YN1RQeHE1aEx5OXlTdEEx?=
 =?utf-8?B?WEVqYVpQSHRCV3dqc0lCK3hhb0VrS1JVeXA3WTZmeGRUT2szQ29GU2pjSkV1?=
 =?utf-8?B?U3MyOFI5MDRFempLcUpiVURRZ3o5TlhnSjg2R1VyUnpTbHR6OWlOeTdOQit4?=
 =?utf-8?B?NTUvN0krWEpoYkljSWxNT3pEVG92eTRmcGhyamNBYmQ0Y1dzUnQxYWdKMHFN?=
 =?utf-8?B?YjNLbFNTQ3N5NUJmVnVOdnh3dXlXRm0ramp6UG1Wb2lqRzc1WjZJODdHdlZN?=
 =?utf-8?B?WTZjL2NmMzlhL2dDNlcvTEdhRkZnZWtSbzJac0tBZ3g0cE5BOTZYQTlkV2dQ?=
 =?utf-8?B?ejFMTk14MGFoa2lkckNsMkxsYlhLN2E1d0NaUDN1ZjRObkRVMUQybGdNY0Vk?=
 =?utf-8?B?Q3FkRGxsRzN0QnMxZm1YTjU4Z0J6UFZING5FNlExb3ZjSGVJSlNXYU9zdTlU?=
 =?utf-8?B?L20rRGw5ZUJlUmQ0TjIzYWVYY2J2QzZEcXl0VXdOakgvdnEyeThIK2Zjemlw?=
 =?utf-8?B?SllqdkxFZlQ4c1NWVVBkM0Q3cS81SWhhMmFzRXZpZTZCLzhuRkpab2hrWW5n?=
 =?utf-8?B?SktOM0pVRlNYTzB0K2NYWEZmRnJmamdDTm92UERwbzFJNithSFJaVk9TUDlQ?=
 =?utf-8?B?SjN4Z0JvRkVYZ21ZdEVEdnRXdzl3T1U3aHh6WGMyNitid0JZVHR0NE1SdnVt?=
 =?utf-8?B?ZTV3YXdiQlNUdGVpcElhUUJVYU1BN0pVZDlKYWpKd1hsWWtKc1BXakErQllJ?=
 =?utf-8?B?dUhCeVh6WHYvdm9waUNIdmNYcUcyVDI2MllQNVJyNExYL2xyblBHS2NlNnNM?=
 =?utf-8?B?NGw2R3NSMFJoLzV1T09pWVFReWExN3ZjMlcyRWY1eTlKNnpJQmFtV1BhazNk?=
 =?utf-8?B?VUxjODZ2QUlXZDVlZVVGK2NMWTNXQmEwcnVQSkFpRGRXUVZ3SU5SMkxnMURl?=
 =?utf-8?B?ZWhKTjJCTEwxcXhCRjFsRDZhNUxrOVhwbGxnSUl4T3JEVXNCRVowRFpNV2Na?=
 =?utf-8?B?R0RENGIzUkl6Z0x0SlFzejgvYi8vclAyTHJwNHdBcE5NU05FZkJINGNOOFRZ?=
 =?utf-8?B?dTRHYXRDSmdsSmE0THZwZStXcXBnWXdidnVtZCt1Vm0zMjMvaWxRemR4SXMz?=
 =?utf-8?B?di9JdEsyQ3E4bWdvcDA3OE00M1Nad1p6M3d2RGptZURHVzF5VHFLNVpIeWd3?=
 =?utf-8?B?RDU0T0VRSkh0ZjV5eU8wR2g4bmdwSzBYcjNleHU3QTN1UjZGeUFYZFhSNFFL?=
 =?utf-8?B?OWZ0bjAyTDkyUERQMFhtc0pCOEpkWUs3aUg0ZjlPaWo3RytydDVBSHJZWENm?=
 =?utf-8?B?eThLM1lmZ2E2alI5bkYxV25RZ21JamMvbi9HTzlYSENOeEN4cERYVmZZOTlu?=
 =?utf-8?B?SEt2aFh2VmFYN3l3TERtbDdvWk1ucmd3RXBuZkFIQ0xsL0dyRFNQL1FBZFhP?=
 =?utf-8?B?R0VJQ0h2anBoRStmQ1Y3Ri8welRvanF0NUorZCtMcXRjWGVkNDdhUlhDY3ph?=
 =?utf-8?B?OTNDc25vM0hwNVRCcERmdVRNOUhVRVRsakJsZWFIRWZLRWp4ekI0WnJhc1Zz?=
 =?utf-8?B?b1FZWVpmL0lHRGFqVXZFSXNSc3RSdzFKQ1hNcGN0K0dFUDFCUXgrR3luSXZO?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XKm8VtzO+5mdzDwy8ZY9+ScfpBKAwzGlRrUrb1OI/1SRYa2knPzJq1D5gPkppEAYkMrZ33cBF2WwsnqYACCwRFtG0x0n6XVC9wCS1+PHa7vXvY3IV3gpKM5PJ1KN2SXrnwIARlX0KFnWS6GhaSCw70P+J348aMLjh+Nl5/wSold74SM1xqsGcgCzi/XdHTCh8sD/Ul7LFAfBRPaJoX0r6Lpi3HcQmAF4i+9EilNKfeMdi5ZmHlQkf3EgWxD5nt/v6/f9NtKltAtrOvVriUAXQHOKYo2RSJU30+zwdobKy3slsOr82GDJbX8nQyGLpx1EwrZ3ZkZvQ1eIsODfA0juoANula3TWjfiWIfIofhbKLc0w0ewmd4BfsRk7UgQ/9tN8xe1A/k66BMjgMHFFBLQRikfMPjaFFRrTexHW0X/fdj5phV1KcMekEurB4TkTmWrB9TuLrx4EpXkG7YexvY3ZdgA6mP/dpu3PW8C7yvoIfdMD9crNnmfClU1YSmYKhE5gfnUwqOBaCiEHnYWfyWPHwy0x1ztbHjfNkf12V71YVuQNnx9MK+YX0+dmaPeV+ub7dxry7tO6AxlEs7exdxNDHibMS8ee5YE221WT/9fOhAV7sljkF5bqInKu0l1GNU0kxDBwalij/76nsMx4AFVc2mp5tRURMQC+yJQtjV1REs6I03viFr/lGuHOtu9uxS0Vtkl0651mGH99KqTTYhcauehsZFRU1hidTYz3ppDgT4g2wzBISxHKLW8Obv8kwELJQdG2HAa7ULuCFmEfm9tf4aXnY22AtUGwzWivv5j31Bx/MRWWdU8BvepAfTZZu7HaZfzze924dIJ3lmuMVOvjbNvFlWzt8tR2/uxpoYlk7A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327fdaac-5c5c-45e1-8b46-08db0aa99926
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 14:26:14.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQjq5CI/OZD1li9vHE4rUmiOjxYYQ8Xpgur/riAV5twgdtKlK+awbXbiKbZxZp921nwIJnx7/v+MPTn02azBC9hwYgHMXwdvKmF8YkWeVcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5293

On 09/02/2023 2:23 pm, Juergen Gross wrote:
> The current version is no longer 4.17-rc. Update it to "4.18-unstable".
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Shouldn't this be on the release technicians checklist?

~Andrew

