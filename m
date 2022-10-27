Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3760F8F3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 15:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431049.683538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo2rP-0002Q6-34; Thu, 27 Oct 2022 13:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431049.683538; Thu, 27 Oct 2022 13:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo2rO-0002NX-V6; Thu, 27 Oct 2022 13:23:50 +0000
Received: by outflank-mailman (input) for mailman id 431049;
 Thu, 27 Oct 2022 13:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/85=24=citrix.com=prvs=2922bd7c1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oo2rN-0002NC-MV
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 13:23:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88e0cb3d-55fa-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 15:23:27 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Oct 2022 09:23:44 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6377.namprd03.prod.outlook.com (2603:10b6:303:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 13:23:43 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 13:23:31 +0000
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
X-Inumbo-ID: 88e0cb3d-55fa-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666877028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=U/sFfRACaJY77fr7H33N73W/nGnZ1foREkrO0xbsYcw=;
  b=AQDlK/WWKoguwTwvgYOQSev8b9mrPYLlJWjHJ47O9LFvDWMA5COgFCa2
   rq/Wea/ZuyoS4A5+oOW1tr0piEZuHdC/Qfbtes7Zf+Xs8IlcNr/BJy9tz
   Kcgb2bVHJBBPDnwcf4oOJ5GI611t60eYvFYZQprFHGTqkuL8+SWlBW20H
   A=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 83623811
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mVcLZ67jPFFH3V3oSgSrQwxRtAnGchMFZxGqfqrLsTDasY5as4F+v
 mNNUW7SO/6PamD0c4p+Odi/9kwAvpHXnNdiT1dqrSxkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gZhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5lW0UN/
 N0IbwsjaxK8pcyHmemZFPZV05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL32LWUzXqiMG4UPIGBrMVGgHSe/E8KKy0TVXyGofS6mkHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLT5lvaCRSHmd3qyJtj70Mi8QRUcabDIAZRsI5Z/kuo5bs/7UZtNqEarwi8KvHzj1m
 miOtHJn3+RVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:VhsRKKA333MmKk/lHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wc9HaIGOud5Dt
 v/Q9VVfcl1P6krhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.95,217,1661832000"; 
   d="scan'208";a="83623811"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI51BFXkQ/fWwzzghTpKMQtPfY196xMt/RSSlTSCyKWAMbvwh9k06aPMklfQlL4nTnaGQk1F4/AHOpicDkeU11kSAwp3JL7YqcPBzk6GdS72ZNND29Lz/sigdDR48v6kr/nSfQSVsZyniRZEf6T0vF3g2vOfvFPt5t7+HpxWqzj/ogEijsJulasOld0W+NEblUTx6xsu8JfyfEU/QNwEKolN2BisM5kX6qg9aemcw64w9odg5kUfVoWPJF/Zy3CuVGYdVCgeHOjisF+i1V4smzXYkTxr/VHXGzmf77DocKdPmrlsQy5GxDuLvzqNF/vhqeI32x/YGJM9HbCiimTSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igYZqg1x/g0JshDU5Yx+sFod6AtAlB0SWplM18oXcQY=;
 b=ePXEJWPUALfOAtr0jpMY8ar8PoBwM+cVeGx1G6egtPlxkggxdJGoXVS8573cy9sFNeCnn4riF2dDFXXWL1qFW9uc4le/ImD4Djn3yfZw5+6xh5bUVDswvMY//egfv0Uj+UxH/YiKec9nDPSIFHoaoly9Yyb9mr6cTCIuu/Ab8WWRSQ3jGw3DvIRCf8aOdhyNf12vzPVWEEgYwu8U6UxXyr5MK6m+FVFMVHxDttKH+dHVKJJb8WA5ugFykutm89iUFR8pdGDu0McPR+Lv8vK7r40GWxl3/9m3ogEJJlPhT9nTIGhu+ltAwmkU4dZjKpH2I4xJhQ5/dJqSOpc6LlvYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igYZqg1x/g0JshDU5Yx+sFod6AtAlB0SWplM18oXcQY=;
 b=w3cQV+vIadfMOTS7BjMsU5iZt5W918svDLOiNiqHL4UKoKSuyMfSkarcxQsf3rlaq67enNorVv+fj9/mo0GX89izFVM0ea24/+9FnFbfVA2lJSuOpfC/EcLt16GOkBCcFH8VXCQoEZF/46MrnWBQLnqb13OWLx0ZBoQvqlOlfGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.17 v3 1/2] pci: do not disable memory decoding for devices
Date: Thu, 27 Oct 2022 15:23:14 +0200
Message-Id: <20221027132315.80592-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027132315.80592-1-roger.pau@citrix.com>
References: <20221027132315.80592-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR12CA0002.namprd12.prod.outlook.com
 (2603:10b6:408:60::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a7e494-5121-4657-c5a5-08dab81e7064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/PjSTZePNQwqz5obKwcH9L5IQ67iJdKUw3K5CMmgGVSRgEGkkHdTD4xLxrxkXMV6BS0s/jE3P85ZZA951NyX/kaZo0cpt30JKeVF+csunYqj0taiSfF2XfE2sv32KSNfSKQxNdJ6NvvWOWRCTQjxptk11IlcqpgAN15+VpcScdXTAEKNjQWO9eKU91mXMiHwuqzlleJogY0TBd1ajhyRjiVo89SEC5I/Fbgmy1W11XkZsKqrXFOkzMExblinHAj8FhUYLee8a1773z0Xdtm3P+BqikeJfnDD4inNo1LIZhXlblVYUnI4DxeBN6Gl4YnBXKzurw5RQFXTJKyDMf1FiXaS9JdiL5Sldm46//neUBn8ejIJ3wUILYu/IGLNwJVVx7rNnsVeD/+Srg4fZwdK06ifBCtvHXldxUirFaeYYOOq0KZ3o0V/ga+Ef6QECzhds/vqp4NAkqV7kmJdmpUUTUSn0fTEQ5HTQmVRLL8fkAxYqrqgTVYLxDMK19+IzpKEpAiyuAC9KNJDHVHgTRlYQ0xkekBjgbqN1WUq6cPMllN/N/1/e/xhd6UjPjNTECsMwy3cmmXz1EV0oosuPI1Hg2pAJEc6fYxKR27Fq6xwQHVQ3RBA9xAE1a1q+iRKCKQnB/WrWlTZYlfTKkl7HN4jly37FpuG93J1py14bpYCuBF+LGcX/RwaJod41m4Gp+PmLKF7l3ab6SpkZ9kGCy0QDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(478600001)(83380400001)(6486002)(54906003)(6916009)(6666004)(82960400001)(1076003)(4326008)(8676002)(36756003)(186003)(66476007)(26005)(6506007)(8936002)(41300700001)(38100700002)(66946007)(66556008)(2906002)(316002)(6512007)(86362001)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVkzYzhIOGN5dWhMNDlCNlp1N3pTK0Vvb1RDM1c3cndGMm5TQTlYVm9HRm96?=
 =?utf-8?B?SENjRjZESzJNTFpzQUFZSjEyY0ltdVpCam5Cd2IrRGtLUDlqYVliRnFQUGU3?=
 =?utf-8?B?R2h2dTI5OW9hZndCUzBRZWZ0akYzUk16c3VRUzhHMG1uMlFPcEFxTm11bDdI?=
 =?utf-8?B?N1R2WjNSQjVCR1JnRDBLZGFIdmJMU1o4NUZGNG5xYWhPWkNOU211UWFXM0Rh?=
 =?utf-8?B?YkYyWVlqaklHdlZNSEE4NUY5TDJFVHlaTmtGbXFHY1VGeFRuL3JCRThaejR0?=
 =?utf-8?B?OXgyU2NPa1lJd3NZZU51d09iSFJPb2xrUGV4VVo3aEV5Q1EwTW52YUxLOWZx?=
 =?utf-8?B?WDQ2Q0pBc0wxQXArOFNlN0YzVksyQ1VOMVg0aWxVcnZoNnlxU3M3TzVtWGll?=
 =?utf-8?B?OVBRQlJsVkRDQUpUd1FRd3YzZE5JNjNaS2FDRlFQaFR0N3d6d2hRdXBXSzMr?=
 =?utf-8?B?OW54UFpFZCtnSnVHb05SV1JyRHpsMFRLVFFpZWZRUkhORDRFNnFnNGQ5bDcz?=
 =?utf-8?B?L0V4Q1FzTUZmbStrODU2M0hLcFJ2U0tqc3pBRjFtT01YSFN1STJVTVVoMjlU?=
 =?utf-8?B?Y0V0dTlOTERUK2pReUJsdXdwQzgzdExpTzcvTFVFOXExV3RQYTk2dFFIZEpt?=
 =?utf-8?B?RjVib1VBczUvN01JK21zSGgydWUxUUhwVkgxSWRmRlNsN3R1YUt0QjdEZEV3?=
 =?utf-8?B?cVZ0Z2xHa3dhR3B4cEdsWE5jY2lmYkZxSlFDSGl4RlZISXJPcFpJMUdVbks4?=
 =?utf-8?B?ZklNVjRLMEpRY01ZalJ2ZzBFd3ZudXJ4TGtKUnNCUmVrczdsSEI5NXh5R0pD?=
 =?utf-8?B?MDF1UUh3d0Q1S2NGZStFODIxZ0k0RTh4UHd2V3lBSWhjTUk3Y3RkUFlpbWNy?=
 =?utf-8?B?NXJ6TG1IaVFqMFJyZDlrdzA1TTlCdkEyQUJSeEZSZlFJVnAyVWhIVjlNS3hK?=
 =?utf-8?B?ZEJENDI1N3RlS0xpSXRSZW5qZHE5N3M1M1BFRDdMcjdIRGxaVDdGbUdNU3p1?=
 =?utf-8?B?U2FXampyODVxQkh1L3E0eGNJbDk4RGxTd0ZwQWQ3ZGJMWGcvSDErRi9pTEh2?=
 =?utf-8?B?MzRLUVdkWnhkQW80cHNITHQrL1N1T1Q5QXFzclFjSmN1ZmJ6dGhhWjBWcUNF?=
 =?utf-8?B?M0RXVy9aTVhtSndtdUhWWlZnczl5MWtKcDEzOVliOHBUTjIybXpoNUZyV3lK?=
 =?utf-8?B?a1JvVnRKaHZhTkRWSmVBdUdHZCtmd2l2bDBVOFdUU0ZROVNhanoySTg5OXMw?=
 =?utf-8?B?NEJGVnBGQkcrOVNocThQaHBxQ0hYa0pBQmlZaEpFM2pMV0JOc28wZVFsSTEv?=
 =?utf-8?B?b0R6VnVYTWF4VjJrU24wc3R2dU84dlJhTjlNc29IMGRvdzVzbkUvakc5Y1Jm?=
 =?utf-8?B?ZFFINnd6VXZxTDVibUs0OHRyaytDaW1zZS8vb3FHcFRzSkk2YzYzWGNSVTBD?=
 =?utf-8?B?Z0luamxjNFF1ZEwvSVVURHRvcWtRcHozM1RDdFVyNnpvSTdSSUlUamhyVWR1?=
 =?utf-8?B?VkJpR2lYNXA3YWhvSy9IemZSdHlkR2ZwWHd2NHBXZzJacDlUZEUzcHlGZ0ZU?=
 =?utf-8?B?MXpkZG1CYUJEZm9NVVp6QkJrZm5qSXlXMmZKZDhwRkRDUDJKTVpraG9mL0h3?=
 =?utf-8?B?SDFrczdseDVleGJXdWgzaFp4Tkl0K2o3UzZDN3VBRVRQenQ3U3Mxc2lNNmlN?=
 =?utf-8?B?ZTVvbnhCRnh3cUJuRnczNnZLTDE2cHhlaVY1SDdJYmZEZVhCdUdFQkNydVVD?=
 =?utf-8?B?eVlzeUVpZzJTenRyVTBxYk0zbHh3MUZWR2FISWJHaVVwTUVkaTJLVWpvK2FB?=
 =?utf-8?B?d0VTOVRqdm9jMVArWVIwcXpWY1pFc3RyQjAxeFZWMnQzYVBiNVc5VytJdW1o?=
 =?utf-8?B?RWY0RVgzdVZCY3dLcERQRVRuZG1HdHBTWDM1U3JKZFZvbXNaUVNmMWRCZzVN?=
 =?utf-8?B?OFc2U3p1cElreTVxNTBDYlhqRGxnVTNYdEQrL2pzejVndGJyME5oQ2dxcjNK?=
 =?utf-8?B?V1IvWHlINUV1czFaOFFIM1Vwbng0QmdndklJdGRvWURpSG9xVWkyV3JHb1dU?=
 =?utf-8?B?TnZlQzUzZU43TUtRbkRDVEsxeGlaeUxhUEVEY2tXS2ZvOHgwQ1Btb3ZxS0hj?=
 =?utf-8?Q?JdMJBJGX5TVkehB8DZuNQ6ayi?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a7e494-5121-4657-c5a5-08dab81e7064
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:23:30.9433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nct6zTIZ3s8McLRjy6ij7GbimV40vd/j0mCPwHOg+fAj669J+L+aDukV8CqDUFJUTDiwjQEHCNC2V2AJ0IlBZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6377

Commit 75cc460a1b added checks to ensure the position of the BARs from
PCI devices don't overlap with regions defined on the memory map.
When there's a collision memory decoding is left disabled for the
device, assuming that dom0 will reposition the BAR if necessary and
enable memory decoding.

While this would be the case for devices being used by dom0, devices
being used by the firmware itself that have no driver would usually be
left with memory decoding disabled by dom0 if that's the state dom0
found them in, and thus firmware trying to make use of them will not
function correctly.

The initial intent of 75cc460a1b was to prevent vPCI from creating
MMIO mappings on the dom0 p2m over regions that would otherwise
already have mappings established.  It's my view now that we likely
went too far with 75cc460a1b, and Xen disabling memory decoding of
devices (as buggy as they might be) is harmful, and reduces the set of
hardware on which Xen works.

This commits reverts most of 75cc460a1b, and instead adds checks to
vPCI in order to prevent misplaced BARs from being added to the
hardware domain p2m.  Signaling on whether BARs are mapped is tracked
in the vpci structure, so that misplaced BARs are not mapped, and thus
Xen won't attempt to unmap them when memory decoding is disabled.

This restores the behavior of Xen for PV dom0 to the state it was
previous to 75cc460a1b, while also introducing a more contained fix
for the vPCI BAR mapping issues.

Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Also check ROM in modify_decoding.
 - Do the checks for all domains, regardless of their privilege.
---
 xen/drivers/passthrough/pci.c | 69 -----------------------------------
 xen/drivers/vpci/header.c     | 21 +++++++++--
 2 files changed, 18 insertions(+), 72 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 149f68bb6e..b42acb8d7c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -233,9 +233,6 @@ static void check_pdev(const struct pci_dev *pdev)
      PCI_STATUS_REC_TARGET_ABORT | PCI_STATUS_REC_MASTER_ABORT | \
      PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_DETECTED_PARITY)
     u16 val;
-    unsigned int nbars = 0, rom_pos = 0, i;
-    static const char warn[] = XENLOG_WARNING
-        "%pp disabled: %sBAR [%#lx, %#lx] overlaps with memory map\n";
 
     if ( command_mask )
     {
@@ -254,8 +251,6 @@ static void check_pdev(const struct pci_dev *pdev)
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_BRIDGE:
-        nbars = PCI_HEADER_BRIDGE_NR_BARS;
-        rom_pos = PCI_ROM_ADDRESS1;
         if ( !bridge_ctl_mask )
             break;
         val = pci_conf_read16(pdev->sbdf, PCI_BRIDGE_CONTROL);
@@ -272,75 +267,11 @@ static void check_pdev(const struct pci_dev *pdev)
         }
         break;
 
-    case PCI_HEADER_TYPE_NORMAL:
-        nbars = PCI_HEADER_NORMAL_NR_BARS;
-        rom_pos = PCI_ROM_ADDRESS;
-        break;
-
     case PCI_HEADER_TYPE_CARDBUS:
         /* TODO */
         break;
     }
 #undef PCI_STATUS_CHECK
-
-    /* Check if BARs overlap with other memory regions. */
-    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
-    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
-        return;
-
-    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
-    for ( i = 0; i < nbars; )
-    {
-        uint64_t addr, size;
-        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
-        int rc = 1;
-
-        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
-             PCI_BASE_ADDRESS_SPACE_MEMORY )
-            goto next;
-
-        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
-                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
-        if ( rc < 0 )
-            /* Unable to size, better leave memory decoding disabled. */
-            return;
-        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
-                                    maddr_to_mfn(addr + size - 1)) )
-        {
-            /*
-             * Return without enabling memory decoding if BAR position is not
-             * in IO suitable memory. Let the hardware domain re-position the
-             * BAR.
-             */
-            printk(warn,
-                   &pdev->sbdf, "", PFN_DOWN(addr), PFN_DOWN(addr + size - 1));
-            return;
-        }
-
- next:
-        ASSERT(rc > 0);
-        i += rc;
-    }
-
-    if ( rom_pos &&
-         (pci_conf_read32(pdev->sbdf, rom_pos) & PCI_ROM_ADDRESS_ENABLE) )
-    {
-        uint64_t addr, size;
-        int rc = pci_size_mem_bar(pdev->sbdf, rom_pos, &addr, &size,
-                                  PCI_BAR_ROM);
-
-        if ( rc < 0 )
-            return;
-        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
-                                    maddr_to_mfn(addr + size - 1)) )
-        {
-            printk(warn, &pdev->sbdf, "ROM ", PFN_DOWN(addr),
-                   PFN_DOWN(addr + size - 1));
-            return;
-        }
-    }
-
-    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val);
 }
 
 static void apply_quirks(struct pci_dev *pdev)
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index eb9219a49a..d272b3f343 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -115,13 +115,18 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
             uint32_t val = bar->addr |
                            (map ? PCI_ROM_ADDRESS_ENABLE : 0);
 
-            bar->enabled = header->rom_enabled = map;
+            if ( pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
+                               _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
+                bar->enabled = map;
+            header->rom_enabled = map;
             pci_conf_write32(pdev->sbdf, rom_pos, val);
             return;
         }
 
         if ( !rom_only &&
-             (bar->type != VPCI_BAR_ROM || header->rom_enabled) )
+             (bar->type != VPCI_BAR_ROM || header->rom_enabled) &&
+             pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
+                           _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
             bar->enabled = map;
     }
 
@@ -234,9 +239,19 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
-                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
+                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
+             /* Skip BARs already in the requested state. */
+             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
             continue;
 
+        if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
+        {
+            printk(XENLOG_G_WARNING
+                   "%pp: not mapping BAR [%lx, %lx] invalid position\n",
+                   &pdev->sbdf, start, end);
+            continue;
+        }
+
         rc = rangeset_add_range(mem, start, end);
         if ( rc )
         {
-- 
2.37.3


