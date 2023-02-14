Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88266961B1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 12:03:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495123.765374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRt3z-0007rk-CX; Tue, 14 Feb 2023 11:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495123.765374; Tue, 14 Feb 2023 11:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRt3z-0007oY-9H; Tue, 14 Feb 2023 11:01:31 +0000
Received: by outflank-mailman (input) for mailman id 495123;
 Tue, 14 Feb 2023 11:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QOgc=6K=citrix.com=prvs=4026bb75c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pRt3x-0007oS-5a
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 11:01:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb088820-ac56-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 12:01:25 +0100 (CET)
Received: from mail-bn8nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Feb 2023 06:01:06 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6607.namprd03.prod.outlook.com (2603:10b6:510:b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Tue, 14 Feb
 2023 11:01:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 11:01:00 +0000
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
X-Inumbo-ID: eb088820-ac56-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676372484;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tCGr/F2k7dL9rhWqnARMiWr2ornNr0OqaAjkCBTUn9E=;
  b=hnxKKx67VTcjbkWYdymRxMAZxroRXBsGPoSLJccSr7jJUNpxnNXWv7pI
   7Lflgkcz7S8bDhIF6XoXFpM67citxqeIyQGH0rC0dAMTwmlf7DtAxx7oD
   zsi4cSjSb97k6AcbynyAWSkFS+Y5DY+pmSQJsoqDzzb7vCsWRxeke9LYt
   o=;
X-IronPort-RemoteIP: 104.47.74.48
X-IronPort-MID: 96349381
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ka5Mfa2kG63xU4gIIfbD5R9wkn2cJEfYwER7XKvMYLTBsI5bpzUGy
 2AXX2zTOa3bZmT0Lt93Pd6yp05XsJHUxoRgG1BtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZnOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLF532
 qcyOj42RA2BnLr16vXrG8ddv5F2RCXrFNt3VnBI6xj8Vapja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxovy6PnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzH2gBNNJROTQGvhCvAW+nm8pFj0vbWDin+uDjly5QpVFN
 BlBksYphe1onKCxdfH4Xha4qXrCuQQOVt54Gug2rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqW/62Yqj6aMiEPIWgPIyQDSGMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 Fi3QDMWgrwSiYsB0fW99FWf3za0/MCVHkgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBu6nt3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:cynoGqGK1J6TlIDrpLqE+ceALOsnbusQ8zAXPiFKJCC9F/by/f
 xG885rtiMc9wxhOk3I9ervBEDiex/hHPxOgbX5VI3KNDUO01HGEGgN1+rfKjTbakjDytI=
X-IronPort-AV: E=Sophos;i="5.97,296,1669093200"; 
   d="scan'208";a="96349381"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azLyMzAWZ5Ihi1SQ6knrRnrc/rL9Jgiusb2+k6DDKkJq0Qa/BLzO2rJZgiQHB7gmReRrBIBXnIb89hgLA0LUsZyf9U1FqiIkvmL8Q9OYOqBVwDpcUzcYE5Oc8tf0Nvtiur17jJGAApqB7WT1pf4/YUSruIsuSYw3kcZsJh5onO5n3mphuALWUGbDU+fDCyZxwHje8cQJ0c3b3jVBo9K3A1cEqbg5aBOgB87jDGb07Rr08WNWJxjioZ7uALV2vfa3XmP8sfeugS0ttiFlLSbCBnwxaF2MqBhzMh/L/nxAmvNtJV6q5JDcP3OaH3XMIchvXQcqMrgfbQREszeaeuQRfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSNyxqGBiyb6g1VId3hLyXSw+Uji2nTT/r5JNr3vM7s=;
 b=kAzBZlpAR2nxBXt6r1PO9ywMe6KwwmNNrxa1ohGxZTDl3u0K2m7xp2sRkczsDaoMyFEMpXAaCyZ5Pd6H2gPBO+h7yPl3LrBfye4Sq4k1We0twukTjIFsqoGsr7nAUn2HxaiDRm8guIGR2VUgV6/OmolmK0eR6z5w3yoxuin0/jomFaRqdTnmt0yfeS40CcPE+hqqqqqm/VsX38va2Bxy90jKxGUafOejvFkPBWfhP5Wg2Ibmw+Yq6Acoq6MW59nd2qYsUVGEC4lUlQ1/hxju2GdjF8okW+wf7pJWMS6TZ4tdE9GMTwjhDPdjzhWR3B5gY32UrQiZqa+qzGsnWe/Jhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSNyxqGBiyb6g1VId3hLyXSw+Uji2nTT/r5JNr3vM7s=;
 b=t1SHCENrJGgW6flJuppXtIhMitgPn6SVKYJEbHLVvP9Lu9d8AKTcdUEpW8TLUQPbmfccDRdpVJNQ/gcahEEBLqKRILmhd5AYeWLI7Rn5CLH3oxGPjsJxBNa7pu77mDoBLTE9LC9dbeYSNlnqckbr33qxjbGjfUQihqXydfBqZ8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a4ec0f27-4f66-def7-bf76-74d9777671a2@citrix.com>
Date: Tue, 14 Feb 2023 11:00:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] automation: Add container and build jobs to run cppcheck
 analysis
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230213142312.11806-1-michal.orzel@amd.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230213142312.11806-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db3836d-f98b-4d28-189f-08db0e7ac168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uCswYUNeceVZMLG9Zss3uBT94bFlIak9t6mKtxeOQKgJf+6ypyJ6dlbkjWzTKxd3bTOyoXtZFsEddndtRBiFkztbr+QgPNxpEtG+kG4rFfX0uGFQu0tzVT/6WxG04WNs3nnXc7xY8L9oKdWlbS3teX6oHeRPSmdutJxGWi+OrLbJOPB+7/+HcYcyrxqVRCOAAdtdPpN2+fva8XV/dlECyzSX988mujj6EkY52bmwHOMyQTAXfazAZscniaWAOMB+STJK6oU8ywmYp2yiemtlEC+UqdrSw6oPfw+goiPlKUiubM3kh6t6cGJdT9WsFfezuchTFvqdUunB+2fPizR2bXIHn+NI3YwANeHYo4JtlT5ycu2StL1V5Ihtl8YsPvETnyMkTUnOQwZuPWtl1bmEbkGOSpOD1nmvki2l9V+5RBn1k48VjpmzsIksa8G4/5wsPftiBXztFVEIqtFKVHBmb2Nn194mkRmLW4AO0ep4KZ26ro6Le5vNomcSubPXP62JNxMcGVTilj33+A8CeNHFn20A9HuPDmqTRYlWZCgo7u2KKHbbHWrprQC69tJUJBT+p0oFsj0NctHu0ay7z5L1NchHfBCghfPFU9ZGsuwWewCadfQ9EEl+JBnYmcKTUu+Lg3A/gIh9GlJcCQ9E5SSHq79ln8Kf8BzaPI7BCxA5AkRD6U0zf39A4JmZ1cZFYo2f0PbiaoyjZOdhLPG4ukLYrk79zpg1Er1gSZu5JZSs+1A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199018)(36756003)(966005)(38100700002)(316002)(2906002)(8936002)(5660300002)(8676002)(66946007)(66556008)(4326008)(66476007)(41300700001)(54906003)(2616005)(478600001)(31696002)(26005)(6486002)(186003)(6506007)(82960400001)(6666004)(31686004)(53546011)(6512007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWF6SDc4SkpNZ1ZrTU1CZGZ4VisvRmZEL1E2MFZmc0phTXBDWVVDM3FPMGZM?=
 =?utf-8?B?VmFic01YWktzc2FETXplanp5OTFvZ01iTjdYeEZuYmxjbThqLzNCVFNzYjlD?=
 =?utf-8?B?NW53U1dyTk1icWMzZ2dOYWZ0bzdxM2RSeW9tS0Jnd1JDQVNyNTBtdmVUbUR6?=
 =?utf-8?B?QWx5ZFh5eldhY21kZVVIVGhWa3Q4Q1U5a21FWWhMcVhjSlZGcmZoU0JpV3gx?=
 =?utf-8?B?NzZ2LzJMbFJzZGZ3a0ZyWDBXaWozMUgxRFpXbmQ4dUV1emZaMnc3ZUh4dEVN?=
 =?utf-8?B?NmRGajNEZXJIUlBlYk02T1Y1YnhxV1BMSHA0eTlKSmNQcVo2ZFRuOUM4SlR1?=
 =?utf-8?B?cEY0LzhGZ0JlaGEwREY2ZlBWck9xT053cis2eEF1aFEyU2MxOG5TaUZCQWFZ?=
 =?utf-8?B?SHh0SGtHYTk5OE9BNWtzVFhmQjZkV0FQM3h1RWpMdmdLWUFUM3RORERhWHJH?=
 =?utf-8?B?Ujcxc29lUC9wWFkyUUoxcXFONVFsU0tmQU5sbmZZbDJ4NFkrWHZVWjM1d3lS?=
 =?utf-8?B?MnpTekVyc1lpcnFJTDBpL2xHSGVjd3c4YTdXN0F3b3RxNHptMlR4QjRSWW12?=
 =?utf-8?B?bERiWWN2bGpkd0ZUN3pRYi9SUkw5dHFFb1NCVjBpSnZ3b2dPRVNkTlYrMnNQ?=
 =?utf-8?B?b2RRVTEveXF3ZThKYU1XcWhEVmIxMnJwRGtvazZtM3ZQUzkxS0VNV2wzL2Zy?=
 =?utf-8?B?MTRFdFh5NkpoN2pTSDFGYmRlYTEvZUxnVlpPSHVOdHYrbmEwSzZNcnlVUVox?=
 =?utf-8?B?YVk5UGFkcEVGSWdkN1NOa1dibllianpaN1BDYTZVdzVEZHBYSVNEbEs5ZjUx?=
 =?utf-8?B?ZzF4UDQyUGpSa3NlYk5oWS9FVWpMNWNSV1hiSlNFU1liR1lQVEZWTi8zc1ox?=
 =?utf-8?B?eDliazdocFhzWjR1RWNIK1phMDJqM3B0dnRBTVBwcFM1eE1XaVQ3UkxFS0VF?=
 =?utf-8?B?RklyQllvSTNxL1daYS85eW1ZL0x5UkdyU3VZN0xseFNxR29vQ1UzU2tQSzNu?=
 =?utf-8?B?OWo4UGx1Mi9GdTBmVCtSeDd1bTNtOEM2NmhjNVVvWWl3MnpZSzhLMFV4RWky?=
 =?utf-8?B?b2Y2Si80QTlrWjZqSHBQZnYzZ2dLYWlSVlVGc0hBdmN4cWhhTGhlSjJrRHlK?=
 =?utf-8?B?eThQcnBzc2UvanhjanB4TjhoR2V0ZWYxWWhkZW9DYTRXWEQydGFvUFN5anZT?=
 =?utf-8?B?TDBtMVFEWk1GK3FXb1N5bjZzWWMwN2MvK0ZIRHM4UDNrQ1p1czBOUG81bnV1?=
 =?utf-8?B?U3lUeU1JeHp1emtqRVBXVWFITmNzQXdwS2FoN21TTDhrN3V3d2FiSVY1ZzRM?=
 =?utf-8?B?eTFZU25nTU1xVTA0MGFJdjZCKys4M0dCb0kwcENnaFZjRlY2SWJpRjdrMHNB?=
 =?utf-8?B?RHBjUE1mdm5Gbmw1ZFBlRlloc1dQa29yZVZWMHdxSXo0NU5vQWFhb1RWNDRW?=
 =?utf-8?B?SFJGV2NlT3MxdlAyREszWE1JSVR4aWt0M0s0SjdxTHh1S1pRbkMxYU5YRVRE?=
 =?utf-8?B?eU1JZE1DcXZzQm5HR1k5YnludGJhbEIwWi9KVzFwblhwbnJQRXF2ck9Wa2k4?=
 =?utf-8?B?WWpqM3dmQ2hTYUtCalBXMkoybUpKQmpCVGNROGxKY2gvcHlkYW15SUN1MHFQ?=
 =?utf-8?B?aG5EZkI0OVg3M1lQTzB4UUJ4a0pBWC8zc25FRW9Kclpla2NxTi94NERKdXI0?=
 =?utf-8?B?Mk1uTEpvWkl2YVJ5VVFtZW9LdzNCMHl1eHE0Q3d5TzhJRFIremVySjJrY3JZ?=
 =?utf-8?B?UldrenBNTHAxaTFQb0NOVm1rZUxwajczV3M4QVZweTA1Y1BIRzZsWG4vVDA3?=
 =?utf-8?B?eU0vbjRwalpla2hYNmwzV3ZHbGNSL05VdkJLL0xvOUQ2QnVjTEEybGRuZUg1?=
 =?utf-8?B?TWgvWUp6WUdWdHQ0WUZlR0s3dDIrSlEwVUZQMkV1YXNHRmUrVWUyamtMclUy?=
 =?utf-8?B?YzRhM3dhWEV1MmhRRDkwRzdsUU5kVytMWVBoT0t5K0FVVFQzVFdnYTNUdlhJ?=
 =?utf-8?B?YnNFeGZ4K2gzcUNkdUEyN3dQWXMrREhKTEVKaExybFpQSS9FREVXU1VDYXgy?=
 =?utf-8?B?RVZiRUV4djVhVXBaRzNTWVV1QVRuSUZKamlHbG4wdW9kM3FXVkgrMHBINENE?=
 =?utf-8?B?M2RQa2ljZ0NtS3M5K0tvaHAyL1VxcGxLQ3ZxY25YSCtXdHpCUHM0T3p0cmVz?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bAB91S4kLgoEJLXYvtxXxGmnokTH3WcSdEtE/5vXZco5ooZ0ga0QV1cUoFliziVpmQ6j68WaR9O5/GwXN6DVn6XY5ZG3N83uSk7qcBWYNF2tpP6tYPgD6nIu94t01iI+NPUt2zhokdYiKJeprHCncKQ/rvTSR2va/2nQr2KtGvFu0HR7pgY1id2P5ZhUBzLsoTykmtgP6qYNcVI/HH1cd9KkyJKqnlUgO7cKhc4JLCS+D88EQuyFy3wxeAyGgfBrmGB9EJbrEffHVr9CEOgQuqW1uZx1RXgcQQuU3swe593vWCkjGX3qhwpcplfjBOSjnYcGRAMFa/6ovP+X4Hf3vBmQ8psy5oE9ZqUEgrTjQ9YqXvvhVSK4L3zf9yyRrz17ukzIQuvFKDrJ7eUx1wJRLLfMo8qzD0LUMQYuUHjw0sS9tUdWDM9Q0m0ZdfVKUa+z097b+ge+5mEv9bcUrRqMGFURXZxNfThu+4KGO1GHD1+rPnOthoT+zrADDITDZtcydTqTZISTbuSr9w3YCFst6W2dp8WlPXzOJGS0kedSJppfrCTPZYOtqvY6zWYkBl7bWYpd42B1VjVKQL9xz7vtN3HsidF/RWufn1KQ6hYkfAuhL8eL1qbLJk3NJ27UDtZa+4+W7qZ6auJbYyHZu5/I1uh6++TFQShPk7VfoioGkZxtAxk6EZ+ntRbSsVseldHyPl4oildy9eCGwmwTfwpL60R9GtMR0o7ujosVQM3WejI3ssLCX0trPAOdXJtv/bb91GnsovrhbldwinLtDL/nJy1+sRdxYHwX036vQF9zDEBo/CFq1Ihm5tdQ5h0gwrSefjYx6WqUJNFF+7pvW4Z6Gz+MZXJkPuLWrU4va0kakn0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db3836d-f98b-4d28-189f-08db0e7ac168
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 11:01:00.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Zf+W2QjHnC0RBTDot58/tPyJoPpOxtx0SB44zB2mV6hjl6P8KSEUKzb1efIkIwrdcnpkD3PTHBtphQjPXDvFhDIQ7Xzvo0LoIWfZkZxLDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6607

On 13/02/2023 2:23 pm, Michal Orzel wrote:
> Add a debian container with cppcheck installation routine inside,
> capable of performing cppcheck analysis on Xen-only build including
> cross-builds for arm32 and arm64.
>
> Populate build jobs making use of that container to run cppcheck
> analysis to produce a text report (xen-cppcheck.txt) containing the list
> of all the findings.
>
> This patch does not aim at performing any sort of bisection. Cppcheck is
> imperfect and for now, our goal is to at least be aware of its reports,
> so that we can compare them with the ones produced by better tools and
> to be able to see how these reports change as a result of further
> infrastructure improvements (e.g. exception list, rules exclusion).
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> For those interested in, here is a sample pipeline:
> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/775769167
> ---
>  .../build/debian/unstable-cppcheck.dockerfile | 37 +++++++++++++++++
>  automation/gitlab-ci/build.yaml               | 40 +++++++++++++++++++
>  automation/scripts/build                      | 11 ++++-

I'm afraid that I'm going to start pushing back on any more x86 jobs.

We're already at several hours to get a run out of Gitlab CI, and that's
assuming none of them hit networking issues, and outside of the typical
European working day, when patchew is busy churning and not reporting
the status back.

Right now, there is vastly more ARM test resource than x86 resource, as
evidence by the fact that you're never waiting more than a few minutes
for the actually-ARM tests to complete, so adding more x86 cross
compiles is compounding the problem.

We need less x86 testing, or more x86 resource.  Probably both, because
its now so long that even I'm not using it as a pre-push gate on all
changes.

~Andrew

