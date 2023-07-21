Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AC75C872
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 15:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567558.886780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqa1-0004wo-Dm; Fri, 21 Jul 2023 13:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567558.886780; Fri, 21 Jul 2023 13:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqa1-0004uH-As; Fri, 21 Jul 2023 13:54:01 +0000
Received: by outflank-mailman (input) for mailman id 567558;
 Fri, 21 Jul 2023 13:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMqZz-0004uB-2Z
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 13:53:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 081f88e2-27ce-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 15:53:56 +0200 (CEST)
Received: from mail-bn8nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 09:53:41 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6965.namprd03.prod.outlook.com (2603:10b6:303:1a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 13:53:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 13:53:37 +0000
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
X-Inumbo-ID: 081f88e2-27ce-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689947636;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kGvzQbmJFY93PSR73651zJHLnmDYkErdePgbfn+Oe68=;
  b=PQMZQbrj0bAldo415RjlzPkuLpQa7hpOj/u2LRPwPlKIUECKadeEeoVc
   NY4x7Chx4DXBMtstwSej0KYHpX0ACkO4kw/oVIVad9A91ETdIkcjSzsxG
   vaWK+O6zduyHQN8/fgUGC7Df4s2XEIHpWd4LVWMEQaVY0Ni9NHY+WmaxP
   s=;
X-IronPort-RemoteIP: 104.47.74.42
X-IronPort-MID: 119615847
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JeTDSKIJcCrw0cnCFE+RFZQlxSXFcZb7ZxGr2PjKsXjdYENS0GAOn
 zFKW23TM63cN2vxeYonYN+0oEgB6J7dxoBnTQRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c50XkFp6
 qQhEwo9RRaZtrjm3ZSYcOxz05FLwMnDZOvzu1lG5BSBUbMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VrpTSJpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv92LaSzX+kMG4UPJqhscNw3WS//VQKMV4dDGS7uvyQiUHrDrqzL
 GRRoELCt5MaykuvSdXsWgyil1SNtBUcRtl4HvUz7UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq10bOZrii7PyQPGkYEaTUZVgsO49Tlo4YbgwrGS5BoF6vdszHuMTT5w
 jTPpi5ugbwW1ZIPz//joQqBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHLlrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:CGxTeq8kw2YCK008mWNuk+Gydr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 2hz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajTQ8aCwUh4AyuiyrtzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GKN2QhtMTIjDMjB/tQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1ImjvsV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8YD4hEcJOia9QbxOcsiMbzZhB+Z
 MO+1jcm4tcDBvGkii4z9/UVytynk7xhXY5i+Ycg1FWTINbQr5Mqo40+l9TDf47bVTHwbFiNN
 MrINDX5f5Qf1/fR3fFvlN3yNjpZXg3FgfueDlxhuWllxxt2FxpxUoRw8IS2l0a8ogmdpVC7+
 PYdox1ibBnVKYtHO1ALdZEZfHyJn3GQBrKPm7XC0/gDrs7N3XErIOyyKkp5dutZIcDwPIJ6d
 j8uWtjxC8Pkn/VeI2zNMUhyGGPfIz9Z0Wh9ihm3ek2hlWmL4CbcxFqSzgV4ridSrskc4jmss
 2ISeNr6s/YXBTT8LlyrnPDsrlpWAwjuZ4uy6IGcmPLhP73AavXkcGeWMrvBdPWYEYZsyXEcz
 E+YAQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AlUTGR2sMXUfWbkz1p+11U1ga6IsmLV360y/pGHW?=
 =?us-ascii?q?IImBzeefFVHmzwqZ7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A0iDr8wzUq1vZ3Q/jeGYe7mJTcICaqIO3T30XzKw?=
 =?us-ascii?q?qgPGdDG97YgidlzGeQYByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="119615847"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilVHyZzi7CIYKvSjMxrvX3KKRLzfo+0f3hvXkR14PXtXd/Ig1ZREMYxFErSKysy8FH4AAZnV/wx06uB4A4WfevempYY7SFeDjYmB+HVH3/K7FumRShZ3jPC5CdAPLArIyWcXzJYNqLZ6m2HPgYWIUKQOFXusE1VD7c1jJPcWyLONCj1/6FnIO3Bmvr3i4/8IhoccE6W38N0mdmEM9d2NsedIJrTBF6KkWoo17hFqOyXn2TLXHtJ05gwbOVSA/l8XfgTW4UVFcE9qH0JmRD2N/dxNwXudLuX2J02dF+a4dtrCh5EsF1ftXN0v1hyw4E9Bjhs+BzbgY5wwvO05h5YyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Bki3pXulailNmGES+dJJCo9+B1TZeL/qAv6gQDrOuw=;
 b=LPa2XpK7+POOisjmcXHGCmL6uMS4R4bVrMvC2RvmciJUpLZHFnyTuHvwtxLGrg5sUb/Ix+RXD7nO5OXtVf5RTl2CAFK1xz+iP2qNYT955e+9eoHE49g1SYTlv1raO4Y3h4ZyiG9PDFe2FJuLU7diveITh9tbeRFz8vZrCvCBS82gzfmxpjtEVD7zSRxTtIUrchUWA3uO5bAEArw6IOjRZkwzEs5v9wQCQcb2ZL9LJv3LVxy6Cehr1jxSzwm8xtoRYI9EfOw2/8yeqkdQvpsFaixQ8vMwc1dyRzpux8OlwyfMBULTt5EWTHU7aslpXRKbOagJAhOWxpY0cWCiTnPOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Bki3pXulailNmGES+dJJCo9+B1TZeL/qAv6gQDrOuw=;
 b=MzSgUSpgaJdeXis5x4p1yHMF4w5vxMc+cnwd7TR/6mtvICoXJ/PkxkrPM6wcVTdD9bIy+i49QNSI5ez/8Go20e+hOpQniETf1340OGxV/YrIqgXPsNn+BlzldtXvkt0+7hPjplbQLJ9DSoLLaRb2ynD0K+T6pHkgDUesXh5P//U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 15:53:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 11/13] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <ZLqN22RNEN9Cdk3F@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO2P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::27) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: cc389c4d-136e-4092-5eeb-08db89f1e1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rZHml4NhHg8IqJ0XLACymSR9n2vXH8//CwWLHdBVGoxPWBiRTZohlpUJ+DftORmh7R4No4pAgePhbNTzFZEbYAmoHyBXWBLbv316LxXMfZmQrxg+LC0ZakBat2JPJY7WBcFgPSnpokTCghCp1k69tIv8e5rPL6ykZuJPfJ5p2rbCknLYJohhaDZtMI3QTA5LWy/7z60d6DxiP4lC5FweCLXybjZMTJPz6etRlCMPPHMiGkO+SLLck1QLCtCBKDcUrjGSKF4dU3pA2aaZmE/vc8kBYN6jGC5pZU5zlUSeW3nEBxjEBioRB9/vAis0zFA3Nb6695AOgj1zX21QAGTt2nEMeN1En5d7i7B7BIGVj8IdI3AFQavo1WP/lMeQtcSPXYmPuoME+eN9hCU+7Epsj4ZGWEaXcREruCPdv3LVonmenoGjEo3spuLoaMvzJPVIjYjR8QoxmiFlbUsoLBtEFLwD8HEV+5BA0XUMIsUJrd09L499TNwJ51mf9Ptj20JNr4w/s21PRGBH1ro13OYH+XcGoUR9xUnhJ5nmPIyjZI5IrLfaSUSU2wc30i/4Y4b8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(316002)(4326008)(66556008)(6916009)(66946007)(66476007)(85182001)(38100700002)(6486002)(6512007)(6666004)(9686003)(86362001)(54906003)(4744005)(478600001)(2906002)(82960400001)(41300700001)(5660300002)(8936002)(8676002)(186003)(6506007)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzNkVUlNL2JqdCt1VWJ0QkRPdXVnK2o4VlZTdnpienZOODBNYjVtekhmNVNO?=
 =?utf-8?B?RlhSVzdKNUpIcVhNTlhIdG1kcUE5RlRCY3FyM2JDc1VaVTJ5NElPejJTY24v?=
 =?utf-8?B?T0svUzlqak9ydlJIV1F2QkE2aks1WU1LSW5DcFZWcGJ1OE8wb0pheEdiV3Zt?=
 =?utf-8?B?c0xucG9GWlNiTFpJRlZYZUVFS0xDT1M2TmlURWVjWVdFWGRRczNxUGVrWEp6?=
 =?utf-8?B?MXdadzVkQnZFOWc0ZUpXKzRIMVp2eFFQTCtlUjZ2VHRpSEd5Z3dTRExVUG5l?=
 =?utf-8?B?RUIvajlZNTNPVXR3aXQ3ZWZGd1JkT1pPazRZWUNCb3B5MTgyMi9mNGJxWUpz?=
 =?utf-8?B?R2UrRWdEWDkvNFlFSDdCNTVSTmxJaEl2WUZsdHdSK1VoVTFzMGJwQ1B0UlNC?=
 =?utf-8?B?TG1wamZ3RVd0bnJVV05wRkdITFFSYis3SU1ONjVINnIwcjFzME5uaVNBdnV6?=
 =?utf-8?B?M0VBbTNqMkhnY0JtTTI5Y2JSUitRRUNtaE1XeWtlcTY1OGJUTmRWN1FaSTAy?=
 =?utf-8?B?RVo4QlVobnhBbFFjSENYZWxxTVRmVEo3QWVYQzBBZnNFWnRQYVBDcUthdEE1?=
 =?utf-8?B?Z2pJWitVc1BCVmVYSnBCSGFpb2x2Rnh5Yk5QVXdkV0ZibnVuMnlnejArdWI5?=
 =?utf-8?B?NXM2YlpST1AyUmVsM1ZUYjlwbE96dm1mZk1jbjFYVkh1ZldIKzJWVUh3ZXhq?=
 =?utf-8?B?VmNpQVFRYTZUcCt5OTRiSDlweUtUUWRwcXRoZXQyeTdDdE5CaXpUODJDcmJx?=
 =?utf-8?B?SnBYUXlGdlFKZHJWUzY5U29ZMXcwRzFBVVQ5M2l0MmtlbXZVVjREM01acTlO?=
 =?utf-8?B?VUV1ekRZL2ptMnZJRE1CaTNnU0lOY3VBTDh3bmd4N21tN3pUb0srODEzVlow?=
 =?utf-8?B?TVRnenVmUGpqcjBteGJkZzYwU3pwZ1VyYjQzb2c4cmlOcWtCMVBzeUozeUlU?=
 =?utf-8?B?VXRLMW5pbHpQbHVJU091TjJJa1ExQWdFaGNVeTAxOW8yNGdjVEM4aG5IM2tD?=
 =?utf-8?B?eTRjUVhDbVNGeXVOWFZaQ0txclZxS05vYTM1dXZLS1M5Z2t0THprNkpXa1NF?=
 =?utf-8?B?Y2kxemwwOWwwQm9rby9nYnQ3d1RsR3dqODJCTEg5b1VLQ2ZGK2prNnNyc01S?=
 =?utf-8?B?RExHVkp5aVp5YWkzN2FaSjdGbmJZRENZZDNucFZQdzVsMkljZEx6M3pBRE5v?=
 =?utf-8?B?Sm5SY1g1Wis3WWZYQ01iZ0dUNDFhcDhtcmllS1hNU05vaEhMa1Q2UkoyTWlM?=
 =?utf-8?B?VTRHby9heXV1K0poZlV6ZStWbndmQ2RuczlKZGxmMGFPREtqR1VoR1Y3OVZq?=
 =?utf-8?B?QlMrTzRtUjNEVEw0UEpjNW45TTlOZFJGbE5mMCs1RytnQnk1SFZLNjh0U055?=
 =?utf-8?B?YmNDZm55Snh2U2lFVTc4czhuQkM5dURGbHJEblJCVWEvQ1MzNFJtdkIxYVRw?=
 =?utf-8?B?M21zcHhYUVFnZGVmZG41aWZxc0QvWE9rZmoxa05YcHgyd0dVWnV2RDBBUjBF?=
 =?utf-8?B?N3cvVTBZc1VFVmZxcTR3TytSdXNnNThML0dUWDlWc1JWVHYrMkM4RjVTVU5K?=
 =?utf-8?B?TjJ4R0R6aVRBR0NTVkluc2FLd2Jld2hkMFl5cVJnQ3VIM0tsN0tTWWRmaHlJ?=
 =?utf-8?B?Z3RGNHBBWGVnQWhzRVVoNk9UZlJNNjBIKzdPRGNKajREN0lMeDVsczRwcisv?=
 =?utf-8?B?eHhsbzY0OGpMSm14YnVhcmpDa0dtSys1Z2JkZmRCODJ4SlErKzh6RlJVRzdX?=
 =?utf-8?B?cW1KRVZsTkxtdVF5Zm1naG1mWGxUdG5WU1JNRFBWdVZibWZvcldrNytmalBP?=
 =?utf-8?B?cTRQY0p0TWZxbkM1TDZKYXJtQi9vS1IwdENVR0k2RHB1ZGd1RnVLaWFzdWFM?=
 =?utf-8?B?cHV6OTM3dG9jSzYvWVN0UGZCZW5mbTlwdStEeFlRUXFOU2ZZUVBDMnRTR29Z?=
 =?utf-8?B?YXR5cTNFL1A4UXRmdEpPTk9XcmVlSjVpOFQya01BWHBqQzQ1RzJ2Wk9FZWUv?=
 =?utf-8?B?bktHTy9VOXFteUpraWdoZjhMUjN4ejFYeUZwUFVJZ3FVZzdSYXF4aXVpajEv?=
 =?utf-8?B?dmhXMGtVL0ZvYzBscVRnVi8rczM0QW94bElYQ25kdi9Qc1pOUHFoK2JzTnNG?=
 =?utf-8?B?cFJDRzV4Q2JadDNhejZBRXI4UUlqRm5iYlIzV3JKNXZnVWdwM1ptS21mVFd3?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VkCZRYEkd8+IU7p7wa3mJuqvtxo2iocmwYS0vv+zpHyKboeEaxtlLV8Dzix295hSXvCKl3RhhCbYzkQ/vDNVm8XgwQBVkkbLGKpnQjyE+PFsuO+FFbZ6mb+mu1KKgIlj9aCd4VXYwgBwYCnchQGXlQ2pHxzOnxKaW6R4nz77D/pef/bhdjJOLG6UfIdo3M1p4d6gSbCvpn3tB2Ft7BHJUxmFn9Trb6pz+q/SbUA6faw32n0NDuBwzjDKjNCPcpmNGg9+dwqc1CUNrpGF8JwbKIUOKoGIxndR3af+jFS9hV3Pq5qWVPFzbRVp8GTYkcswVqqGm69lTV4drV0CPbXbbgG1ALSTrewZYdC20sEiifr/5D0uhWeTZ6t1dLZw0Js3ZkEkz+ufaQtjUj475vz8u9Cu29ijMR3Ufc6yfoUzieLYiJq8UK6Hck7Q1hbB4Mx+gReYQoZYAaIGyFJrbTOY1VTcvh3qhqm9Cj71bgNMLeGmRQwtQkSMjLejY90xiKEE7b/OkPmp56wKN+SsWiby0QmHlQtk9m+uhuP+3/9Pbr1QpagZTFwiltVLr0iB6tSuRBQy+iytVi50fOG1IGtzgB+EHJ/e8sQpt0I95Qlo6bh7/reTKvECtAhVRyasO//+wGxNIfYFkGztA4QCBZgBLFsiMdw7CXZv/7jjYYYGIQGQPnyeAcbMkUkcYfhAreauGopjx4HuJj5DHtWV/+KSxR0WpFrcLWb0+MxJJh9PMwQz8s4LLn1WQucWJtnybdOrl3BjTlgYQ7MDuRymGRx+5egw9p6dlOt1cxwUDRiXdew=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc389c4d-136e-4092-5eeb-08db89f1e1c0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 13:53:37.6278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tCjFsIWbcHZjMl8GBb+OOn7fle1giDkAvYBeZdjAzE8jfoVr1YvdUpN/ZNw+j4oo4LM6I1N/piYlZ8kt8qAzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6965

On Thu, Jul 20, 2023 at 12:32:33AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 80dd150bbf..478bd21f3e 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -461,6 +461,14 @@ struct domain
>  #ifdef CONFIG_HAS_PCI
>      struct list_head pdev_list;
>      rwlock_t pci_lock;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * The bitmap which shows which device numbers are already used by the
> +     * virtual PCI bus topology and is used to assign a unique SBDF to the
> +     * next passed through virtual PCI device.
> +     */
> +    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
> +#endif

I think it would be helpful to state that vpci_dev_assigned_map is
protected by pci_lock (as I understand it's the intention).

Thanks, Roger.

