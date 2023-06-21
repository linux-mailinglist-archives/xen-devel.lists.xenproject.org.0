Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF019738DD8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 19:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553064.863411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC22H-0005EY-Gl; Wed, 21 Jun 2023 17:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553064.863411; Wed, 21 Jun 2023 17:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC22H-0005BY-DP; Wed, 21 Jun 2023 17:54:29 +0000
Received: by outflank-mailman (input) for mailman id 553064;
 Wed, 21 Jun 2023 17:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1i8T=CJ=citrix.com=prvs=529409482=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qC22G-0005BS-1B
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 17:54:28 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6bf8135-105c-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 19:54:23 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2023 13:54:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7138.namprd03.prod.outlook.com (2603:10b6:a03:4fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 17:54:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 17:54:17 +0000
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
X-Inumbo-ID: a6bf8135-105c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687370063;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DKuVnU9S3UWAEcVAKJ/sN1Dkcl4wbdMxC6OFxcHUztA=;
  b=ZdmPmTokmEvvwE7IKiR6Etyzzw/K9teNS+XG6un8DpJf5K/j0NfQaaeH
   vL+79D5Ar9u9lhziw0YwvnZNdtYgtfofzDpuyCwmBg8tmbktzgRae8fk/
   Nl38Ggux3iXn9MXU+kVAtxfKZSbof1sAEsqw60ey2mWbnTN5ocpPeyxnB
   8=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 113678359
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ni9gxKvv2C916gE23Whl8F0yZufnVKJfMUV32f8akzHdYApBsoF/q
 tZmKW+CPPaKazH1fYhybd+18h9Uv5ODydVhGwFkqS1gQyob+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGEziFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOh0kfh7emb6M3JmWb9VP3ucEIPC2BdZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIa9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThraA10AbOlwT/DjUEb2Wmg9OQgHeQQo0Ac
 EpT6xMn87ULoRnDot7VGkfQTGS/lgUVXdNLD+Qh6Qal0KPM/wGDC24LTzhMZcYnssBwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty8X7rYgplRXJZsxqCLKylNDzFjD2z
 j2QrS4xwb4UiKYjzKWy4lbOhTu3upHSTwkd/AzPQmW/4wV2ZYioapap71ed5vFFRLt1VXGEt
 XkA3sSbsuYHCMjVkDTXGb1RWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4cuC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:+Ee9wq8VDksXe9+IAu9uk+DJI+orL9Y04lQ7vn2ZKCY5TiX8ra
 vFoB11726WtN9vYgBDpTntAse9qBDnmaKdg7NwAV7KZmCPhILCFu5fBOXZogEIEheOk9Jg6Q
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3A+2u/q2rlso5fBJpfd5IXMx7mUdIIW23TkWmMGVO?=
 =?us-ascii?q?TJENVa+W2blOppZoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AmLLaEA2HgnRs7CgAsKfk2BQogzUj8Z6QFWInuJ8?=
 =?us-ascii?q?/ldDband2fCakhWqqe9py?=
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="113678359"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HV6GRVJ/CfLXzlqbkus5FaXEVb/Vq4dqx1mnNO3WSP3AJzCQzDzgHilmkjzO1xuzPlHL3s9jXK+fW2kdOCxpP0bRaw5RnhsrG3OLHwBOCTngafDRTUXmmGZn7AECfrZPl473rj+E6zMxsgMJdV+A7Qi0uxUA6PIJW2TSMoJ3LGZkrKE/t+akq5ouxuQLA7nynOkzBxf+VsvT23AzjDvd3CWHfxcpSnygSc7CLQTs75GxbK4sETZOwZtmkwsvYlJu6pQgku3vBp6W0RRn/grG/yQt50Ot0XL3CeOb4NfHdGEAGSulmAROCMGajfzyH+fxX2Msigsw4nf7OLFGkdU8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AYRt7QxRC2fSL000Yk2bLEx49lbLczuJNH2BPJKuzk=;
 b=fYlnlXoPWsgGS/kpop/6y9WWougOLKtu+g5j2mTQQo7smONQGx5rbWVAhoNo8yO63G5cTSBRgdMRwYszPf4yD0NdL7k8WpHuGDovg2CsLWYJnqUPDOnaspG259IdJD5VUC5AkDBoVwLB/ZSQGAgG0RpvCt155tqsP2+GMJKFNMwwS1mQgrErAQwXoSoSlaQSNifGjwffJ+AUS0Kq+Z4aThNcd2W2LK348GtGjS/PskM25MXTVrOcRmh5YqYozDTMerqq5HyU/6l/dN7YQJE7JcwNfpwD8B3KwA7DgDCkiK5vSjb0OTIoKe/phAj3vNtc2ULv54vdTKMo/oXTeV6AxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AYRt7QxRC2fSL000Yk2bLEx49lbLczuJNH2BPJKuzk=;
 b=kmFoxDJI2lbZTVhvS+6y/db1fTCfG+ZiXkTZd99wnhOKWr+2Pm+1L2jOytH1MW9mLlJqIv8XFX4oYtHTOQ3HT0hSss/9/ZVUyojMmARMn7/mQKDDUFmzLNNWV3rBzjm8S8WZy/Z3YctMfREr8JgPUBz4CJr3UNVyKKR5+nuw04o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <692e2955-a85d-3c6c-7730-962956f6ebf6@citrix.com>
Date: Wed, 21 Jun 2023 18:54:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
 Shawn Anastasio <shawnanastasio@raptorengineering.com>
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0570.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: f71c635b-b22d-4265-0085-08db7280887c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D5GasfJ7EWmv8EkSce+xXASMs/Ty3c9XVSdn7Wwsy2nYyJVz/5/IqGAxE/KBHAebMH9bkWjD2gOLNTHvOivgI5Rb4N9f17SlgbNzMvgmzSMvVeRmVTSnEw4MGS+4CmueHBP2hDugmQU+GNi3rQBrVcZuXxUI7gNyHlRf03LOibYGxSnCViCDkaYs5xG4NPvptRn/pq5etuIOKQ3NEriuhEwYi6W/hjHcWj+mSiSCAHQ6vSBbHa/JPm44B0BD5qMQH5lMh3cWsg0ghqLa6PTKQzMP5rI6deAMZtIrNbDeFX+dSgI3DNCAi+Dhk8XWMhx3ZJ1U/0l1xu+f+QFjRJBZfMuZULdlxaGQ0G2Tbh9rixUhDRR8alQoiMnFmO782xr0wrYTLN6JklQabGc6Rw428dSo1WnD5z/UTDtX4mNCLqIkr9mXRYgtTsRXA/0R5M/eFZWCm6NwyfKfQsaIY0Yscb933wqgjm2vkpBQ6uoMa0NNkC6KkL+1Vyl3lQcMmUOpGjeS0Yml9BLISZMtMlZOdRGfCoJazBqS47sx5xZhwlAwu/TqDBBOYYcaw4YRjJOdVko6w304uXkhrnjK/6RL+JNcb53bOCRKC4+x0DY8DH5GhbCR9VkXRfiJWzVDcIoM2bMxpVQCfSES7DBpLTIIUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(66556008)(4326008)(66946007)(41300700001)(66476007)(316002)(8936002)(8676002)(2906002)(31686004)(5660300002)(6486002)(6666004)(478600001)(82960400001)(6506007)(6512007)(26005)(53546011)(2616005)(36756003)(83380400001)(186003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDdWRW1oc2w4aXJFallFWVE1VFBUWXB5RjVqVjQ3VEk1RzY0SmZnaUx6akNJ?=
 =?utf-8?B?STN0U1ZqY0FpSmd5LytoQTI0eEFYQ3VqV0xBTUY4cnAxc1Y1L01CYTc2TmZH?=
 =?utf-8?B?cXlhMnYrbDVxb0FNMkNUcWVoQ2lPcm0veENZR0dpTW1lZGV4RVloU2VmTUpk?=
 =?utf-8?B?WjFYWGFoTGd2OEtpZVhhb1oxWDVld2RoWlZzczM0T2dYRFZqMW9HQWxLYWM4?=
 =?utf-8?B?SHVHNWJtUWU1TU5qYnFpb2h0bThpWWVHbDhQT2xGMm4rMmdibHpxa29GdzBP?=
 =?utf-8?B?TlM2b3lTeURYK0pjZFY0dUpYWndmMXdGbGZtbFZhSGxWUnJCVi8wZlFQVy9B?=
 =?utf-8?B?VW9qL2FRdEZ1TDMzdFZ2bS8ySnlVakp6V3Z4Y2ljaWorZC9XZG5hUE01UEZa?=
 =?utf-8?B?a3NnNHIvZjRXSExJQzJYQkE4NjExcWdQYUh6YXV6RU9zY0xaSEFRUXpjdVZ2?=
 =?utf-8?B?MWl2ZzVGdytna2VZdEI5YUNDQk9aTHdIaHU5aXNURzBRdm9tUFhMV3hOaGUy?=
 =?utf-8?B?OHk4bytsWnRZUmdQcVZXUjhRQ2R4dVNleVNuUW5aYVFzOU53U0hZWHAxb1U0?=
 =?utf-8?B?T0kwWmFQMUtYejMvajVBdHQ4bUwxNDZ6TXI4NWtnMEVndzV3dk1sck5yTnlo?=
 =?utf-8?B?eklKaFhlSHc4cE0vRGpHNnFVZ3VUR2pOQzJZajRadkZqRVM2OFJVbVAzdEhj?=
 =?utf-8?B?ekhheFdlUG45VnVKbmxjT0ZXaW40cEhEZ3VSYmxUcFZsODBKY1dnRTZJa2Zu?=
 =?utf-8?B?ZzNONE1zemNyWlc5Z0t0bEhCVFhsMzRjd2ttYk53N1pMQ245bHE5QjRKaTNR?=
 =?utf-8?B?cEw4Z2Ezd0xLams4WEwwY0VOT3ozeEkvVmRtV1Q3UDI4cllVMWdkYm92Q3BE?=
 =?utf-8?B?YkY4clRHMXVGdSt3aFEyOVBDcjlpTWpsR290b0EwVzdlVFVwdUI4RjVlUlJt?=
 =?utf-8?B?RHRWZHpmNmJvbWhFU3p3akFOS3ZRb0FINjg4WDVtV2luRmptWkQzWTRDajA0?=
 =?utf-8?B?V1lRdjYwQ3dXUTNGL1ZqU2p5RUN2ZUVKaElCalAySXdSUCthdWNPTmx2Wjdr?=
 =?utf-8?B?SlBoY0h3Q3Nub1BqQ1hRWWtRME1iaURVNitodDVJb3paSTVHT3ZlRlBpMnlU?=
 =?utf-8?B?eUxLN3dEQ1puOGlBWU1IL2Z2TWUyeHl0TVcrVVBMRG10UmVNeURqSFR1M2ZM?=
 =?utf-8?B?cHBMeVoyNUNsM0VBNXRFb1Z6amFWNlJwekRIMnZlUlBBS2tqci84ZFNQRG5w?=
 =?utf-8?B?QnRSdVF5a3NzUXFEU3hFQzh5dEs4dVNEVStJR1JuWVFIRVFWT3hCVUhuMTgr?=
 =?utf-8?B?OGJ2WVUzODd2RU5xOU92YS92MW5KblV0cG9tNnZGeWdBenQwMlFpOUNkRHdn?=
 =?utf-8?B?eEpXakhJUHNDS0JRMi80aHJuWVljZFgxZjRXS2ZlbE53NERienZOa00xd3RI?=
 =?utf-8?B?VlhrRE9DZUVJTnJsM1g5eFZsWjZYc2R2SzdvbTdXeWRxdXM1VnpRYnpJN1dv?=
 =?utf-8?B?cjVHNUtaK1llMUVtU1FuajVuZkhTa0Y2RVdkRG1mK1JDSnRJekdtbWNRRXdq?=
 =?utf-8?B?ZDZaTThxR1hIc2ZIMjRjd1dzeWFJM0NKaEpxTCtYdTlPTnVlRkMvZi91aFg2?=
 =?utf-8?B?M1BMMjRrTExBc2V5ZWNtamlsT3pSYWVobWNpdmI5WXhxOGtKOHBFVXRzV2pY?=
 =?utf-8?B?d2cxNndMemplSmlDWUJRc0ZHUGE3Tk1MVmVobjllZ0RHZVVienVIYzFuNFJ1?=
 =?utf-8?B?THZNV1hDSHMvOTBGWG02Yi9KQ3NsUW1yeGozeTJkVFliS3cyTVRKTDFGWjlT?=
 =?utf-8?B?bDIrZjlkNU1oSm9ITENtZXVTZWVzL3RMK3FuQmh4dDNqaGwwTGZxUEI4Tzc2?=
 =?utf-8?B?SERzdjM5VDRsK01MeHZVTlBLYmdnK1d4Y3dNeVdBZ1pOV1pweW14WUhTVjEr?=
 =?utf-8?B?dll4bTJLYUIvTi9temNmREloQmdZNGtPeTJ0c0M2a1RwelZHN1BlQUNoUDB5?=
 =?utf-8?B?ckVKUm1iMEhsbmRTWkJ4YmhNNGtlM0FYbkduZ05FOTE5ZHA1Rjh4V3JEOUZn?=
 =?utf-8?B?K0hJNSs1SlhGQm41dzd5dFVDS2NMdGl3WDdQOWcrd2hmZlphTlRLeG9TUFgv?=
 =?utf-8?B?OW1tanNiMkI3VlY1S1FjVHFiMituRXN5b3d5TDJzbWlmakhIOWpHUS9hcHE2?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yDeDA7DxnEzOEwViiFUuAvvfDgXqZWZreKm4hEMAD0V5LllgfKypm8wqTTP9l0Fvdgrev7clQ33abwlZRnY6K1JD3excMpC/q//LoKB36VBhGjcatJRcnWglj8oM5opouKAkUfAr6LdQzwwfh4z/NDXyGyL6YkMQonpuHVKlTWrKEqzwJiH/DGGEQKmdRLCq1MmsvSvJub1D+5N8NjELBaMTbZbVeyRulifEQ8lBf6zQT3uAgSAZDbpwYaSMR9eIFCcf6qUlRs853qw6P7BFqNX6VvtCNTisL9B27jugBkf1mbjv53Rg0fQVJYAWRIJuyyDP0zfQP4OAk++YgMDdeSJ9Q6Bn7xtzpIJyXp3lSUWTabSnbEY76XAAYdVKG7STXOTLF2O0F+FBzUqDoxSdYt4W9E0jqwgGI2nutnItPF3a7R19psDer/Sa1fZbYwLFxuORG37bbaA0JI+a5o1ausL0kNx7IC4kAsif6l+2X/i2aNwozqD53j7D3QeZwziyBFsCsdBZo5fu057SEA+3qWdNnIZf6XQXNaCuWIUgog5g3HE7oKsg+yXauETeQukDWcwoUV/BybYFlJOYBh5glPVkE1ZYvX5Ppb4NMvR432gLgcMQ+T00QrJviCfSP//05yWZzWwPdImK0MnKhzx2aiGYthJUCDUBuz7KmtwPZnIAO+7r5hEPZtdEL+am0dNTvQ9zMkji7GeTVWjwUdjwe5ztjtoArRwthRtXUKu1uJmprhGXfuNnozjGtWJRQOcOH/LMyZt0mwz1/OPT6nd5q8wOPs2mBVVI56+wkBsKh62x/xmF65cAzXerNVPlllPx9NxKUOVTJEq0lG6idqcVMA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71c635b-b22d-4265-0085-08db7280887c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 17:54:17.6998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEBdyIKb1ZvTM2l0RgUj8WL7T7h0YZwsF74D0P9S3AWSLbIXoXr4nMXd0KZm/6JxyrkcK/WjlcArIjqsZuILV4cKVKzC3j0kvotGk6g738Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7138

On 21/06/2023 5:59 pm, Shawn Anastasio wrote:
>  xen/arch/ppc/Kconfig.debug              |   5 +
>  xen/arch/ppc/Makefile                   |   3 +
>  xen/arch/ppc/boot-of.c                  | 116 +++++++++++++
>  xen/arch/ppc/configs/ppc64_defconfig    |   1 +
>  xen/arch/ppc/early_printk.c             |  28 +++
>  xen/arch/ppc/include/asm/boot.h         |  24 +++
>  xen/arch/ppc/include/asm/bug.h          |   6 +
>  xen/arch/ppc/include/asm/byteorder.h    |  37 ++++
>  xen/arch/ppc/include/asm/cache.h        |   6 +
>  xen/arch/ppc/include/asm/early_printk.h |  15 ++
>  xen/arch/ppc/include/asm/msr.h          |  67 ++++++++
>  xen/arch/ppc/include/asm/processor.h    | 207 ++++++++++++++++++++++
>  xen/arch/ppc/include/asm/reg_defs.h     | 218 ++++++++++++++++++++++++
>  xen/arch/ppc/include/asm/string.h       |   6 +
>  xen/arch/ppc/include/asm/types.h        |  35 ++++
>  xen/arch/ppc/ppc64/Makefile             |   1 +
>  xen/arch/ppc/ppc64/asm-offsets.c        |  55 ++++++
>  xen/arch/ppc/ppc64/head.S               |  48 +++---
>  xen/arch/ppc/ppc64/of-call.S            |  85 +++++++++
>  xen/arch/ppc/setup.c                    |  31 ++++
>  20 files changed, 972 insertions(+), 22 deletions(-)
>  create mode 100644 xen/arch/ppc/boot-of.c
>  create mode 100644 xen/arch/ppc/early_printk.c
>  create mode 100644 xen/arch/ppc/include/asm/boot.h
>  create mode 100644 xen/arch/ppc/include/asm/bug.h
>  create mode 100644 xen/arch/ppc/include/asm/byteorder.h
>  create mode 100644 xen/arch/ppc/include/asm/cache.h
>  create mode 100644 xen/arch/ppc/include/asm/early_printk.h
>  create mode 100644 xen/arch/ppc/include/asm/msr.h
>  create mode 100644 xen/arch/ppc/include/asm/processor.h
>  create mode 100644 xen/arch/ppc/include/asm/reg_defs.h
>  create mode 100644 xen/arch/ppc/include/asm/string.h
>  create mode 100644 xen/arch/ppc/include/asm/types.h
>  create mode 100644 xen/arch/ppc/ppc64/of-call.S
>  create mode 100644 xen/arch/ppc/setup.c

This is a surprising amount of infrastructure.  I'm guessing it's a
consequence of needing byteorder ?

There's a series still out deleting swathes of junk in byteorder.  I
guess I need to kick that thread again, but it mostly boils down to
using __builtin_bswap$N() (and on x86, reimplementing them on old enough
compilers).  Presumably all versions of GCC (and eventually Clang) we
care to support with ppc64 understand this builtin ?

I've noticed a couple of other things.  asm/types.h repeats some
antipatterns which we're trying to delete for MISRA reasons in other
architectures.  I was already planning to fix that up xen-wide, and I
guess now is the better time to do so.

Elsewhere, you've got a number of __inline__'s.  We think those are all
vestigial now, so should be switched to using a plain inline.

Also, there are a bunch of UL() or ULL() macros which encoding a
difference between asm and C.  In Xen, we use _AC() for that, which you
can find in <xen/const.h>.

Similarly, there are some functions which ought to be __init, so it
would be good to get them correct from the start.


Maybe as an intermediate step, just get the infinite loop moved from asm
up into C?  That gets the stack setup, and various of the asm helpers,
without all the rest of the C required to get early_printk() to work.

Something we've been trying very hard to do generally is declutter
processor.h, and on x86, we've got asm-defns.h as a more appropriate
place to have the stuff which is expected to be common to all asm code,
and never encountered in C.

A couple of questions before I dive further in.

Given:

#define r0  0

do the assemblers really not understand register names?  That seems mad.

Also, given the transformations to call into OpenFirmware, presumably
this limits Xen to running below the 4G boundary and on identity mappings?

~Andrew

