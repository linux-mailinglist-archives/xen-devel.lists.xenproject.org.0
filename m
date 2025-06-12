Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019EEAD784A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 18:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013301.1391798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPkpk-0007An-At; Thu, 12 Jun 2025 16:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013301.1391798; Thu, 12 Jun 2025 16:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPkpk-00078I-6X; Thu, 12 Jun 2025 16:31:20 +0000
Received: by outflank-mailman (input) for mailman id 1013301;
 Thu, 12 Jun 2025 16:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x/Y9=Y3=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1uPkpi-00078C-7E
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 16:31:18 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8d3bc87-47aa-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 18:31:16 +0200 (CEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CEtcCZ003369;
 Thu, 12 Jun 2025 16:31:03 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14j3v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Jun 2025 16:31:03 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55CFJPiE037808; Thu, 12 Jun 2025 16:31:01 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11012025.outbound.protection.outlook.com
 [40.93.200.25])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 474bvj27uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Jun 2025 16:31:01 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com (2603:10b6:8:f5::14) by
 MW4PR10MB5882.namprd10.prod.outlook.com (2603:10b6:303:18f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.20; Thu, 12 Jun 2025 16:30:58 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8]) by DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8%5]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 16:30:58 +0000
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
X-Inumbo-ID: a8d3bc87-47aa-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8/efdxVOKCXMCVQeo5Pd9gMMFxo4WfeXPv0wYf5eTsA=; b=
	IcTmg0QNRhqAvGriwOmSwHhPqVjs/r94x/+OmGnkTrlrZRmZXXLC+2+6zJ1LsmSZ
	5jDHjiwgIH+vx7S+EwtTG3jRvTxdmPNXDJ9/wRfN+LDu+2bv8UQiWg8gnU3hTR7v
	VRaRng+SAbotjnno6BCM+/iR5K+wN9p4WtErJhKhLwJK/pEViCjMHVdcaCSseGh9
	OJqLXUWjN+oHZsH6tm0iBOBLjJwVO1vx2mtqcggEoen3riGdbl9i3cHDmRmokeou
	2lFWQ5LldRZ8AyeBJeb5JEaFlilioB3waHdDAEFK6CEWplXWIhPC0ATAgkhDoHk0
	OPVhKEzt8NjYJ9K/Ki6D2Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRKeP6UYQ9PiF1sIHie5HqNxQe8lljblKWFsP+/PxaJuBWbmXotEb0uqbSbz0nZ6edW2DHH1//OXVPGLlBgaCt8/l4W11g3FP8V+u21TokPeCIyJTuYAmavlPyqa3JBe11bLvmkaTWgN/OSr7bOko/1zsy+TX22EBz3BI7AYj8H0P8/Lm6SXTywJfTtCa7kmxtAVw86hdR+mIKnX3WDQM/lTgDU9rFlpa2lVJ9WONWvURP4U50w5QInof1EVsd9W5KCKaEag0jrX0yGSrFx9iI9QcIdIadZlJPgWnGPdOQTipt6PxiVSp9D0L/hF/+kIbNiKY4R6E26wwhLnpF6E8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/efdxVOKCXMCVQeo5Pd9gMMFxo4WfeXPv0wYf5eTsA=;
 b=oXiPHB4NEA89/N93uWuCcOtPnsxgRxuSMICzatm0zuQgzjqRONL664y0zAyeHTHX+DWi64NThH+AYMWY2SlXOIvdfeGZ9CYB+kFfwbpZwkkgsLiLHG/ecvezTPJAzDaP2/BbjvWz1+9vxt3r+qTKqHaT3ojRqtTi7NUHD1XYYdLWpMOk4ynu0DhJrJemFzBTjZ0sAMSRLKE1EHRwLxoHk9tAVsh3vdaYf1bYnkkyj+OzXoo4+5BRe2gfCG5d5spuy1PPg1I9mu8Q1UvKLbcDzqm1Rlv6sBQnWZ4X5jd5pbpj01usLbtkynLFRVrFiamBh8gyoyTcd53ZnNU80uLc6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/efdxVOKCXMCVQeo5Pd9gMMFxo4WfeXPv0wYf5eTsA=;
 b=D2TVXGOqREqPTb3/mm8DXoCg/zd84URUNhOXzLz808MLNk0Wvui9957G7hHD9u33Rdl7WImklNBEMr6DtLCaUeOkpd+s0Wrqj1oXjixMJdQRMk1FFuMgCyDwZYlWrYWpGysJ32YRslPKd20VSYMTVra4rJzbg4YwMq9xKaf7GCI=
Message-ID: <81a3551d-a60c-4aa9-8376-fc5e5550abb1@oracle.com>
Date: Thu, 12 Jun 2025 09:30:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/22] x86/boot/slaunch-early: implement early
 initialization
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        trenchboot-devel@googlegroups.com
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5792bec7-cd2f-4d27-aa3b-f417b07c8ea8@oracle.com> <aEn_3U3YxdeUXC6p@MjU3Nj>
Content-Language: en-US
From: ross.philipson@oracle.com
In-Reply-To: <aEn_3U3YxdeUXC6p@MjU3Nj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:510:f::35) To DS0PR10MB7224.namprd10.prod.outlook.com
 (2603:10b6:8:f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7224:EE_|MW4PR10MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 50bac053-24e0-4e7c-83a9-08dda9ce829d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVNBRFJEcDBlNWZNbHRKb0RJUC90WlVGeHMycFlSNUxKZUZwSCttYzlGN3hv?=
 =?utf-8?B?emhWYkVxMm5yU3dQREV2WklrcUVjMStzS2pDZEhWZ2VYZXc4T2lwQ2VFMUpY?=
 =?utf-8?B?K1VTVmR6SVYwbE1FSVg0bVRTQ1VnN2FyU2hkUk93QUZSc0F6TkpEWWgybjZE?=
 =?utf-8?B?dmpiZ0FMRndiK0pWMFJ0YmxSajVJbnBzSWYwTk1xTCtQRzh2WUVhYXM2SUFS?=
 =?utf-8?B?NENpWUVxWHhRVit1Y01IVmlPV0xMeDV3OCtrRGozSTlEUWx3STdzajkvRXU2?=
 =?utf-8?B?SFZFMEg2VE5RdGRvQnNtMjVyb3ZINnBSNWZaSEVaeWl4ZW03cG4xM1BFTGtj?=
 =?utf-8?B?VU1kNjgxOFh5QVRMMkhuTkRWc2ZmWTFtN3ZzdmpGM1QxT3c1dkRxNjIxcFV2?=
 =?utf-8?B?aTJJMTIyUWdjWEdKdll0Zi9kZUhGNGpMOUVYVFRuMnlEdy9CRjkvS2VFTjJU?=
 =?utf-8?B?U2N1RC9VbjYxK1JqOFNoQTZZYmEyTkl5Z010ZkhPRXM4WmJwZDNGTmN3QlRO?=
 =?utf-8?B?RmpRZko5aStpN3NsWHRrZ1UvbEJFMTNjbTQvUmNhQzc0b3dJYmNxUGxCQzNo?=
 =?utf-8?B?TmZTR2RoWklMUFpwTWNwYjdtK0g5Sm9vRlNxN2FQT014enIyeVE0d0tjSUdn?=
 =?utf-8?B?eXBFWjdPWEtXclhFRDVFaUU3MEl6VWFYdU1CQlF5Q3RUN2RydHhnUkZtZW9J?=
 =?utf-8?B?Wlg3d00vZ0FyQ1Frd1M5WkM0K3hsS29oUGdiaE9pMXVoQ1pVUzMzcUgvVHdw?=
 =?utf-8?B?dXVpK3c3STRnNVMydXhMd1hvRnRHRThsTEg2aEJSbVRzSnZoR1pGQVFjSGZh?=
 =?utf-8?B?ZzMrbHNkQlBRRkxaRkpGdzk1RTh2WEVPVEp3SEVXSEszb2VyUWd1YmQzbGtF?=
 =?utf-8?B?cHIxWWxBQmNDRXU1WEJIQUpWT2x1bksxUk5XUVF0TVBrNkF4NXNQY3R5WUJK?=
 =?utf-8?B?d3paQjRKWGFpdGlLOS9SS1VNN1RRd1ZOUmtYYm1yREszN2l3UkF6dmJDaTlP?=
 =?utf-8?B?VlVnRUhwZ1dqWExMOHVaZ1oxdzZmOUsvL09UTHd2Z3lPcFo2Z0RrNnJHYW9a?=
 =?utf-8?B?S0FJMktOZjAxdElDNVNKeHMwdlQ5Yjg1RGxHcjVTRDlqcWdTaWxibVVOdGI2?=
 =?utf-8?B?TG5ldlhodmlySklmS0IxeXZTY0I1WkZuZUNKNEJuZndNZHVvVklnd3VHZmhD?=
 =?utf-8?B?LzEyQVRSL1A5cjVKN1k0MDRhbWpXeTJGQjR5a2VuVllMcENQL0VURzZhYmhE?=
 =?utf-8?B?SFBJanBYYi9nb2c4ZmhvM3ZqOHpmclNwSnF5U3I5ODZVM0VRbTZreVg2QU1y?=
 =?utf-8?B?N3JTZDI4NCtUREFEdTFPL2k2TnFjaVNtOXZmeXllVWJ2d0lBREpKNE5aOWha?=
 =?utf-8?B?SW96RGV0Y2JmMEpLTStBaUc0OXZPMVhmY25CZGhnb05uSTYySDU5NVlKVDgy?=
 =?utf-8?B?NEhIMUMzd3A1VFpTOW9PR3BWRTdjT29sUk1STVl5SW85V1VYYkhnbmRheDdD?=
 =?utf-8?B?Wk1wclZ3L3B4b0E5QzFIWFl6T2E3M1VJd0xDSjhXK2dOd0FJczFUbkY4RGZP?=
 =?utf-8?B?ZnNOT0c1VlF6K1NWcmorUm9JSWRqM3N3V3JwVWt6TFVncnBaYlBjbUdTZDVX?=
 =?utf-8?B?Y3doVlhqUGlpTk5IUXVUZHU4c1JWSTNRb3B0akY5ZmpncUxUTGg1UXRROHlz?=
 =?utf-8?B?TU9nSndoaFhnaEdicVB2TndGYWg5YWFkV3RydWNhV3ZqSldXcHg4Q1BvVlIy?=
 =?utf-8?B?ZzRyNHhiSUlGbVQzazRvdmhJSTMrY1h5dUlld0NwMThhRHdDYWxrU1ZmSmQ2?=
 =?utf-8?B?ejJZZkliVWMvUEN2bHVCLy8yT1YxZjIvazcxNGgyYnVLOUxBeU0xMnMzdmEv?=
 =?utf-8?B?YmtZdzdKUDY2UjdRaGN5dVRNeWxTczdqd2poM1NWVWhzTmREZlJzUVhrL2h5?=
 =?utf-8?Q?EcZgXgN4tWM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7224.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDhHblI1KzA5M1hHdTZuRUFjSXQrQnVhNzh0OHJKNDN6V2kxK01ZVFJRR1Vk?=
 =?utf-8?B?RFZpaHZ1R0JxcCtwbjkxUDdrRXNMa3RyUjUrQlpVUUJEdGJ6MjhobnBmdThx?=
 =?utf-8?B?MXdlcnBRNko5MndGdFBqMXBvMllUek5BenpodFVwaFNsUDBxNCtRMFFjN1Bs?=
 =?utf-8?B?TWFpb2c5UlVMMm43N01TNU1OZHMxZEFSYzNDaU9adGxPbTliam5BV3g2Vmoy?=
 =?utf-8?B?d3dOUC9wTnhQRFdHdGRTdDA0VGJVNEpYZlNNS2FoT0w2VXd1WTNSNkRZRWU0?=
 =?utf-8?B?NTJWcUVkYzVjZ01pU3hFVjVJRGFTZWhIaTYzS0x3U0hndGEwTE1KNDRWd3JZ?=
 =?utf-8?B?TmFUZXNiT01Mb3JtZHM0MVpudGRjZEdhWmZzWjk1TUZHUkZhN3phWm9TeXpD?=
 =?utf-8?B?Qkc3SUR1Tm0yQXQzTnUyeWhvWFVPdm92WWluQTIyT2xwWm1hVmhYZHBhWEgy?=
 =?utf-8?B?VCtmSHVrYzJqWk5OSWVIcXJ2RmdDbVVuK0RPNHRMVkl1cWxvL0NYK0k3cWRI?=
 =?utf-8?B?TTlNQ00wT053QWtTdHFIa0ZnZy9qaFJyN3BET3Jndi9yblYrTWp5R2tEd3hR?=
 =?utf-8?B?QXlDQ0pHcWRuVlQ5dnU4QlVNU1F3WGNDSkJadUYzellOSGlDZEo4SWZPdkFM?=
 =?utf-8?B?OTR4Z3RUSUFaS3dBaTVuYkZKckRseW5ac3VBMTN2Qlk3RVg5K3dCVGN5aEUr?=
 =?utf-8?B?dVU2ZWlObk9tRURSUmgvYU5RanhxNkJxMytIV2xkamNUYkNpNkVBaDhNWUJr?=
 =?utf-8?B?RXRQaHVweDhiekR1UGVBSUp2WnJpK25ST0dZVjREb3haQm1yODVUM3hhaElH?=
 =?utf-8?B?Q3U1bTAvSTcwZVpUVGJGTE5JelpJQVlTVnZrVExZaWlRbmlmck1QM3pQdjhy?=
 =?utf-8?B?aEpwZXRFUUdBVDhDRXA4OHI1M09yRHdBcUFhQVg4MkpyRW9VNTJiSlBmaU4y?=
 =?utf-8?B?UFB1NHRIVG1acDF0em5qRDQ4a1Vpc2xybUF0ZXBKTHN6Uld3eHR1YVVmQXR0?=
 =?utf-8?B?YXFzY3JKeWlEWWVobm54bjd2cmw3NTBKekhHTkxMRjNZZDQ4T1J3bnNmTUFm?=
 =?utf-8?B?cnFFejNsdmZOd2hzYk50NHJSWnNvZS8rakNCTWg0VHVTUEFYak8wUVkwSU1O?=
 =?utf-8?B?dGFybWNSZ28yVUR1TDFIb3pRYWxmVlZpbSsxempYQ1BLRWpNOUxYZDAvOVg5?=
 =?utf-8?B?WmtqNU85cmVwL2VXUXk1bU5uOFpyYmE2VEJhSTFScHFxVDRnSFdHcWxJdnNO?=
 =?utf-8?B?N2V2UUdZajhJbS9IRkdQTGdremxKMFRXK3ppbkd3T3JNTlFYbEwvUTNycm5m?=
 =?utf-8?B?QzBDWkRXdnFrUTFFUWk2VmhQQ01DSHFCYjV1V2Y4YnN6UW9oTjdTVENaM25C?=
 =?utf-8?B?TDA3K0d3WC9hcWdLUUpEaFpMT2NpYzZMTGFXUG44YXNDZmVXdmxpTzNIWVl4?=
 =?utf-8?B?aTNUeFZ0aXRwUkFRb1JCNE1uSTYxNHNhcjBIZzZIUjdtSXB5Y3VYdnArQkJq?=
 =?utf-8?B?ZW1rUEcxRkkrdVR6bnd4dm5RS2pmM2NaTHVkYmE3eXlsblpPWjBTcXk1WjVT?=
 =?utf-8?B?dzRsWklRdy9HdmR5bGRiNUN1UmlOOGwrTG0rUmxzWkRwaVFaY1d0c1FzRWJ2?=
 =?utf-8?B?dFNqUmdrZ3cvZHVORXRqR2lWeGIyNjJROVhiZnYvZUJZK1UyampYTEhOZGoz?=
 =?utf-8?B?Nmk4NE5XZ2w1VFZucC9FL2xrRG9Qc2lIRHdyVlhqZExjWERydFZhcGxmcSt1?=
 =?utf-8?B?alMrNUxwS0VYclIzR1lhLzN6eDIvdElYcVRPY3BRVlN2NVB4REFzaDZRSUNB?=
 =?utf-8?B?V2w5ZDBmMVduUXRJOE12dVJCalE5YlRWcnVtQ1FtZEc2YW13UHlIR21ScTNE?=
 =?utf-8?B?RkZjVERFbDF3OXRYQ3pUU21DbmhHdWR0U282NXhIRWNpdnArcHRKRG53bHFy?=
 =?utf-8?B?ZDRpNXZUay9SUU1KRWljN3hjRm1uN0dlSzFWSzlOZGNmTHd0elQzR3NDUmZs?=
 =?utf-8?B?L2xUa3ZtVFZ4dEpiRWw4bVQzYzAweXltcGMrdkJYcmxEREM3cmdUc3hUVmZB?=
 =?utf-8?B?MmllNy82bUZPQ0p6aERtUHRkRU9oeWwvUXBaZDg3ajIxb1haVi8vcEIwU2dl?=
 =?utf-8?B?WDZmb3MzbllyditOek1ZQlF6amg0S0g4SExVRHloZkk2aUgvY1FYR0NoZXhn?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4Bvo9ZJHcPrSvyamj0CrOXBHj6susR7oXIsvzRjGsw+9gdfhoF2c60mPB2vBs8YrupfXAhNgxMRirpvJ0vcCJJYW49R5a/Jpvfa/tUM1T4Zvxt4AD92UZu6qPx0uUgNlYcu8H3P9TiUnKIQXw6M95o4MYpDxfYCKRd64/jjQvlesR0ttBIFk8npgP5ocQTrirJgsxn+LFrOfc9LmsQYUn4mD4cnXpDsqPlo958gV916a/EcyUwFaYyoqyBl/W7SDTc4onXrDQ+HNGVVS7D3IZzN7z0wQf+bu2BlDlqG1f9byghuaGcSMTW3pCwPz9kUg3KjEZX7Lo4k2vwjey4tYBb0Na5zx0vq1Z+O7p7/PxrNNedFvbWhLqqfHLlQQlGNNxOJHC5VT5ENJofXeOq301R7KWT3WqOPnKvWjukKNZG6Hd0zzcSgjjhnNv1crtBGkVx/ZTkGEjV2aNsifsVX0K9z0377qRmZrMidFl+ue/AB98MmKfv+OXO8KWgCCWv2e1Cf9pCm1JiwjJ/eotPGVQHhCCWtYDxNR2J4m5O8ICTitAtlXtSmJEoi1+qbyAYnatE9XTYA4j+BY8oIciBME8NroHao+t4VKzeIG2uIEGA8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bac053-24e0-4e7c-83a9-08dda9ce829d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7224.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:30:58.0855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UyCZr0d0QsVT2H4z7gIz1Khb54hUPPh6lc6Ak0jqWUR+j+YWI4uqdL3wdc1FyIfRSFOi9TE0LMk0iFRO1+WqR+DDM7Rv8iQWDZs7Y63IFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5882
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506120126
X-Proofpoint-GUID: fz5jgSGcJWczYTUEqBEHA8sDYdmw4ofU
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=684b00c7 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6sjuNymXX6gQSoEFov8A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEyNiBTYWx0ZWRfX9gvxpBQLN9Sg rZ996TvUHFmXGjGbwQFaP4KGrblM9rYSyHJ1rL1RSwj1H4YB4TWNm+BcI25NXEQ+jhbnApAvK0K MInjtJMS3zZZQwFZVST07pfJupKGwwnlqG9FBck3pFCtsDpBEbuyFQ3Z6XD1+1Apsts33cHa0xE
 rNnlw7Zr9fawxg1t2oE7mc6yR14aK/24fSNdsBKcDkkvH2VAWyAPASpoi0D1Hg4/+t9Mlpt7x+J JYvsOLLKBeWG/TV9dp9BBzLIsmUvI3+8L0RhF57lK2hOGeqbQlavFJMz5Ncd7pp2sEkl2dP0rNl 41cVkkw7VO+bAde9ZLZ2zA+pqWNv0A9ehYWcQg96AFv8ddvdV/1dNf+c7wF0uEefizA5e2vOVOQ
 p6Nw1yYnfi+2mGGA9jUfgxmDtTo9km1tVk7jLi7ZfrrAtIE9cGg6pCGUbtq04kxmFOY+AEGT
X-Proofpoint-ORIG-GUID: fz5jgSGcJWczYTUEqBEHA8sDYdmw4ofU

On 6/11/25 3:14 PM, Sergii Dmytruk wrote:
> On Tue, Jun 03, 2025 at 09:17:29AM -0700, ross.philipson@oracle.com wrote:
>>> +void asmlinkage slaunch_early_init(uint32_t load_base_addr,
>>> +                                   uint32_t tgt_base_addr,
>>> +                                   uint32_t tgt_end_addr,
>>> +                                   struct early_init_results *result)
>>> +{
>>> +    void *txt_heap;
>>> +    const struct txt_os_mle_data *os_mle;
>>> +    const struct slr_table *slrt;
>>> +    const struct slr_entry_intel_info *intel_info;
>>> +
>>> +    txt_heap = txt_init();
>>> +    os_mle = txt_os_mle_data_start(txt_heap);
>>> +
>>> +    result->slrt_pa = os_mle->slrt;
>>> +    result->mbi_pa = 0;
>>> +
>>> +    slrt = (const struct slr_table *)(uintptr_t)os_mle->slrt;
>>> +
>>> +    intel_info = (const struct slr_entry_intel_info *)
>>> +        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
>>> +    if ( intel_info == NULL || intel_info->hdr.size != sizeof(*intel_info) )
>>> +        return;
>>
>> Since these are the x86/TXT bits, it seems at this point, not finding the
>> TXT info structure would be fatal, no?
> 
> It is fatal, but early code doesn't have means for reporting errors
> nicely, so it just continues.  You think it's better to reboot right
> away?

I was trying to track down where you make the first determination that a 
TXT secure launch is supposed to be done. I think it is before this 
point so if that is the case, I think this should be fatal here.

> 
>>> +static inline void *txt_init(void)
>>> +{
>>> +    void *txt_heap;
>>> +
>>> +    /* Clear the TXT error register for a clean start of the day. */
>>> +    txt_write(TXTCR_ERRORCODE, 0);
>>> +
>>> +    txt_heap = _p(txt_read(TXTCR_HEAP_BASE));
>>> +
>>> +    if ( txt_os_mle_data_size(txt_heap) < sizeof(struct txt_os_mle_data) ||
>>> +         txt_os_sinit_data_size(txt_heap) < sizeof(struct txt_os_sinit_data) )
>>> +        txt_reset(SLAUNCH_ERROR_GENERIC);
>>
>> I know the list of error codes pulled in are from the patches for Linux
>> Secure Launch which seems right. The Xen work is free to add more specific
>> error codes e.g. somewhere like here. We could even consider using regions
>> in the vendor error code space for different things like generic errors vs
>> architecture specific ones vs etc.
>>
>> Thanks
>> Ross
> 
> I think some codes were already added and this is the only place where
> SLAUNCH_ERROR_GENERIC is used, not really sure why, will add a couple
> more.  By the way, the new errors were inserted in the middle making
> about half of the errors out of sync with Linux, should Xen and Linux be
> in sync?
> 
> Not sure about usefulness of error regions, the errors codes are only
> for TXT and major/minor errors in TXT.ERRORCODE weren't helpful in
> debugging.

Yea all I really meant was that the area in the error code < 0x400 is 
ours to chop up how we want.

Thanks
Ross

> 
> Regards
> 


