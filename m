Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DB725794
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544486.850300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oVp-0001Fa-LK; Wed, 07 Jun 2023 08:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544486.850300; Wed, 07 Jun 2023 08:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oVp-0001DA-Hb; Wed, 07 Jun 2023 08:27:25 +0000
Received: by outflank-mailman (input) for mailman id 544486;
 Wed, 07 Jun 2023 08:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E03=B3=citrix.com=prvs=515218b52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6oVn-0001D1-Mo
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:27:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2cf6f5-050d-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 10:27:22 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 04:27:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5019.namprd03.prod.outlook.com (2603:10b6:5:1e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 08:27:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:27:14 +0000
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
X-Inumbo-ID: 1f2cf6f5-050d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686126442;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sNeF+SQmOigNHZCtAXOjJRgjaNZujICR658QGDTnN8E=;
  b=JTqgYGuHl2nDCIniQjbBMPGXOAhIJKMV1M6hDYd/Cu0JAh3opVTBZHxI
   ooNfHAZ+Hxu5ndYOnitzGy+6sTG9AxGI4NNFRbG7ZGYg2GSQzCOrvM7SX
   6/MCnLEaLQjASKcEhirnwewkA/6LaSIB3f0RIZTTjEJndo933W3nkyi7t
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 114385880
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:49hSda49QRuJBD6M5Q3svQxRtLvGchMFZxGqfqrLsTDasY5as4F+v
 jcbW2HVM/uJZzb2L4gkaN/i9B9UvJ6GmIRrGVc4+XwyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 uNIJjsSVQu5jtnv4L2cCed2m/55BZy+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLSOboq6462DV/wERNODY/UF+eg8C/1EqfUolZC
 RNKwAcX+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRRtrbmURHS15rqS6zSoNkA9J2IYeTUNSwdD5tD5uZwylTrGVNMlG6mw5vXqHRngz
 jbMqzIx750tisoM27S+7ErwqTumrZjUTSY4/gzSGGmi62tRdIOjIoCl91XfxfJBN5qCCEmMu
 mAenMqT5/xICouC/BFhW80IFbCtovyDYDvVhAc2G4F7rmr8vXm+YYpX/TdyYl9zNdoJciPoZ
 0mVvh5N4JhUPz2haqofj5+NNvnGBJPITbzNPs04pPIXCnStXGdrJB1TWHM=
IronPort-HdrOrdr: A9a23:HD+e0Ksm80wGpewDuxL9lyyX7skDYdV00zEX/kB9WHVpm6uj9/
 xG/c576faQsl16ZJhOo6HjBED+ewK4yXcY2+Qs1NSZMjUO2lHYT72KhLGKqwEIcBeQygcy78
 tdmqFFebnNMWQ=
X-Talos-CUID: 9a23:5VobaGMfDWbjqO5DfzY3+kULIdsfe0aE7Hj3YEGiFFwzYejA
X-Talos-MUID: 9a23:m98+JwXGpJgsj0bq/GHcrxhnMOJK2qLwDGEEypMk5Je+GBUlbg==
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="114385880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8cvls1dzcctAsHZ+SR8ILujZZmAtzLbm2iA0OLrPtVoNeJx7Qth/zuQE1qxbxKcy+1tvmgt4ct06us4SVjKEAdzS9Gm9b/WyowPGGX4WWdT3e5eRHIA+pDsX7EuLyfYgdvue0DjLFFI70ABRKxvvK8bGg7TpOy7Vyua8RhEg1hP86AwUTXEya/FDBh4kdgx9EIB9Vgx4QRMsXUgiESZwpiAhoiTavvtEdreu0xPWWA6UlKHHYAv1NvC6zFW/6TClAt1f2UmtA9ZHI0iW7bgQcsbpM+mFpjTfbsruH8ulrxwiaTkrQf50dnVcjfC2r5yPyPfic7iu7m3DAOBXvu65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFLddoAdZkVVDy5gA7dtDLaUUQfv3wgSUnIh6Yu18l8=;
 b=AGd8AoYGPO8cNBsa5An+/2gV13dRqoX9bf/XxbSMsJaGEbQZIVit/dwJlEJ+yGhcui12UIlnSCzGM/OzSZ9uXiucVAIPQ/LtIa1Hxzf0eTAB+A4XSiPdY6mAUTSsFkEHSYSBtmCAy0agMA5zV8Y9/W1VLifCs/sV97IFLQKNS5gcqSu4NH1glVvk3OhSvHpMGPogo6Ba63uOH/WPnGCuqtvUFep3qTUIxBU9l9bkZozAuLoBaIykl00nS9MH8Jszx2JU1E5Gg8ZKhIkpd4U4nO2HDtIRsym1DD+V/spE4fimKlIi0tEPUlnHZ6HbcjZJL6YVyftJNTY0QyYsiAPa0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFLddoAdZkVVDy5gA7dtDLaUUQfv3wgSUnIh6Yu18l8=;
 b=e+S5dmh0//S20H208614ILZbmBtCmqW+ORLTpoy9y5usZlm69y7m0KTSY0/pwPzmp6tont3KCTRbmddkcqd3Fnfyop/aKTTNoPAoeFPqDs0CSCLaprw05Rh7T5su28H8cNtXyBR3CCKmF+TWGQLFpJOP06FKlGnEYjIS6euA03s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ea007739-75a0-7c67-75ec-15851729c2de@citrix.com>
Date: Wed, 7 Jun 2023 09:27:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen: Fix incorrect taint constant
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605112303.1764183-1-andrew.cooper3@citrix.com>
 <1f356d3b-7068-088a-a59b-eadbfb3f59cd@suse.com>
In-Reply-To: <1f356d3b-7068-088a-a59b-eadbfb3f59cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0028.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::16)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 6736fcb6-c6cf-4ad0-c6a3-08db6730fe73
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UktvgwTaC7YSYCp5HmydQgLYAZMs6UAxVHkumMI7AcFU+wonkJG5vTJ8wlIQL4CDHjd8fQ2hCW+3hugJ6iMa/7xpVFCZq/OPue3fVaY3iGiElz0ONaD9oJPX9O4ZI8NfCk6RKHCm62+ARrCcFAaQFQMyzjhRoSP6fqo4g1MVN7TpHEv8tS3ImnqnZz/9jf+xBvs+Jlg7H1auB9Jli1RZrDFDQs2//yFTHS04pKPqFG5hVEQrC+9FGwGIVvfbV+gVcRwe8QTk0oHYPvW/aEwl4dz6/uP7SMslLETF2A9g9ITEWpY/xwmdda4yswryvZWXcd3Qsh8UI4OKSYdF1Ya2NBSNIPBV8FJoI+SnKTb9EFA/CVlKHIuoeeO87iRz/mHTmgrC/TBd+apy8M/JSgj71DPUnRBYXxz3JjysJ5ycALJ3s/CAtsDyxSMcRXGjhQ8gEwORikFkOX9+rcc0fDUBl3wtMKhcAB4fa+wbAGBN1BS4zpheGRYMqunE9NkWiKUf+Ifq9ZfGCF5wOPIw2Z3F/fuVmGala9h3PTPWIOwAmJCn1fntBwi1o32v+DMPGBBXTUZVIl0i0+yDJms9cgZguphbskoRIMZLpBEvnzZUVyS1p3itfQ3muG1zQHYobNGE90SGVPP/1Q0W53G4qHpvVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(36756003)(478600001)(5660300002)(110136005)(54906003)(6666004)(8936002)(8676002)(316002)(4326008)(66476007)(66556008)(66946007)(41300700001)(38100700002)(2906002)(4744005)(82960400001)(26005)(6506007)(6512007)(31696002)(53546011)(86362001)(186003)(31686004)(2616005)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjRTeEtjcTVNUjZIOTZMelNIa2hnNnZHNlByYVVVVitBQzZoZEx1TGZVSG11?=
 =?utf-8?B?SVlIYlFXOWZJVXFOWlp4czk3cUR2UmQzUW1rc2h3OU5vaFJCeTFocWNTR3Bu?=
 =?utf-8?B?RmRBTWR4VFhDT1Z5ZG1TaVB4dDhRczhKTVJiVkhWVndTWEhlblEzNTBtWHZV?=
 =?utf-8?B?OGFVSDhPMjVRajZnbWhYR3ltSXBkdWh1WFVOYU9xMHROR3poT1V2ZVRiUmJR?=
 =?utf-8?B?bXBob1pjQUxKYUFkamZ1akZiZGlLVnptZUlubXNyRkpvT09VWkUreWpoVUJk?=
 =?utf-8?B?Z1d4ZVZNUmVVVVlualhBeDJBSHF2WVpRd0hnTTZ4dkFCWlVyZWp6TVpaVUR2?=
 =?utf-8?B?c1VkRkpmd3NiWnBXM2FSQjJJWUhwZzRmaXFTNVJSUElmZmo2TjBqWlMvQ01V?=
 =?utf-8?B?SUJ1bFI5YURmdnUzZFZuTWJ0TGdCK0VPZmpCWXRLSWh1RkJUNDM5dlo1UWI2?=
 =?utf-8?B?bXhMSTZUTTViR09mU1dzQmFtOS96Z1pqSkhFYVVub056R3RtdThzWGRFaDZy?=
 =?utf-8?B?VStCenl1OXdndVNJeVZQV2dZMFNsS1VaRDl6L1NqY0s4c2lDbjZpcHlCcFNp?=
 =?utf-8?B?ZFJ2Y080ZlVUcXQ4amp2QzRCWUlyYU5jMyt5SXYyWDF3KzM2S3Z5bDhlbFhR?=
 =?utf-8?B?UzZVN0lKM1NZQk9hTWtjR1d3TzJGZ3RWaytWZWEyY2ExaWw3TjVIMTBLV0JC?=
 =?utf-8?B?Z3pQTzdibm9hcDVtOUkzUkFLWE1WS3pjY0w3bXcvQWNnaGtNL3JtdnNDeDBS?=
 =?utf-8?B?ZWpjQlVVWjQzZjJWVWsvYUI0UzZPbERENi9kTWVhbFNrL2VIZG42Mjdzbkl3?=
 =?utf-8?B?WnJBejB4MU1xbzVBZGNZVFVSaFMvM2dkWFErc3lFbVl5N203SzFSblNXeXdv?=
 =?utf-8?B?S2xJK2dpMHFzRGcwWHNZMjQ3YU9UaC9DWHRYN3FYRHVmWU0wbXZneEdyRHdy?=
 =?utf-8?B?Q01HRWJVV0ZhVWhrMS81aWp4MFk5a2hsMS9wUHBSdFM3c3ZFVS9zbld3WWdk?=
 =?utf-8?B?MytKL3k2eDFpTWlvbEtVcCs3MHdqcXlXK09pakNpa1hhMFZhZTJEd1VFRnor?=
 =?utf-8?B?YmQvOVJsbXY0V3lPR3FjVnQ2Y2JmVllIZ1BBYXduZXZwUW5uZkViZzVtNnQ1?=
 =?utf-8?B?V0xZaDFkeW9SNHJ0THJLWnlRK0hSN0g0V2VkWjg4cW45eWFBWlNmSHBPcU82?=
 =?utf-8?B?N3V2S0JBMW9EL2RmSk9UM3hXVFp2dVNnMHRPSS9UTEo1aGFiRzF6cE1FT1V0?=
 =?utf-8?B?K3lhSmE1ODlVWWhLLzNWMU5lNU9aR3ZISDVEQ2QwNzRVY0ZOOStrbmg0bFZq?=
 =?utf-8?B?cnFwT3g2ck9FZmoxMDlsVnpSOVZTUFIwZ2t4RGNPbFVkSFdLWWNHeHVqcnRk?=
 =?utf-8?B?UENTRkJ5citHY2llQzdSeWxiV1JwWnExbzM2VHpWZ0Q4TmhaU0ZXUTd0M01p?=
 =?utf-8?B?MkpNaEJuY0o4dWxEY0J1d1IvSWx5a0VrdTZzM3BvUG9GaU9VRFdoUDNHMCtU?=
 =?utf-8?B?M1RsVzJVdGdBQ0I5TEl5RVlQS3dUcWxoZW1YZ3VPUVdRYlMvZnByZnJYVEdl?=
 =?utf-8?B?NEgxd29Gc2Q1NUVZUkd3Y0Nma0NSa0M5Mk04ZG9nb3Y2Z0Y1aWxRS25TR1BS?=
 =?utf-8?B?Y2FSanpHQUhxdG4vYy9SaG80U2ZudzV6Q2dzblV1MHNVbWFLUWw2UXpPNy9Z?=
 =?utf-8?B?d1J4bkVZVkNqa1FQU3U3VVBJdHowLzhlM2wyRnRpUGc3WnhvQy9TSHhHQTk2?=
 =?utf-8?B?b0hob0pDd2FKbkFIanRTVlZ2KzI3K0liZnNsaDl6b2V2SnluUVB0Nnk1d1JD?=
 =?utf-8?B?WHZjbkEvaWFiQzloZTczb3dMdk9QSUdYUGNkYzZTWm1zVU14RUo4UVZMR21I?=
 =?utf-8?B?RnpHQUhkTWRDcHlZV2x1STFqKzNubEx3R09UWUNwNkRsVHptL09mOVcvejh5?=
 =?utf-8?B?TVBRMlhyaFB0VERlNnFuL0pvUW9sR205ejcrUTlzVzNqVjBWWmNNR3UwaUZF?=
 =?utf-8?B?MjNqdXJhaVBTMmFHRWg5endEVEVPTy82REZxZDZBVHRGZVFHR0hEVzNJaW5M?=
 =?utf-8?B?cEgzdnVXd1NqS05xM1o2S2t1SUZFbUkyeU56Z1J6blR4ZUkxWGVPUERqMHJB?=
 =?utf-8?B?d3JCaWhQV0ROS3RSQTJEUE1VSWs3TTJzWXZZT1N0V1lOcEwzbkNpRis2LzNx?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6NGnnmJiM/aW2VvP5aFoYY3T2M3e+r2fcYpmJ92wrc79NpI9Og2DjbR4hI11orXMaCiKA9We2NlkWQ/kKldh3ul7iJWTM6csObftaT9QE7ZO6G3AhnrWetQqV9isCMp8D97TknsTgmAYwidhY5nYYW0vElaLGpzr8ODMEvRuG1+6gyXi/54XL3bC/rYe+WWG9wnjJlmQUFpv8ovBU7GGcqiBfXBO3v6CvsSxLhK3uCdvtUimr9BkhgXAeUiabHfE0tRuoyfNF+GL8Hfwi/Fn09oGvzKSWAxN0HN+zQIDHEZTXTFQv/dZ9iPjTMW7mo3H821uL0hXwYH5SWw/h//GrodCCML8t0FbeO/N8VxmpGDtVRgIfAYoBNwV0KvlppaNuFsaxwWdEN11r3qUfCCVtN5SZcmr4DCAlIUpKLIpu4HXedbD5Jyqvkui0fsjix6Zdg6ryyaNXXIRJW4zTIf7SECncAfwJUv0A3TLWvC067A64i0YY6+YcB6pTSrEg08+hKFhwGyRbOUaPcNF7o4ilOlLuJuCnMV7Sd3Rlnq+ioSKGvS2iCHMxCfGMtrSnbn3OfH/X5eyDhxASoKvgaW6m/KCv/b8LDsEHOBlj5mrvfpJ/N9nB7XMjgCvzRwadQXEQ2q+sqRKAmAdyZ1l+kG0/S/H6N629Z4KlWCeH6JceeM1ThSzKYk2tKqufWOfB0u3y98Ey2ZoH7bcKjE2LaAeP0YUsatJ4QXEvfPJmHsm3pT5pt7ghAcENhgQJ/ezWvSAC1CekUV8CNUe0bLdg30ZzZjANhv6Dn1QeVQU4+NugquGRO+jObbzDbj3rtBio1gid8DoK/9cSNYJukW+XlF7oA+fkR/gD27XR3mZYDdGI5SPcjOACTP7hr4OnY4Wjmek0qlcCf9L0hrJD4Yh2vaPVg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6736fcb6-c6cf-4ad0-c6a3-08db6730fe73
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:27:13.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1oKhzbQ25GUxtGKyrSCqZ+Cj/kVb5rkwllhYba6wLFti1AgjCaRReLk+lpdGlCQbSnN+7l/T+QLcCr4/h08e8fbzTCxrA1n3H6wddSSCFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5019

On 07/06/2023 9:10 am, Jan Beulich wrote:
> On 05.06.2023 13:23, Andrew Cooper wrote:
>> v2:
>>  * Fix commmit message
>>  * Update comment ahead of print_tainted()
>>  * Change the emitted char from 'U' to 'I'
> Just to mention it: With this additional change I'm no longer
> considering this applicable to stable trees. I realize that one could
> argue that by taking it we could accelerate learning that we broke
> someone (if anyone), but I'm not inclined to follow this line of
> thinking. If Arm maintainers (seeing that only Arm uses this right
> now) think they want the change nevertheless, I'd include it,
> though.

I'm not overly fussed.  It's not hard to rebase around.

~Andrew

