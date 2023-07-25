Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57001761FAB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 18:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569846.891002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOLNc-00016M-6y; Tue, 25 Jul 2023 16:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569846.891002; Tue, 25 Jul 2023 16:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOLNc-00013y-3X; Tue, 25 Jul 2023 16:59:24 +0000
Received: by outflank-mailman (input) for mailman id 569846;
 Tue, 25 Jul 2023 16:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+x6f=DL=citrix.com=prvs=56398a583=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qOLNa-00013s-JX
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 16:59:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98963a1f-2b0c-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 18:59:21 +0200 (CEST)
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 12:59:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5450.namprd03.prod.outlook.com (2603:10b6:806:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 16:59:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 16:59:15 +0000
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
X-Inumbo-ID: 98963a1f-2b0c-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690304361;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zTt+xcWlFKE+PnXg77I1ADqGh2CAfQq2XeNMJ7yXeKQ=;
  b=Skl7W0xb++bU+zqu1yDvxZ3M2sOntxSSe27fRXTgIykJLnlFalqdp9cn
   VQS7FR+df/cGO2AXquotX5jxVs/kiSbZRkT+hnG/FNazNriPGn2GFR1P2
   t+pTxMpS2X7E0xCuHSbCtvkLQI+t1DS3y48ABJYAhTj5eQKo35nH+VRb9
   4=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 117416866
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jZ4oIa3taI0+uki04/bD5fpwkn2cJEfYwER7XKvMYLTBsI5bpzUGn
 zNNCGzSPf6NazGmLtklO47ipE0E6MeByIVkQFE/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNkOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGFFw7
 scxchM2TkqGgOztg5KEbfRnv5F2RCXrFNt3VnBI6xj8Vaxja7aaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqui6Pk2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqkBNtMROPmnhJsqHKjwX0xGiQ9aXK+n8WGs3OvfYkDA
 GVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4qjb+QGCHUAfUyVMLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Ys11xTGS445FLbv1oGqXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94aRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:fEwHu6NxhuWn7MBcTv6jsMiBIKoaSvp037Dk7TEJdfU1SL3hqy
 nKpp4mPHDP+VMssR0b6LK90ey7MBDhHP1OgLX5X43SODUO0VHAROpfBMnZowEIcBeOkdK1u5
 0QFZSWy+edMbG5t6vHCcWDfOrICePozJyV
X-Talos-CUID: 9a23:4AtWhW7yB1svJMH3hNss7X4qAfsMKF7m7C3VJEHjSkZWb6CecArF
X-Talos-MUID: =?us-ascii?q?9a23=3AIRmVJA+LGoTEqtIqKIH2UWyQf+hY5LWMGnkmrbw?=
 =?us-ascii?q?DhfW7DBFhHWzBpx3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117416866"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWAQuypXv/wTLk59zWP1r8ffzMSB+eZMVZe0X1Rjtik8vFFTSG/3uSfucXl46x7D2Pw4v/quedQFm+SqCwybs4MO4WroEojWF8HdqsVWUau3xzMKbPJ/rvMtUbGhvuw2dQC9cE/svT92xCy2Z/TU9z0MyZDR5UYgo2RGYgkedbpmQMVNW8trcs69PKUUTbbhXekdaLwl/3eHj6GUS3M5HacJSBabs9gWrHomou8gqf8WN8pPJKH9f+cHWf7e5Dc2lGEesNdkLpwsv38rzst3m0npsqtrDpPo0L04vpvYtjC6CPhYkleuJRb/1BjS8vz3XB3xlUOGmSxrJJxsh5HOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjubPeh4Jz3Yoa+t0Yupgqs8qC+4/GGxRdLSxVPAqt4=;
 b=OpNuWmEOpg6Ol8m0eL56hOGYvaDG2ABIAMf2951DsEmviSPi5frSPGMy2u2KR5VPN4lHyUzjUMvOOhIhcjBRuMuH6EDntL/pNTdtVn2FbB1m7CGkCyYBHiJaVI8B6s2VnyeFQhZUFTK9XK0ege7tbgWjZkLT9bu0SKRpSuICv2+qLDqE2Pt/alG80RmqR4w1WAsgrwscSwyeErZrUBwDNT+pG5j7PRFawcL1FFxFFxL/nvB9LxWCw/ydKciCBpMTmrKA6FBQZeXgeJ6EZT9YF27McflE0/xbbej1WvphQV4mQpJW6e9Ycj0LbxAuTyT6OTSPw2cfVh6y+Nrob8o26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjubPeh4Jz3Yoa+t0Yupgqs8qC+4/GGxRdLSxVPAqt4=;
 b=ObyqGSKcXRnnOeeDofgejPi2UxYOij7ji/24r14AFKsx3mcrT5qyJqKPvY45sGP0sHLOimiFC6cmX5boSMPdYGRg1nmzzD0p8Nt8R0C9Peksn3tEYKBLvA2/VnGczJkIl4VKxjlNW1gFLRIaBm8RoUBg7vVwKONyo54Gn3Vd9NI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f54fcb50-15c5-aa72-60fa-6370547bb9f2@citrix.com>
Date: Tue, 25 Jul 2023 17:59:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/public: fix flexible array definitions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20230725135557.20518-1-jgross@suse.com>
 <5ba647c0-fc74-595e-5fe3-658f4662f16e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5ba647c0-fc74-595e-5fe3-658f4662f16e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0237.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5450:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f7c63cf-1225-4f68-9124-08db8d307a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j7WeJgOlK7yurEMTsUXWjLqS5nZOKULtYBumYYR3dLwkhPVNZrVVSZTqLypP3AyWktfwbG/za7mVCqileuUw6ZARU51TLvpfPhBU5w7R2qS1TLFkY/xiQAs41D9McFKsVfb5DXS8LpMBCy3Doa/YQXigh1A5ijTNkgJSD60ujZt1mWa5Kb8TJZBRu772ZxMN/b6Z/+aqwg0uFPWOIu/T79TnVoW0Qu299Z0t6nT4gPjnIiFJX++RKNvjvMKGNfveTiz4AizCDOeBvqJRdpzEidbsShZUtAPAkIBY82eMEmzk6Yj9ZDuoKsomP68b0xD/J9QM9yu3RjV2wzOe4uOIGj3Ji6HAXpXUUL99jy+i8nbhx4S2O0/+PcLAePpB6LwNfPDNLbCAju+dLyWUIZYJCXYjS5bIvjJi36nYejYn0S40dltx7iRt+CXTmaSN/2T1eZETABQUGNR+HZDJUiJDFGRz2I9sieq1uumkeqti9bK4T1zcGjZAh6Ilsh7AvuWbi/4V39pbK7v2n+WvbB49kyaTJtCZbY1pK26atzduZYx9YQHx3oMg8gnkxL/uGA9AMfl2QQNTwALEScwTmUNd3Wk5ZuXaKA/LwayQ385v/bH+oTcT0g9TKS4yG4Ft4VbwyKaeQmilcvwDFdhkUKpvuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(966005)(6512007)(6486002)(6666004)(110136005)(478600001)(186003)(53546011)(2616005)(6506007)(26005)(2906002)(66556008)(41300700001)(66946007)(5660300002)(8936002)(8676002)(4326008)(66476007)(82960400001)(316002)(38100700002)(36756003)(31696002)(86362001)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTc3RmQrVVYwL3dJVVAyN2hNdTdBNkIwNzhlY2dTOEhGbEdLL0dTcUhSeVJa?=
 =?utf-8?B?aUNOazM5cUQ3QmdkSFFkaDJTODRmOGZDR2paVHZKRldINTRjUDV6SW9IUjNj?=
 =?utf-8?B?ak1RY0dQZnRCVXJwaTFPdkRvZGRJZ2JBeFRtRWx0RDRUUVBvYUNsWTlrSndp?=
 =?utf-8?B?ckpFOTl0MmpFS0FCUkpJaThOR2V3M1dCRllOUkZmZVIvck1NQUtEbm5BaTNW?=
 =?utf-8?B?ZGpZaHNuRGwyd2VjRG1LSGJMcXR4bC9PTmJxUkNvWm83bnFWOGMxRXIvYTZF?=
 =?utf-8?B?NkpIUk04bTV4eUpGZ2hMUG12cjgrMCtvbUFkdTFnVDAwcVN5eGdMVEhuZFpp?=
 =?utf-8?B?bEx2MTdaVHgyaElqdG43Yit2UlU5eDNwV3FIZjllOTlCY1lHcHRkYmFscFlX?=
 =?utf-8?B?NlB4NmVLcnVmNFpua25Pa3ljUS9admpZK1cxNzdOMmZvQ3FEd1hTWXdpOUJS?=
 =?utf-8?B?dS9HVEJ0bjFMTVRFWkdWUjc3RzRxOWQ4THdKSlFOZ3hRSGJRSy9OOGRRUFhC?=
 =?utf-8?B?M2F3RUUvQm8xc05LTC8rVmlKaVNTcVV4MHljSE90VVp2a1ZpQTBVSXRLc0pD?=
 =?utf-8?B?V3ZSRFdoeG9mZm9jRk9PUVY5NS9jajEwemV3WEZYQjNrckVxZGIwTURCTEJt?=
 =?utf-8?B?WFJPSmh5Y1NweFRIWm1xQ0NSa3h3ZXlGem5OOFlWcEY2c3JiY2U3VDdQeEVq?=
 =?utf-8?B?cXhWaTVucTM5Snl3WkZjZEVIOHhlMGpRSFhITG1hYWxFWWJGblphd1FtakdI?=
 =?utf-8?B?Y2lwanVmVE1LZGVhMTlwOUNDK2hkb1JCS3hsNlN2Wko0YXI5ODBIeHdFZUIw?=
 =?utf-8?B?ZVRtU1lhazArOU1Ld2g0RU1ZNHozckRiU0FUdnFBUlkvYTNybHRrdHphR2g4?=
 =?utf-8?B?L29EWmRzcXM0RXNvMkVDZzZQZUQ2WVlMMFJGcTk1NGJzNEpSMnBkNFpidWFn?=
 =?utf-8?B?cjY4Yk0zY1VzSXVwNFAwUWZ6YmVkZTRVRjhNdDVUZElqVC9pZnMvSDFUNFdK?=
 =?utf-8?B?L0QwKzVMdHRmUUZ4OWNOajJNSk1uYzJMRzNUcEVEdWlLTGdzbk0xZVNrbHJm?=
 =?utf-8?B?Um9mQ2pSallzNVM1MFNxdzVabXhTTnJUS3NJTnQxWkhRT1VYT1BucU5ubkRx?=
 =?utf-8?B?aGFtTHdpc1NjS1Jka3BTeSsxLytRRGRlR2htMUhhRllkc2pCL3Z5UWlpSDMx?=
 =?utf-8?B?N01lSnhNKzk2UmR0Q2dBTjdqMmtQV0ZxYW43OXVIZFN2ejRjQjNQZ29sN2Zt?=
 =?utf-8?B?d0NUSUZhbjFFZndwMHh0aTFvL1JPZlVFQUY0UmJmcC9iVU5CNk5lUFRmSnEr?=
 =?utf-8?B?UHpvR0J3LzhDWWtqbXBKaU9YZ1ZtNW8zUFZsTFNMWmJ6cjNyK28vcHNXallM?=
 =?utf-8?B?ZjQwZnhCQ2hSQTNyQ0hTSTYxZFQ4cXprOWFaTHFxSzVObENPL3NqalZyYjJJ?=
 =?utf-8?B?WEQySXByUUhIc2FoNFg4L0JUQmlVOTNNcnFySjVMdjdXSGk0TUNBN043TkRT?=
 =?utf-8?B?VnlDRHJVZVg0WTVlY0VSd01sYWlXdFgzT2JPN3FRNlVvRHA2L3FqYVJmZHNN?=
 =?utf-8?B?OUgvYk5yZTYrWnQ5b1lGSGZzSklzKzBOV0NyNGVTQUVmKzBPQ3JOekwzUTRO?=
 =?utf-8?B?VEtMSjd5Yk5acHBITmFoMlhVTWlveXdKVGFsSnp2ZEdTWnBSUnA2dm9DRjl2?=
 =?utf-8?B?OVBzOVM1SllmMmJoMVhvWkJwRmdQL2ZzMUJNYVBmbXVBTnd2TDluNFhHN3Va?=
 =?utf-8?B?OW9rbUg0a3hLdVdXTnNwSVU2bXlERlVvdis4ek1Mc3F3T1NITUtYNmo4MUhH?=
 =?utf-8?B?cHB0MjVrYUdSS0F3SDM3dmZOYStjZmlsNXpWUUNQOUlxNncxcWQ5WlJUaUxB?=
 =?utf-8?B?d2crRHk0eCt1dHdFMTBUTGt2NHRsME9mVWMxY0xVWTNkK1pLR0xmZTZXTlhJ?=
 =?utf-8?B?bXJUd2owKzh1NFRFb0V6b2J4a3pmOVdDL1JTWVJHa2ttbTEzTERYQWdIZXJO?=
 =?utf-8?B?NHV6c0ZNRC9mZzhWSFlkNDhGZHNUc0ZkZmtOTEMrK29PTWJVOFczaVRiRUli?=
 =?utf-8?B?R2hIWG1GTzhValAzNDRqMzJRTGkwS0tNQVU3WnMxZmI3VHlEdHA1RzlNWUFs?=
 =?utf-8?B?S2NGdndXbi9wYVNTOGo1NllMVitsZmd2OE11VUJ2SnJQRHRYd2pOcHV0Qitt?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lN2ivynoZrhH9CmKDkhNZ6VKY0SQK3UcGqTJ9WJtbVxrgZXwMvuELIB/iDNJbySMV4LpBrfOxLyxayvG0VsovyFBYLtntYsiR2q3Q//bS+RYLdjs3sY4XmjVT8vP6XtYpd6a0w5RYswLbfcdESEYPIZcm/Iajw4yUtES/ObWyiKP7yUmw1/JmlK2z/K6hFEakysgSvCMcYcCagrwRcd92TIyhakf8iYU+0XUVPd5PfON3BcSDYR4kiKfTDRnk5lohOoSDUG6Xefy4kX0pPI5sZnXMe7XkNYsAe/+k/riPrxmd0JEwVtv25cFbeB6fppMM6Awcsx20fa/QQ5Op0aYU8Nmljd/9VELJ/k0dbkeGL/9we0yrq44e665xw/PWC7TdzAXOVos6QakIy9PT6hwAZFsSU/wwPQJFdkVRFrR9QQn5ONv/6ndYa370FAzjr0XZZOAE5zC34buKVGOQOfZJL9wgxmTy6TYKEmCQkO+/V3khVRR+KhBDy2tc9DZiYagi5WCBuOTjJYTN3V0yMGGkUW3ylKRY4/PWqz1jIZ4cdbzbPj2RMDzwUD4ureUYSxx67gZYsUx3Nz7Z6rN48hrrLWWGscrEYQwsxkGmduBloOdgvEWAkIhH2jghQksKRRliiTRpwA1MMWqbhdG0KdKSkWrZVY1pH3ReQ5un+Ncei/VQhAat7o7T0yOTHlmEZakkUv3hYC9S872iDQIDZOQgMysHKolh6axf9imPNCp7nx6tLO/UEllAx2oiUeXgKlDrNMNU9Vo8nYg6eAzPzq0FpEHkyeuwk58dtuJgatc3Pw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7c63cf-1225-4f68-9124-08db8d307a14
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 16:59:15.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkJYjC9I+3zVy3l4jGMmqzAyhz/GAhK/aPJvbJY8XTqHKFSx9n13Bonu5WTvEV/vPEFNoZ7hSfe3z6DVbAxHn5hfOgbIaAx/UkP+jbHy3hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5450

On 25/07/2023 5:16 pm, Jan Beulich wrote:
> On 25.07.2023 15:55, Juergen Gross wrote:
>> Flexible arrays in public headers can be problematic with some
>> compilers.
>>
>> Replace them with arr[XEN_FLEX_ARRAY_DIM] in order to avoid compilation
>> errors.
>>
>> This includes arrays defined as "arr[1]", as seen with a recent Linux
>> kernel [1].
>>
>> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> I think we need to be careful here: What if someone somewhere applies
> sizeof() to any of the types you alter?

Then the code was most likely wrong already.

>  The resulting value would
> change with the changes you propose, which we cannot allow to happen
> in a stable interface. Therefore imo it can only be an opt-in feature
> to have these arrays no longer be one-element ones.

I don't consider this an issue.

If people take an update to the headers and their code stops compiling,
then of course they fix the compilation issue.  That's normal.

It's unreasonable to take opt-in features to a set of headers intended
to be vendored in the first place, to work around a corner case that's
likely buggy already.

~Andrew

