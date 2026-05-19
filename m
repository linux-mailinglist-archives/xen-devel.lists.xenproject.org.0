Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMqAB1fVDGqJnAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 23:25:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE35852E2
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 23:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313413.1583542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPRw3-0006Se-Di; Tue, 19 May 2026 21:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313413.1583542; Tue, 19 May 2026 21:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPRw3-0006QC-B3; Tue, 19 May 2026 21:25:07 +0000
Received: by outflank-mailman (input) for mailman id 1313413;
 Tue, 19 May 2026 21:25:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wPRw1-0006Q6-Rg
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 21:25:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPRw1-00Dy1K-13
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 23:25:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0cd48b-e002-0a2a0a5209dd-0a2a450c89de-48
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:25:04 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0cd52e-62f1-0a2a450c0019-cddca520ab38-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:25:03 +0200
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64JJbaOG545944; Tue, 19 May 2026 21:24:04 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e6h4q5ygs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 21:24:03 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 64JLEohl003722; Tue, 19 May 2026 21:24:02 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4e6f1gbwgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 21:24:02 +0000 (GMT)
Received: from BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23)
 by DS0PR10MB8055.namprd10.prod.outlook.com (2603:10b6:8:1fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 21:23:53 +0000
Received: from BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83]) by BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 21:23:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-oracle-onmicrosoft-com header.d=oracle.onmicrosoft.com header.i="@oracle.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eiYEirk7wfR11MHIEZKgaarRpwEjqyHqhoKP12QGp0U=; b=
	Y/2jerAaR+8GBP6Frmpb5+k/IRoWLf9iadf+niy3k3NfYkixuFw8ZltuwmY7lEp+
	1coRCYwCq06ea+Jg8Q0SkT1hm+6u9GE2alaJwk1S8Btl8Q3+eYbeLQdnvQdFT2WE
	/sZ+lFhvNf0Ts6UV7UHfXtOIBhaoWZnBgPpBPvfQDj+Lv8ZbMe2LYkIdQbWbvJzs
	yJ0zdryCwChycHb45C8/65zEHVraLlg9VL4O+3n3xn/ndGSU2tPcGiQ765F7j+Su
	wpOu/VuHUDZ0CrMJXL2PX2OPh9LMIo/O9ZFdB5+J3o+otAVq/kRmQusqQHg7qQl0
	ypzUkkuNnrEWhodWo4yJjw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaUD2BTzJKZnmX83l+dBk2SRnA8wGT7IQU2wbLaQMCZNFksBQo7qn9vXt3RVyq5XwvnJLM2d/QahG+QW9Q6HZJIn/wn3IG8PGmDLx4Ni/0n1OooxwS66M/6nXtvggn3D0YEW0oJkBMN4PnS3eYdNfmVnPd/2InFavrNcPaEs1KltVZ48CiKRRTWrLBAYIyfo4Ezc/6QH7h3WF3tUnxPYdKSOfAhbo2qw8PA0QHa+VxtJOiVHe3ASipiKjEWmhMb5P66+1s95TqvrasPJbJP9TNG5Nf2PEfehmYkkxESJt5plBJlpSvRcWoR3Pf2I5M8+jg/cfVHBvJ0Enna14SGA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiYEirk7wfR11MHIEZKgaarRpwEjqyHqhoKP12QGp0U=;
 b=nTdKb4Iil5b4BMk/zbwr/HuWN+MBZ4it2morRKZh8qr8oxAGvStBvh82zQLGdKZsZwONWA2ymAll0JDgZGhOwHNijuEZEjZ/nS3L6mbEN42p6zU2xO6PNAM9i9HA+W0c0n5X9aLb5r9zILpx+hIuk8Wpzn+Hy77lrD7u87jVvVLD/mBH3XrV4H5vGVPtK0kRc7y7s3kNB8Yy5udBOL0SPOIxohDOi1noUqCkrxTMfHp1cnmmOOyWiLdGIcYt62qZoRt4B9ppFZ4Ka6ZkWFfz0Z0GdaPlw9GxOPCwcLNZQDl8sVYhZFfJB7rneKodv0eguFZ7C71s66eN8DtpLKiOHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiYEirk7wfR11MHIEZKgaarRpwEjqyHqhoKP12QGp0U=;
 b=VkeEUgWB7hWWb94pglLDthi0GZEvanfNphFKC9wNx6mP2tRmer9lb0OBNrMOgwIxZk57sGXAEcjMxDYlAbY90xc8kiHuye51uXP5UOiVHArHhwmkU4Bp/rQeaeYIb9MTtpcKs3jWoHQQ+g5gsKLA7O7esnLqA+MBwF/gdXm4yTA=
Message-ID: <aa68ed10-15da-4368-a986-6864843a3c44@oracle.com>
Date: Tue, 19 May 2026 14:23:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/30] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>, x86@kernel.org,
        Marc Zyngier <maz@kernel.org>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Paul Durrant <paul@xen.org>, Jonathan Cameron <jic23@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        Jack Allister <jalliste@amazon.com>, Joey Gouly <joey.gouly@arm.com>,
        joe.jin@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-kselftest@vger.kernel.org
References: <20260509224824.3264567-1-dwmw2@infradead.org>
 <20260509224824.3264567-5-dwmw2@infradead.org>
 <0ae8e471-db7a-4842-aca4-8ef643acde8b@oracle.com>
 <d3c461415e05345a9b82e6f995828c1ae64a4e61.camel@infradead.org>
 <935312be-9a86-49fd-8bb4-2c998a68e2df@oracle.com>
 <b9980333f3a310bf05e170e79c40cb2f46485caf.camel@infradead.org>
Content-Language: en-US
From: Dongli Zhang <dongli.zhang@oracle.com>
In-Reply-To: <b9980333f3a310bf05e170e79c40cb2f46485caf.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To BN0PR10MB5109.namprd10.prod.outlook.com
 (2603:10b6:408:124::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5109:EE_|DS0PR10MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: e659e28e-9ec1-415b-a718-08deb5eced1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|4143699003|5023799004|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RMsJwk4Kzx5mnD6TpjBg0BFs2p6K0Wns3WVnEagB4Mba0k6sIvTyph0BG5o1UjPdyb2vWTBe1IA2bzr550lpZacHXHVUary9QhUvF/nh+K9Px5LfUtqAxknW8AzjTCxJ5Z8SsfDVPRhodO4cT8LUwDTP21mL35TO2Cu5fddpceG4t2GVT6R9lLwvc7HmpRatZWhZhDsbDhhhM3wB6XnF7NDfuERWchbkDZI7t9/nhFqjmblOlX93ZrYR7Q7GgFRFgj/xztd3J3ODaji4wr8fIFOC/Vi9iE0ejypA+oCFSGXrzeQMQsEwV9p1vJ5OwZoaCfKPsZmk3bkpEpkHl+Jr3zlV//ngf1B/RO1lw0xMC0UfxtqorXn9M1jtTGAnknvgNrIqvw42ytl5OjqjfxcYtuXwWCIaLEDDTfT23v+/kYzJaYvWyQqAskAcbiosm31g2EdQnMrhJ09OcC3PLV14uIHeuy0EubmULSVnd+97JMqYwJ2w7WmcjnTM8YD/H0ODnrQ21kA+CRGmaXpUVZpHTvJqLpoKiQXw0+LJwTQuhj1yg6W1KMyYfKKRXXi/uoOzIzAfiDdcEhbB+OJVfbxnBjfv+f0029WFB2ls7RaTx9TuUmUUOEJCICJJal/2wQGfLPxfutQz0Qroznnqa3Z8ACrKWdWih8DhDi0Wz3Mm9N3fQ4rV1m2BfMiZIXYGnvB91T7cSkzJeYFSXM8X01KS/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5109.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(4143699003)(5023799004)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L25hWU5zUElyRDQwbjNkVVF3amIvYm9pZHplUUhKU3k3UjB3YlFNM0tBTmpu?=
 =?utf-8?B?K2FQWlZQYTJaL3FlVlIrREVLK1lKNC9QdXg2dmRtL0xIZzBOeHdEYTR3Y09o?=
 =?utf-8?B?WFBNcVBPR0VxZU1naVJlNEFvLzFsRU9sbnRHU2VvVU9VUGZXSEpkYXFvSmpZ?=
 =?utf-8?B?QnJoa25sMmgrU2JQRFdKcDVJOWtXYTVUV09lNTlVZkd5bVlxQ0xnT3h0VENW?=
 =?utf-8?B?TWdrMEJvM2pMK3Q0QTFXUzJ1UE04dUN1WGxXSzkrdVhSY3NUSldXN21HZHlL?=
 =?utf-8?B?cmtZZkhkQzZQSmRpbkNOaEdqV1ZoeVorQ0M0bDNxZDVhMDRWM0xVZ3lVOHpH?=
 =?utf-8?B?VnFPZFJFQjV1b2VMQ3Nha2hiQk14TTNCamNQTzN6UTQxR2o2TFVyNXNUUit3?=
 =?utf-8?B?TUZzKzNRWUM5SlpFKzV2TTNEbUIwVlNEU3VwbVZPcHZ0TDFpZUVndEgxZjUx?=
 =?utf-8?B?aVVyclc2dHpnK1kxYUl4ek8zNHMzczFacnNyNVlPNEQ1UFI3aXROcXAwMFR3?=
 =?utf-8?B?Y0g0bk9DNTdZSXdWMzExV0xnY1FTTkVGSUpVdmR0YmpSdXRPdHlkMHVnVk9p?=
 =?utf-8?B?N0JwUWdiSGpjQlpRaUV3a3NtWDFiK0EzZ2RPZER6ZnpIQ1lXZ2hZWEs2U0N6?=
 =?utf-8?B?U3ljMVdGOWM0N3gxbXArQnFSMVRDSi91WjZ2WXh4WjlyOGJDamc5dk1rdTJt?=
 =?utf-8?B?RDhTdzNkd1FZZEJVdHVCYU56WWdhdXVlZGZjVHFzUDZTeUJ4dklHWWt4TUVu?=
 =?utf-8?B?WWdWTlhEY0lGVFhUeUNSNWZ3b2ZNUzNDYUpQZGZKcDMxR2NvRVJjT1AwQkV3?=
 =?utf-8?B?Um0vVXpCcVV1Q2tBRmQwdlFZR01LZno4b2FabkV2R1JTeFZNY0FMcEhSVzNB?=
 =?utf-8?B?V1ZFOURweGl0UENBRldBMC9TVUYxdEJPRVZHd1ozOU1VeUYvdXI2cVJZLzhX?=
 =?utf-8?B?aXBHYjZVNmVVZkMySVp3ZEowdmgzVlpvWGZzcFF1MGlUaHBvTWQzdmRtWHFE?=
 =?utf-8?B?TVJJV3ZTY0ZyQ09zNkNEUC9sUDE5a3BIQXdVZU9NNmxPNk5LM2twRThTancr?=
 =?utf-8?B?ZEhXeE5GZTQ4Y3g5NWxadnpCY3VGRWxzODZwc3d3MnZveGVGZ1JaVEpKY2Jj?=
 =?utf-8?B?WnduZ0VnTTFUZEJHV3VwNVFKZ0NaZkllbW0xQUR5UVhnOTd5OFhjeXhISERC?=
 =?utf-8?B?cWFIc2tlQXlGUUxBVnJGT0p5SGFjM3JCSnJFVzYzU3lwU1lQTEJ6eWxNZW9j?=
 =?utf-8?B?eDBUOHR6dlBaZkFsVnU0eGxpVXV6enBmTFRYZVZ6b3dCbHZUc3FyeGpFT2hJ?=
 =?utf-8?B?bC9qdWtDV0JQK05pYW1HWHZXZmZLbEIraitybllPbENEWXVYbHhLT05mNGFh?=
 =?utf-8?B?M2FEY0xkdjZWWm5Ha0prRWt2cTM5dDNka1J1M0N2SW1GbEhqTElmdDE1M2Ri?=
 =?utf-8?B?OWVsMlg1ZGpkLzRzTDZ2TFlQYWdCSHhNL2ZqYzFNNnZ4NjlXaUpLbGFlbHha?=
 =?utf-8?B?Q0QzNDlvWlBsTVRkeWVPdnErZDVLZTFZMEpkNzMzT01jK1hGc2dRVFMxWVkv?=
 =?utf-8?B?RDdGL085YmUvVlhZUlNRR3FtZWl3SlVlMlJWYzhoMkl3KzJERXlydFFyVEVy?=
 =?utf-8?B?RlpoT1ZVMGRMUkRMR1ZuTVVEK2FoZFM0ODA1RXgrc1M0Snc5SERnRzdaRTdq?=
 =?utf-8?B?RHllMExqTDEvQnNIL0FTcm1WOVpSUlRRMTdLWjZWYkN4UTFMNUhYaU5FQVBo?=
 =?utf-8?B?MkQwK0NqVU9yb1J2ZlZjclN6bVJyTFduS0J2QlRNN3dMTXhMOUNRM1pBNmtU?=
 =?utf-8?B?Z016cFJ0UDQ3SGpRSkJYdEhSNko5YXdnSitrbWdpSEF4SnpRcFAwZ0dBQXJX?=
 =?utf-8?B?cFl6ZUpBbGFwbnhST1lyU2FiV3dnYmRWVFA5NHZ0eThEMkVJRUdSaTUxbnFX?=
 =?utf-8?B?NmgwekJJMTduRDlSL2s5WFJIaHpaUEY2TnJLNml1Mlk1ZmhhYnBkRmU0L1ZR?=
 =?utf-8?B?NUs3RytsdmZ1Mk1kdDhyY0JBQVBjbTc5Q3hOSkc4amoyY2JOeXMybGVnaFox?=
 =?utf-8?B?VFp4R3pzVFFRMzg0ZkZtUXpGWHFxVXRWRHcvY0ZxUUdPbzMvSXdwcjYrcXBN?=
 =?utf-8?B?ZXZhbS9uU2w0ZkxBZXFvRWNxSHcxTnQ4MVFaQ2xSUDE2cURFMVBEbDhvVG82?=
 =?utf-8?B?Z0hreC96dzhsUG8ybjlpakx5UGpTVXBaU3lJd3JNdEhqSlpWMG5hTHhJYkZK?=
 =?utf-8?B?TmZZZUR2Q2poU2JmWHE0SVVJTmtFYmw5N0dUeDNDazlYRWRNT01pdm1oa29D?=
 =?utf-8?B?ODNVQlJ5VEUvTEdGN2NidHJVNzJwMjVDcjFseTNjUXhIcHBrWTRBQT09?=
X-Exchange-RoutingPolicyChecked:
	XZcEg/JyLi5Eomow/J8pR/4uqf3peiaV8sjNvYLMN1FM1jLrPU1Bt7y/Li9HfsrUj+P0b2zXC2QNgHGMe4ZNLFoDOVGmdtzx4h+Y82HDTq66cfbFtr47xviipH+aibaswt1aUyCFyD21qSDQe42iWSiX9C5Z08NQRFigC68Xdl3nKlHAw8UUiWes3VEEJECcdgb//7b9xH3SHIzB/AJu3dlxvGn74Fco1f0A9iRR0nJZmtAmJ4anq1znxCjeSsUp/w1FdEVoouYCJQ7hTADc9hGkg4kfXyUW5WyC+bOQF/wOox6D4o12zBAwX+zmugbR5rlPXryTIf3P54o8q8cQ7Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vuzTNcg+i3Unr1PjBh+NMspi70fZyj4t2Fizh/PFEs7cFEA+xqYbJG7xwN2mBBv0mZGAqtBBLG0uEcnVoIVOD2QwMuFeInqG/iQDCR/wnBRf8ryW41gRkWmm7EJr7UfGrurXIE3ymYNKh6WBbgSAzgALOYAhGow7uXxPYdiOSV7HsIbC2+KTEpEkR9J9LhzHdbCrAVPr/2ciNdqkM3HidfbfFIOzxbrdxM20/6FnTwUBMiPbpF/wZEOvC998g3yY7YPwzG6sxV13HAF3NE6Yy+KBKxolsPddSRhyjFlZaIV7+W/dbSL9Eoh0BVi/2KcCPFzV2/MJWPAcyat9VBZKyNwPF/IHk5K5M/hK0qlnZlFZDF1rVsKwBYggDlKlkQfoi590K06ba9sdu7OXRZyf8YYp1KsDcaqSWmHLaazrA4QBFjryAo6Ec5qRwtbGZkggcqVHm4PV85glDcSDOBsPiVV77NiRliMgBc5F+C9QW9Eq5fBzCvTGH2H11JqJcPcBmg58dqghj9WyvGUOuYWnySBmvlVL6+N9tEp/NpIJEG1ooe3FMcCehrbPW1TdPRdeTvJE2sSeCbJNWzqyosR0KYu+4ks4N7a5ticbCZWhC4I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e659e28e-9ec1-415b-a718-08deb5eced1f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5109.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 21:23:53.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/k4FyLuswKoZWmSaFej3cVo287Prc8MgAoj/8DQUJw7fdhfME0GulWrelKcSXUIW7V9dgeoBavx55DBJ4wSiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605190212
X-Authority-Analysis: v=2.4 cv=NdnWEWD4 c=1 sm=1 tr=0 ts=6a0cd4f4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=WQdL3in-H15QQPj3npUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12299
X-Proofpoint-GUID: xqRm56LB7JR1qKQpcvfXEuPz_bYa1o5h
X-Proofpoint-ORIG-GUID: xqRm56LB7JR1qKQpcvfXEuPz_bYa1o5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIxNCBTYWx0ZWRfX4kvqtleNLvz5
 yloq7SS3LI9jjyohXeMf+72VfBooCt7XjHhZSh5XNdZashdIyh0IJNqBJEIO6IPg0F8D4t9v5R2
 KcFVAH5jTcxiPFVg9mYNrEl/go0l9NnjZDHo//zXZPXu34ZbFEXIvP9M9StwpwmcXQVwIgK9voR
 krkLVxhhv/ay1pJbu+BnmY21kWStqi4LwAw7JUoA9ODW2/TatTit1hvRQ5Tbu9sSnpm7aDw14KT
 PWyAVoAuTPWzLA1m0WwyUzHn/fgnlKVvq89f9HCszOdxdE/m5svDQOZES0I3V9WI/YWP2Wzeb2m
 WMiDO8Vg7uN9uqplMNFX030/QZurLzftCwvPR4CNlIx0Rq4VjyUfdRx4wJUbnXSvIVco8yfezdp
 B3ZAEhnWfCokp9dMIdUP+u3zIgjwuD+4mXdMsuxhRJdWEvJUJqCtOZZtwkPSKGksd8tRx/d+/4W
 fict9eFY91EEdoCq/ABzJcXtlyvwwi/Ubgn1fnM8=
X-purgate-ID: tlsNG-d25034/1779225904-E3B7CCF5-80412A9E/0/0
X-purgate-type: clean
X-purgate-size: 9204
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:seanjc@google.com,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:dave.hansen@linux.intel.com,m:vkuznets@redhat.com,m:x86@kernel.org,m:maz@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:jalliste@amazon.com,m:joey.gouly@arm.com,m:joe.jin@oracle.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 41BE35852E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026-05-19 12:50 AM, David Woodhouse wrote:
> On Mon, 2026-05-18 at 17:57 -0700, Dongli Zhang wrote:
>> On 2026-05-18 1:48 AM, David Woodhouse wrote:
>>> ...
>>
>> I have fixed the Thunderbird configuration. Does it look better to you?
> 
> The date is certainly better, thank you. But although I *was* up late
> that night frowning at clocks, I didn't think I was up *quite* as late
> (almost 2am) as it suggests.
> 
> But I suspect that getting *that* right is beyond the limit of
> Thunderbird's configurability.
> 
> Thanks :)

Let me continue exploring how to add a timezone, such as "17:57 -0700".

> 
>> I really appreciate guidelines like the ones below.
>>
>> https://lore.kernel.org/all/20240522001817.619072-8-dwmw2@infradead.org
>>
>> Assuming I am a user of the new API, I feel confused about whether the goal is
>> to replace KVM_SET_CLOCK with KVM_SET_CLOCK_GUEST, or whether the latter is
>> meant to supplement the former.
> 
> The issue is that KVM_SET_CLOCK_GUEST can only be used in 'masterclock'
> mode, when the TSC is reliable and the guest TSCs are all in sync.
> 
> Which ought to be *all* of the time, on modern hardware and sane
> configurations. And in this series, I don't even let the *guest* screw
> that over by setting different TSC offsets on different vCPUs any more
> (we stay in masterclock mode in that case now). But the VMM can cause
> its guest to come out of masterclock mode, by setting different TSC
> *speeds* on different vCPUs.
> 
> So there remain some pathological cases where the kvmclock actually
> still has a justification to exist, and those are the cases where it
> needs to be set in its own right as a function of host time
> (KVM_SET_CLOCK), not purely as a function of the guest TSC
> (KVM_SET_CLOCK_GUEST).

I think I now understand why I feel like I am always asking weird questions. I
have been thinking about how to account for downtime, so I see
KVM_SET_CLOCK_GUEST as a supplement to KVM_SET_CLOCK.

Suppose we are not going to account for any downtime. With KVM_SET_CLOCK_GUEST:

1. The masterclock is active, so gTSC is synchronized across vCPUs. All vCPUs
share the same kvm_read_l1_tsc(v, ka->master_cycle_now).

2. Migrate the gTSC to the target VM however people want (either ablolute value
or offset value). (Optional) Account for downtime in gTSC however people want,
even with KVM_SET_CLOCK/KVM_CLOCK_REALTIME, which you may not like.

3. Adjust kvm-clock (that is, ka->kvmclock_offset) with KVM_SET_CLOCK_GUEST.

That is why you think KVM_SET_CLOCK is no longer required if we have
KVM_SET_CLOCK_GUEST. While I think KVM_SET_CLOCK is required because of
KVM_CLOCK_REALTIME.

It it isn't required to account any downtime for gTSC or if there is another way
to do so, only KVM_SET_CLOCK_GUEST is enough.

> 
> 
>>
>> If we are going to use KVM_SET_CLOCK_GUEST when KVM_SET_CLOCK is not needed, I
>> would appreciate it if the API could carry more data in addition to struct
>> pvclock_vcpu_time_info.
>>
>> +#define KVM_SET_CLOCK_GUEST    _IOW(KVMIO, 0xd6, struct pvclock_vcpu_time_info)
>> +#define KVM_GET_CLOCK_GUEST    _IOR(KVMIO, 0xd7, struct pvclock_vcpu_time_info)
>>
>>

[snip]

>>
>> Another scenario is when only MASTERCLOCK_UPDATE is pending and there is no
>> pending CLOCK_UPDATE.
>>
>> In this scenario, is it fine to skip processing MASTERCLOCK_UPDATE before saving
>> pvclock_vcpu_time_info?
>>
> 
> I'm not sure I understand that scenario. 
> 
> MASTERCLOCK_UPDATE means we have to actually recalculate the master
> clock (which really *should* be rare, now!). And then any time we do
> that, we also have to do a CLOCK_UPDATE on every vCPU to disseminate
> the new information. Which is why kvm_end_pvclock_update() does exactly
> that.
> 
> So your "MASTERCLOCK_UPDATE is pending and there is no pending
> CLOCK_UPDATE" doesn't make much sense to me. If MASTERCLOCK_UPDATE is
> pending, then there *will* be a CLOCK_UPDATE pending.

Suppose the VM is stopped and the master clock is active.

Suddenly, we change the host clocksource from TSC to HPET. pvclock_gtod_notify()
may call pvclock_gtod_update_fn() to set a pending KVM_REQ_MASTERCLOCK_UPDATE
for all vCPUs. Unless the pending KVM_REQ_MASTERCLOCK_UPDATE is processed by
kvm_update_masterclock(), kvm_end_pvclock_update() will not set a pending
KVM_REQ_CLOCK_UPDATE.

Therefore, this is a scenario in which only KVM_REQ_MASTERCLOCK_UPDATE is pending.

I do not think this scenario is important. I am just curious about the expected
way to implement similar code in the future :)

> 
> 
>>>>
>>>> Would it be helpful to validate that the delta is within a reasonable range,
>>>> e.g. that the drift can never be more than five minutes (forward or backward)?
>>>
>>> If a guest has been running for months on a previous host and is
>>> migrated to a new host, don't we expect that the KVM clock of the new
>>> VM on the new host is tweaked from its default near-zero after
>>> creation, to some large amount?
>>>
>>
>> Regarding live migration, my own investigation does not show a proportional
>> relationship between VM uptime and the amount of drift.
> 
> You're comparing the VM on the source host, with the VM on the
> destination post-migration.

Apologies for making it confusing. I was just trying to explain why I think the
kvm-clock drift will not be large.

We previously discussed the vCPU hotplug and kvm-clock drift issue. The longer
the time interval between two vCPU hotplug events, the larger the drift.

For live migration (with QEMU), I provided the equation to show that the drift
will not be large, because it is determined by something else rather than by how
long the VM has been running on the source server.


For the previous vCPU hotplug and kvm-clock bug, if we add more vCPUs to a guest
that has been running for three months, the drift will be relatively larger.

For QEMU live migration, migrating a guest VM that has been running on the
source host for *three months* versus one that has been running for *one day*
will not cause much difference in kvm-clock drift.

> 
> Perhaps I misunderstood, but I thought your suggested validation of a
> 'reasonable range' would also apply when adjusting the kvmclock of the
> nascent VM on the destination host, from "newly created" to "has been
> running for months" while migrating the state of the actual guest onto
> a clean new slate.
> 
>> Just taking QEMU + KVM as an example: suppose TSC scaling is inactive, the
>> amount of drift does not depend on how long the VM has been running before live
>> migration.
>>
>> Instead, it depends on the delta between when we call MSR_IA32_TSC and
>> KVM_GET_CLOCK, and between MSR_IA32_TSC and KVM_SET_CLOCK.
>>
>> The guest TSC stops at P1 and resumes at P3.
>> The kvmclock stops at P2 and resumes at P4.
>>
>> We expect P1 == P2 and P3 == P4.
>>
>> On source host.
>>
>> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=0 ===> P1
> 
> Here's where it all starts going wrong. Line 1.
> 
> Any API which lets you get a single time value in isolation, and thus
> which is already out of date by the time the system call even returns,
> is fundamentally unsuitable for migration.
> 
>> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=1
>> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=2
>> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=3
>> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=4
>> ... ...
>> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=N
>> - KVM_GET_CLOCK                               ===> P2
>>
>> On target host.
>>
>> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=1 ===> P3
>> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=2
> 
> At this point, the nasty hack in the kernel steps in, realises that the
> value you're setting on vCPU 2 is within a second or so of the value
> you had previously set on vCPU 1, and snaps it back to be precisely the
> same. To work around the fundamental brokenness of this method.
> 
>> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=3
>> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=4
>> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=5
>> ... ...
>> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=N
>> - KVM_SET_CLOCK                               ====> P4
>>
>>
>> Here is my equiation to predict the drift.
> 
> I'm sure you're right, but I didn't get that far when looking at this.
> I'd already thrown up in my mouth a little bit by line one.
> 
> Here's my equation to predict the drift of a live update done correctly
> on the same host using the method I've now put in the documentation:
> 
> 0.

For the ideal live update case (on the same host), there may be no need to
adjust gTSC so that it keeps incrementing. In that case, KVM_SET_CLOCK_GUEST can
be used to adjust kvm-clock based on gTSC.

For the live migration scenario, the current QEMU implementation not only fails
to account for downtime, but also has a drift issue. That is what I would like
to address in QEMU.

Thank you very much!

Dongli Zhang

