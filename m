Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RiYHNP/xMGqWZAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:49:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0298D68CA56
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:49:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oracle.com header.s=corp-2025-04-25 header.b=Qs1MUN9E;
	dkim=pass header.d=oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=l81Kt9YY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=oracle.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338685.1599723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNbx-0001v8-S9; Tue, 16 Jun 2026 06:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338685.1599723; Tue, 16 Jun 2026 06:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNbx-0001sg-P4; Tue, 16 Jun 2026 06:49:25 +0000
Received: by outflank-mailman (input) for mailman id 1338685;
 Tue, 16 Jun 2026 06:49:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wZNbw-0001rV-Iv
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 06:49:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZNbv-009tqQ-UW
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:49:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a30f1ec-5cb7-0a2a0a5109dd-0a2a4503ea6e-40
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:49:23 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a30f1f1-672d-0a2a45030019-cddca5206f24-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:49:23 +0200
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FJhX6f1349246; Tue, 16 Jun 2026 06:48:41 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1acbwhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2026 06:48:41 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 65G6mVDV022583; Tue, 16 Jun 2026 06:48:40 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012005.outbound.protection.outlook.com [52.101.53.5])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4erwnq4jsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2026 06:48:39 +0000 (GMT)
Received: from BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23)
 by SA2PR10MB4540.namprd10.prod.outlook.com (2603:10b6:806:110::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:47:42 +0000
Received: from BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83]) by BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 06:47:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=PBjsNmogYJDFNJNERnWkReC1Z4B0usGw7EMqGw7tZJk=; b=
	Qs1MUN9EaqRtiXC70wKCzT3gD/tP5tnvnmk0ewvG8s+Kz5valnKB2EQ0YEPbhH5e
	SQwp5PX2PLo1svr9oTiLroFpsTbY9Qfi0jK3G7D6Ha4TEJyNCtNtP/eo5pOr2hD3
	4DWgpryLqtVMSHWHRnyiAqAWAnMxUrfDzfI3ZoJykmKc7FtXXiA2nlTnzQcAkvGB
	DuTSyOQcnXdhs3ucfR/HLeWsqyvMrATH9MQSR7rMtzKKSuCMOYVZcMqNdVn4BXfA
	zofWH71bWRaaeZhNQ2gE/54o5JZuGPA1w0MSiWrXGGyKmAlXMJv8haNf39xZUNLV
	G1hawdYW9qgajsjgeOSyVA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cd2ICzqx2/Y9HQdnST7U5KOo34EHX5qqTpFrejphSETyAS2LlfHl1iUsTfARKw/eqi9/7uOIetSjtMsrR4tDFOV19u93s7AIzXr6SHc6gd0moyHxTxvepx2QgK8gvKqAajS7IZGGzIvAO9C9vOuYqthfpzYuAeXILH0lqZ6NcD6CsOAdIpDCCgxHY4e/jnKoB08rUdkm6AT/f209DRv9FM658DngXIduy5qX6ERLaA8kcCjnNV51pvQ2gysYBhynnErwj/+Sa7uocQDDHIjqobxJRqpHjwyGFTA9jwOEsavqMK0J5/G/tBAVA5iR3uOQjKhcVZAcSpE5RuUAOgzMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBjsNmogYJDFNJNERnWkReC1Z4B0usGw7EMqGw7tZJk=;
 b=ib48SsWPM9r+UonPCZcCNvaqXuqS1BJ8oprkyDSeH0XWxwx42uxBy68OHFDNKma/Oe0o8a9hvJNeI0E4i4YLgtsst854qbsyIiVBGsOhbSjswj3SOyBoemhHWTeHYAL5bh/Qyc9o3J2PEuSSPdFpBO4W6gIpk8zW1l+ALTSWwbJgycj8p+4ZZOsaR1p/yENb53w9tQv0YP00PoBslnRv67g/JR8i7ZQECy4/ajygbNtbrS84OXiety1W3QTaf0PxprSrkJpXnUtjRgf4BZvSeEt9waOBlBoDo3/c+h9SeTJn8cKZyhu6Im8Lo3gRxQOKytc1elhlIgXS2Cy2I/iQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBjsNmogYJDFNJNERnWkReC1Z4B0usGw7EMqGw7tZJk=;
 b=l81Kt9YYbQjfxP/WeZpjIhWUhOW3H7Y9KmgFrK6/+41LeaurzK0bL/QKd/pqAH//0jI5Xn3QJpWsV1Ub8AFl1B9ScyADjYmiyL+MnY6BiV7QiW/9pm0E7k1WFnR0i/+IxHqDPAXpBOwP04kNtGniwZ1IHVtM9h6yPy4rlsLOSQY=
Message-ID: <77f541f7-b346-4c86-8e66-3d2439e29cbb@oracle.com>
Date: Mon, 15 Jun 2026 23:47:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/34] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
References: <20260608145455.89187-1-dwmw2@infradead.org>
 <20260608145455.89187-5-dwmw2@infradead.org>
Content-Language: en-US
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Paul Durrant <paul@xen.org>, Jonathan Cameron <jic23@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        Jack Allister <jalliste@amazon.com>, joe.jin@oracle.com,
        Joey Gouly <joey.gouly@arm.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
In-Reply-To: <20260608145455.89187-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To BN0PR10MB5109.namprd10.prod.outlook.com
 (2603:10b6:408:124::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5109:EE_|SA2PR10MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: a858dcc5-5782-4abb-2a0d-08decb732a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|22082099003|18002099003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DYIClzSVTp3sAqy5/1XAbk0wUHMK54c/0EXWxKHFwUV/V5279UuwQPuNu5+fFDg4HbB9bjaWQ9K89NDWm6Vx+Za6ZwsUsW8NPZpfB6OvnllL7baelArT9LtpjSol55qA2WaxWKOWwpmv5MVd3Dk7JKXMPhKCCyI0vYX8I2NiNAOrr//T67vkzJ0v5XXdcl7Lggg7u5Xw8Hm1yzE48VLjOFPVroHee159Lt/5RHO7VLXQPnmp30wIoNyvqEeiJRwGJ8/mesZd02W+MKXz8/aL0Ht/xLQ55mrp19aYQuzSW9EQCJ2pcJ8n/z7whWoV1TkrDBZJOoQT9w8M0cM+qhbpPC205G8YBymK9HYiKK89rXLTTzd+7y9yD4FMET82zjIuCfz/mHaNnAAUlfZHSZ4f0BT35TIeRFBZRWTvJi6qQqG0F3oI3VjyKq9lVqaL1/YXBrwt2TbW4kfPY/Y2mzsnt61tJn+p/TjFdyYOOBeo+ZxT48XhA72q2AeOVEN0lg0mAXuAS/A4y333VX/Feb825RHrszq1HF0HvSoPBRlf20osac+/lwxAGjBtqfFHi07XZOEIEOB9M8BK8tjdlE10jH6dbwEuKxPJPFtVvaW4nhOWSOqChOm+rTCWt1LHeY34975/4X3FNrvanhn7M1pflb/hUDAC2q457ZnqA6p8mDhIFo70yK8mTAwH6J3TYg/TYMOUOqrmAJNtRNIUYzAS0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5109.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVJMVytxcGhzYnBIdTlFVDlZWnZDcG14bnZDb1g1bXRBUVM4Z3RSenZ2VzB0?=
 =?utf-8?B?amNoaFM5TzN0UkhuL2swL1MwZFp1LzViajlRSVY4R1JiTm94dUR4czNoTUwv?=
 =?utf-8?B?NWJlRXQrRmpKVTBBRWMwVCtDMVVKeVJ0T0RwbWhGRnhCUVBNZHU0U254aE1K?=
 =?utf-8?B?MTkzZDFXOEViaVdFTFMyV2h0OWdWSFc0d05HYUxDZFV4aGxDdXJ4YWNLbnFs?=
 =?utf-8?B?b01UakhZL1c5Z0VwUGNJR2QrUXVsUFQ2UlpDZ0w4WitlVnNlbG15dVA0alIv?=
 =?utf-8?B?UDB3L3hrS0lpd3VoTEc3dTlJWjZPSVg1TmpEd1RPRzdFUG9TeitTYzY0SUIr?=
 =?utf-8?B?QmhYTTB6Qno0dEhnWUR5VHlPbTRNQkVUUUVRcVlxblpaWUxPM2VrRlpKUVlC?=
 =?utf-8?B?cEw2MGg4SElIRDVpZ2NDbXFIL09TemFNMXhOdjZicW5YSjQzK3N2dlY5Q2JL?=
 =?utf-8?B?S3ZMTm80NDl6ZjZwV21xSit6d1MxUWQ0TW93Y2pHUnBCNDRUckJDSlo2OUEv?=
 =?utf-8?B?UTFha0JBbk9IS1FZNEVxNE91TEJQNzBTUDRMMTNqc3VMWHhmN3JVVmJNdjhu?=
 =?utf-8?B?R0wveU1kRFBveW9WV1Npc211aFJmSkR0OTJlZnJHR3g5NkRrbGV2L25SU3pE?=
 =?utf-8?B?bkRjY1ErWkwwRE0zTGttWlNUUFFWNG51UXVNSFF3eUNoS29nVjhQYUlYMTdR?=
 =?utf-8?B?R1pySG9kc242SllxeUpoU1NuQTdZeEdsY1FOV1dxbEhTNWpvSGpLdUdseEp4?=
 =?utf-8?B?dGVNQnJ4MWVBMlVZUTM3bXplK0xMaVl6RisyekQ5YUdyRktTUXcxWGN1QzJE?=
 =?utf-8?B?WTRhbVdVTzB2UjRmOWZtcHBLUFA3bGkydEFCdHc5WUIxQjJ5T2FRYlcyRExP?=
 =?utf-8?B?Y253WVlPQnRYbUdkQTVaUk82eStUUzd4TWdwQnV1OWtOUHBSeFNkeVNUM01D?=
 =?utf-8?B?c1d6ZjhtNXMxaEx1R0VnRStXR2hZR3dxUTVjbGxGbGwyVnJUNmNlRWVIWk5Q?=
 =?utf-8?B?UWhpbGJFNHZURDI4K1E4b1Q0KzhMQlptWGNadjZZNzVzbHdaVGo2N1JuQmpM?=
 =?utf-8?B?SHppRHZicUVocm1vMkg3VDRtbDFJQjI0WThWUTlGTDlDTUFsa3g1UnlZdmk0?=
 =?utf-8?B?OGluTmo2RmhjYmROL2V3eEQ0cEZyd1pyZFBYa2wzSndCQmplbUtWTmRmQjgv?=
 =?utf-8?B?RWJKSXNPK2FVdjVpdk1zVGh6RWExOFdjbk1sUWxwdGw2a0t6VVQwaXFad05S?=
 =?utf-8?B?MGhxTjArODgvVXE3MzFBWlVGclNsRS9ZMFh1K1pKQ0NFYVA4MVNVSkpUTmpJ?=
 =?utf-8?B?c1Fpejk0VVRtTG1XYXh3N3RRNWJqMDlHVmxzRkR5d1ZLRVV6alNYWnNCTWdK?=
 =?utf-8?B?VFFLUW96SEJESFora3VLZG40V0lKRHR2QjA5YTRzaUdpRDhNN3dhVVNWWHpa?=
 =?utf-8?B?RmxIaWFCeitBR2hvWXpESThISlBCODJkT09JKzVwUUJCSEp1eUt5dmM3U3B0?=
 =?utf-8?B?M0xPMllvQkNZejdlRWU3NnZLeG1hMXc1SVFiaUd4azYrdXpRMGhHa2JLaDVw?=
 =?utf-8?B?MmF2QW9DOStOWUg5Z3N4T3dTdEUvRHpQcUJCM3p6S1pUTHMweDhEVEJPZHdD?=
 =?utf-8?B?em95MUZLdnVVTnphN05pU3o4VHBxQW82TFlteUlWclcxUnJWRVo2aC80YXM5?=
 =?utf-8?B?bmxCMkN6akREN3ZCZnFvVkFDekE4NXpYNndaQ1dNQjNCNGtjVEZlMEF5a2hP?=
 =?utf-8?B?UUhPZmNMVjJmRXVKMTk0NFU0NXJXTjVRQWN6Vk5WalhaU3ZyUDFFNy9XclBj?=
 =?utf-8?B?M3VqT2ZOZitKTGtOSVBRQ2wvbG82R3BSbzRPNXdDYkxzRFpGMjhQL1hITDg1?=
 =?utf-8?B?OTVzQmVYN01lK3BDdHFRSHB2dTZYRlBHVEc3eVl5NXVMKzlnZXZreTVrMS80?=
 =?utf-8?B?M3FMN3lZcWxpK0hQSm1jZExoZ1RXSHJ2L0wwQ3lUSGtJTkI0Qi9YbVJsUDJx?=
 =?utf-8?B?dXRNL0N0eWh5UmdTV3NVd3I3U2hrWk9DK1BYQ3htMVgxYTB6Q3pnaFQrL2l6?=
 =?utf-8?B?ZjVqVzAxY2NQL1IyaGR0YUlzelh2TFFsVGRXcXZ3ZG82bXhGckFpSkl3eWtI?=
 =?utf-8?B?TDR3bWUzZnZQTFM4cENZV2ozUlJBcFBISG9saml5d0dGSmdwNGd4dC9oWWhP?=
 =?utf-8?B?cndNbEczbTc1ZDJjZVlyZkVEbm91WmxEY3gxeE9MQkI4ak5kNndUeXllWTlY?=
 =?utf-8?B?UndWTzJ1ZUVqS2xmUVllUkl4YVdsWmhPUm1ITEozS2hxMGtCT1FyUldjTWlV?=
 =?utf-8?B?KzlHRmhiTTZaSWw4bVhrNGRUbDZFaVFTOElXb2tyQ0JLTTR5VmNVZz09?=
X-Exchange-RoutingPolicyChecked:
	ZR++TwQ1b0x4OJVFCxhyfHjAXJFpcWXUa4mbshdU/bKpJztpvljSJKd4X+XOXaDWV6MO+HG5BightjgLKXIPw2HFCvAHnJcCng3QLsWMeEHtlVyR62cWBfcKWEgKMSJgYQtDHHe2tZkkAAI64xr4u6UR326dgVBh9GBMdOPEEtgk3/Uf+vDK5Cxrusm6d7f4V2IVq1s/ToaD8w3kt7P8Bq1RrrTxYu8HNhA9kuGDBqzJJ/ZgQdsE3LC0T/zCNdzzudRE+ImIxof/5n56D5b5kg7M9/nfHsN+vYUApqNjNoa7esM9yuki2oXpQFSrqtLwkGFIjov3l3Ar3TDQDZ7WcQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KiMFHKzRvpPoJLFvnwreo0giIm65TSoouCdkmtMd1QdF7Oz1F91uCse+Mb4UR/b1/C46/Ku5Mr9ne/a3l5tWJ/wpni5wMEL8itZWdlCkFcUmJZri00AHeLYe+c9dIUVx+0znpjQ6jPWlKMr3C8kY5dNN0nw5d99dqAg3k5k+cYYEMXPPytAlGLVfmpRkBcyAuWHSu3+zCpSM5/9OFZ48Xr2sF/4hxJ1OEllT0xHE3eSZADN0PQaPwEBoyPdQdX+BZDUxbgfP+QrEj0W9x94Gdns0995k/jBDTUVQrOY+H3gby9FuOQwJJbrhoELkVM48RMndDaLiFUkjmer+05dK0zws7JlAwTDiZIDjU9VgpepzZ9p12a/g8316ydk/1p4qU0lOe42Hc0PFcmIViu1hJyTOIQhKp72CKIV0legLI4MTGNClcHz9j1CxWcublZoLIdh0vmWm/1dbpxQdD8JoHpIsafvKd1bYjZPqEL44DscCKDLe9SN6/WhEpBb/55rVcrdljNQbEHK9cbWB1GhUG+TOzQ3JF4bqaYPsxAR8d6QqXAAwXZusBlI4upMyIily4mM20PEDIuPuD71GNmfVMyqiXgo8bNFj+xXiZEuFWJ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a858dcc5-5782-4abb-2a0d-08decb732a45
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5109.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:47:42.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiBEOcrn5MEnPqf38+sPcEJfX+ET2OzK2d1RsaOWVm4ed3e9dsdpSivGbtQF7eaZ5L0PTPnGbU7hwVccs/0OwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4540
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606040000 definitions=main-2606160066
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA2NSBTYWx0ZWRfX3XnmVOlkedqm
 d6Q8+SMsIFt+vl8Qaxv8Li3GvU5zvVtTEg7iUuTTXRKuvLc3EKnCpazet11EFE21z1GBIshFNYL
 FizqCjvlK2KeLOtZN/GXEFo5U05y8PKjoM4uf5zwdzNlOFrBrjokECZcnTw7YDYscr1vTERNun7
 MJsAJWeg6qb4vRdwMrLd1RjMLbpw5dtUD9TvTHtLqRiATOG+4oa3bax/nTrxszh0Fd0pHIb7Jdh
 dhH9OJJLwCm+I46vEy7RU3l8RU2C1yeYUVYv+PNHDkPbyLern5X62AkGaBP3PTWYcFSyGgHZo1b
 YLaOi1nqC5oldmUYOz7O7cgMDOe8VEg4IUM8yGXWgQ/qT9IPMbNmbXicZUQJaJsKwrOpdrc3iQL
 l7cThqXQolHLr0yhIqHZxV22Fa1g51VHvALpt4O/T6boc7FaopTyma/SfIIAphJYiyXXUOYOfEd
 p+ai7Cra3v9aOFTLWEJDcF0wkF+mmt1lNnN9WAQE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA2NSBTYWx0ZWRfX0i3umPsQnfqW
 1m2U4O1Ywbdp9p131gJls0xg9o5cfUbGW56J2RmTTXtPykeedMEyfXatRD/pybype/JW6B+Hx5u
 iJLh4GafO1FQMspXH+KmnHiVBYbq4S7nRbOoVP/8g/eYNn7yZW7P
X-Proofpoint-ORIG-GUID: FeX2pajFOXgT-37ZOnZ8gQrdR972yi-M
X-Proofpoint-GUID: FeX2pajFOXgT-37ZOnZ8gQrdR972yi-M
X-Authority-Analysis: v=2.4 cv=IqQutr/g c=1 sm=1 tr=0 ts=6a30f1c9 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=vggBfdFIAAAA:8 a=pBOR-ozoAAAA:8 a=mLnsDVdbAAAA:8
 a=RXWFDia8kwHKEAyOmR0A:9 a=QEXdDO2ut3YA:10 a=xnp1pY6zelCj5OLna2To:22
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12313
X-purgate-ID: tlsNG-33051d/1781592563-36D43938-EEA511F5/0/0
X-purgate-type: clean
X-purgate-size: 12766
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-9.19 / 15.00];
	WHITELIST_DMARC(-7.00)[oracle.com:D:+];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:x86@kernel.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:maz@kernel.org,m:Sascha.Bischoff@arm.com,m:jalliste@amazon.com,m:joe.jin@oracle.com,m:joey.gouly@arm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amazon.co.uk:email,xen.org:email,oracle.com:dkim,oracle.com:email,oracle.com:mid,oracle.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0298D68CA56

I tested patches 02, 03, 04, and 26 by customizing QEMU to support kexec live
updates (LUO and KHO), preserving the memfd across kexec.

For my use case, I used KVM_[GS]ET_CLOCK_GUEST instead of the existing
KVM_[GS]ET_CLOCK. I didn't account the downtime in my QEMU code, although host
TSC never resets across kexec.

Clock drift was zero, and I did not observe any unnecessary master clock updates
after KVM_SET_CLOCK_GUEST completed.


Another interesting observation from my experiments is that tsc_khz changes
across kexec. Since the TSC value itself does not reset across kexec, I'm
wondering whether there is any reason to switch to the new tsc_khz value after
the kexec.

I previously sent a QEMU patch that takes advantage of your KVM commit
ffbb61d09fc5 ("KVM: x86: Accept KVM_[GS]ET_TSC_KHZ as a VM ioctl.").

[PATCH 1/1] target/i386/kvm: set VM ioctl KVM_SET_TSC_KHZ to maintain TSC
synchronization
https://lore.kernel.org/qemu-devel/20260210202041.153736-1-dongli.zhang@oracle.com


While live migration involves two different machines, kexec is performed on the
same machine. Given that the TSC value itself is preserved across kexec, would
it make sense to reuse the pre-kexec tsc_khz value instead of using the new
tsc_khz after kexec?

I tested this by using LUO to preserve tsc_khz across kexec, and the results
looked good.

Thank you very much!

Dongli Zhang

On 2026-06-08 7:47 AM, David Woodhouse wrote:
> From: Jack Allister <jalliste@amazon.com>
> 
> In the common case (where kvm->arch.use_master_clock is true), the KVM
> clock is defined as a simple arithmetic function of the guest TSC, based
> on a reference point stored in kvm->arch.master_kernel_ns and
> kvm->arch.master_cycle_now.
> 
> The existing KVM_[GS]ET_CLOCK functionality does not allow for this
> relationship to be precisely saved and restored by userspace. All it can
> currently do is set the KVM clock at a given UTC reference time, which
> is necessarily imprecise.
> 
> So on live update, the guest TSC can remain cycle accurate at precisely
> the same offset from the host TSC, but there is no way for userspace to
> restore the KVM clock accurately.
> 
> Even on live migration to a new host, where the accuracy of the guest
> time-keeping is fundamentally limited by the accuracy of wallclock
> synchronization between the source and destination hosts, the clock jump
> experienced by the guest's TSC and its KVM clock should at least be
> *consistent*. Even when the guest TSC suffers a discontinuity, its KVM
> clock should still remain the *same* arithmetic function of the guest
> TSC, and not suffer an *additional* discontinuity.
> 
> To allow for accurate migration of the KVM clock, add per-vCPU ioctls
> which save and restore the actual PV clock info in
> pvclock_vcpu_time_info.
> 
> The restoration in KVM_SET_CLOCK_GUEST works by creating a new reference
> point in time just as kvm_update_masterclock() does, and calculating the
> corresponding guest TSC value. This guest TSC value is then passed
> through the user-provided pvclock structure to generate the *intended*
> KVM clock value at that point in time, and through the *actual* KVM
> clock calculation. Then kvm->arch.kvmclock_offset is adjusted to
> eliminate the difference.
> 
> Where kvm->arch.use_master_clock is false (because the host TSC is
> unreliable, or the guest TSCs are configured strangely), the KVM clock
> is *not* defined as a function of the guest TSC so KVM_GET_CLOCK_GUEST
> returns an error. In this case, as documented, userspace shall use the
> legacy KVM_GET_CLOCK ioctl. The loss of precision is acceptable in this
> case since the clocks are imprecise in this mode anyway.
> 
> On *restoration*, if kvm->arch.use_master_clock is false, an error is
> returned for similar reasons and userspace shall fall back to using
> KVM_SET_CLOCK. This does mean that, as documented, userspace needs to
> use *both* KVM_GET_CLOCK_GUEST and KVM_GET_CLOCK and send both results
> with the migration data (unless the intent is to refuse to resume on a
> host with bad TSC).
> 
> Co-developed-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Jack Allister <jalliste@amazon.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Cc: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  Documentation/virt/kvm/api.rst |  37 ++++++++
>  arch/x86/kvm/x86.c             | 164 +++++++++++++++++++++++++++++++++
>  include/uapi/linux/kvm.h       |   3 +
>  3 files changed, 204 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 52bbbb553ce1..2268b4442df6 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6553,6 +6553,43 @@ KVM_S390_KEYOP_SSKE
>    Sets the storage key for the guest address ``guest_addr`` to the key
>    specified in ``key``, returning the previous value in ``key``.
>  
> +4.145 KVM_GET_CLOCK_GUEST
> +----------------------------
> +
> +:Capability: none
> +:Architectures: x86_64
> +:Type: vcpu ioctl
> +:Parameters: struct pvclock_vcpu_time_info (out)
> +:Returns: 0 on success, <0 on error
> +
> +Retrieves the current time information structure used for KVM/PV clocks,
> +in precisely the form advertised to the guest vCPU, which gives parameters
> +for a direct conversion from a guest TSC value to nanoseconds.
> +
> +When the KVM clock is not in "master clock" mode, for example because the
> +host TSC is unreliable or the guest TSCs are oddly configured, the KVM clock
> +is actually defined by the host CLOCK_MONOTONIC_RAW instead of the guest TSC.
> +In this case, the KVM_GET_CLOCK_GUEST ioctl returns -EINVAL.
> +
> +4.146 KVM_SET_CLOCK_GUEST
> +----------------------------
> +
> +:Capability: none
> +:Architectures: x86_64
> +:Type: vcpu ioctl
> +:Parameters: struct pvclock_vcpu_time_info (in)
> +:Returns: 0 on success, <0 on error
> +
> +Sets the KVM clock (for the whole VM) in terms of the vCPU TSC, using the
> +pvclock structure as returned by KVM_GET_CLOCK_GUEST. This allows the precise
> +arithmetic relationship between guest TSC and KVM clock to be preserved by
> +userspace across migration.
> +
> +When the KVM clock is not in "master clock" mode, and the KVM clock is actually
> +defined by the host CLOCK_MONOTONIC_RAW, this ioctl returns -EINVAL. Userspace
> +may choose to set the clock using the less precise KVM_SET_CLOCK ioctl, or may
> +choose to fail, denying migration to a host whose TSC is misbehaving.
> +
>  .. _kvm_run:
>  
>  5. The kvm_run structure
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index d9ef165df6a1..b7e5f6e3dc6c 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -6205,6 +6205,162 @@ static int kvm_get_reg_list(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_X86_64
> +static int kvm_vcpu_ioctl_get_clock_guest(struct kvm_vcpu *v, void __user *argp)
> +{
> +	struct pvclock_vcpu_time_info hv_clock = {};
> +	struct kvm_vcpu_arch *vcpu = &v->arch;
> +	struct kvm_arch *ka = &v->kvm->arch;
> +	unsigned int seq;
> +
> +	/*
> +	 * If KVM_REQ_CLOCK_UPDATE is already pending, or if the pvclock
> +	 * has never been generated at all, call kvm_guest_time_update().
> +	 */
> +	if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, v) || !vcpu->hw_tsc_hz) {
> +		int idx = srcu_read_lock(&v->kvm->srcu);
> +		int ret = kvm_guest_time_update(v);
> +
> +		srcu_read_unlock(&v->kvm->srcu, idx);
> +		if (ret)
> +			return -EINVAL;
> +	}
> +
> +	/*
> +	 * Reconstruct the pvclock from the master clock state, matching
> +	 * exactly what kvm_guest_time_update() writes to the guest.
> +	 */
> +	do {
> +		seq = read_seqcount_begin(&ka->pvclock_sc);
> +
> +		if (!ka->use_master_clock)
> +			return -EINVAL;
> +
> +		hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, ka->master_cycle_now);
> +		hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
> +	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
> +
> +	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
> +	hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
> +	hv_clock.flags = PVCLOCK_TSC_STABLE_BIT;
> +
> +	if (copy_to_user(argp, &hv_clock, sizeof(hv_clock)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +/*
> + * Reverse the calculation in the hv_clock definition.
> + *
> + * time_ns = ( (cycles << shift) * mul ) >> 32;
> + * (although shift can be negative, so that's bad C)
> + *
> + * So for a single second,
> + * NSEC_PER_SEC = ( ( FREQ_HZ << shift) * mul ) >> 32
> + * NSEC_PER_SEC << 32 = ( FREQ_HZ << shift ) * mul
> + * ( NSEC_PER_SEC << 32 ) / mul = FREQ_HZ << shift
> + * ( NSEC_PER_SEC << 32 ) / mul ) >> shift = FREQ_HZ
> + */
> +static u64 hvclock_to_hz(u32 mul, s8 shift)
> +{
> +	u64 tm = NSEC_PER_SEC << 32;
> +
> +	/* Maximise precision. Shift right until the top bit is set */
> +	tm <<= 2;
> +	shift += 2;
> +
> +	/* While 'mul' is even, increase the shift *after* the division */
> +	while (!(mul & 1)) {
> +		shift++;
> +		mul >>= 1;
> +	}
> +
> +	tm /= mul;
> +
> +	if (shift > 0)
> +		return tm >> shift;
> +	else
> +		return tm << -shift;
> +}
> +
> +static int kvm_vcpu_ioctl_set_clock_guest(struct kvm_vcpu *v, void __user *argp)
> +{
> +	struct pvclock_vcpu_time_info user_hv_clock;
> +	struct kvm *kvm = v->kvm;
> +	struct kvm_arch *ka = &kvm->arch;
> +	u64 curr_tsc_hz, user_tsc_hz;
> +	u64 user_clk_ns;
> +	u64 guest_tsc;
> +	int rc = 0;
> +
> +	if (copy_from_user(&user_hv_clock, argp, sizeof(user_hv_clock)))
> +		return -EFAULT;
> +
> +	if (user_hv_clock.pad0 || user_hv_clock.pad[0] || user_hv_clock.pad[1])
> +		return -EINVAL;
> +
> +	if (!user_hv_clock.tsc_to_system_mul)
> +		return -EINVAL;
> +
> +	if (user_hv_clock.tsc_shift < -32 || user_hv_clock.tsc_shift > 32)
> +		return -EINVAL;
> +
> +	user_tsc_hz = hvclock_to_hz(user_hv_clock.tsc_to_system_mul,
> +				    user_hv_clock.tsc_shift);
> +
> +	kvm_hv_request_tsc_page_update(kvm);
> +
> +	/*
> +	 * kvm_start_pvclock_update() takes tsc_write_lock and opens
> +	 * the pvclock seqcount; kvm_end_pvclock_update() closes both.
> +	 * All clock state modifications between them are atomic with
> +	 * respect to readers in kvm_guest_time_update().
> +	 */
> +	kvm_start_pvclock_update(kvm);
> +	pvclock_update_vm_gtod_copy(kvm);
> +
> +	if (!ka->use_master_clock) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +
> +	curr_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
> +	if (unlikely(curr_tsc_hz == 0)) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (kvm_caps.has_tsc_control)
> +		curr_tsc_hz = kvm_scale_tsc(curr_tsc_hz,
> +					    v->arch.l1_tsc_scaling_ratio);
> +
> +	/*
> +	 * Allow for a discrepancy of 1 kHz either way between the TSC
> +	 * frequency used to generate the user's pvclock and the current
> +	 * host's measured frequency, since they may not precisely match.
> +	 */
> +	if (user_tsc_hz < curr_tsc_hz - 1000 ||
> +	    user_tsc_hz > curr_tsc_hz + 1000) {
> +		rc = -ERANGE;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Calculate the guest TSC at the new reference point, and the
> +	 * corresponding KVM clock value according to user_hv_clock.
> +	 * Adjust kvmclock_offset so both definitions agree.
> +	 */
> +	guest_tsc = kvm_read_l1_tsc(v, ka->master_cycle_now);
> +	user_clk_ns = __pvclock_read_cycles(&user_hv_clock, guest_tsc);
> +	ka->kvmclock_offset = user_clk_ns - ka->master_kernel_ns;
> +
> +out:
> +	kvm_end_pvclock_update(kvm);
> +	return rc;
> +}
> +#endif
> +
>  long kvm_arch_vcpu_ioctl(struct file *filp,
>  			 unsigned int ioctl, unsigned long arg)
>  {
> @@ -6605,6 +6761,14 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>  		srcu_read_unlock(&vcpu->kvm->srcu, idx);
>  		break;
>  	}
> +#ifdef CONFIG_X86_64
> +	case KVM_SET_CLOCK_GUEST:
> +		r = kvm_vcpu_ioctl_set_clock_guest(vcpu, argp);
> +		break;
> +	case KVM_GET_CLOCK_GUEST:
> +		r = kvm_vcpu_ioctl_get_clock_guest(vcpu, argp);
> +		break;
> +#endif
>  #ifdef CONFIG_KVM_HYPERV
>  	case KVM_GET_SUPPORTED_HV_CPUID:
>  		r = kvm_ioctl_get_supported_hv_cpuid(vcpu, argp);
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 6c8afa2047bf..9b50191b859c 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1669,4 +1669,7 @@ struct kvm_pre_fault_memory {
>  	__u64 padding[5];
>  };
>  
> +#define KVM_SET_CLOCK_GUEST	_IOW(KVMIO, 0xd6, struct pvclock_vcpu_time_info)
> +#define KVM_GET_CLOCK_GUEST	_IOR(KVMIO, 0xd7, struct pvclock_vcpu_time_info)
> +
>  #endif /* __LINUX_KVM_H */


