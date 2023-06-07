Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169B7267F8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 20:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544958.851090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6xZw-0005H4-3w; Wed, 07 Jun 2023 18:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544958.851090; Wed, 07 Jun 2023 18:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6xZw-0005El-0t; Wed, 07 Jun 2023 18:08:16 +0000
Received: by outflank-mailman (input) for mailman id 544958;
 Wed, 07 Jun 2023 18:08:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E03=B3=citrix.com=prvs=515218b52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6xZt-0005Ef-UF
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 18:08:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42de3c2d-055e-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 20:08:12 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 14:07:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5718.namprd03.prod.outlook.com (2603:10b6:510:40::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 18:07:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 18:07:53 +0000
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
X-Inumbo-ID: 42de3c2d-055e-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686161292;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D78uW7GzEZhpHSkh+vvBdzahosiyg5WbVwnUC+OiwA0=;
  b=RlgXUJqtVdQm+KRnb0+YdLEyQ96cJ6yYVULVjINGH+CVE0yrEhden4P/
   QEDp7KvmNeqWyXRdydMA2nmw0XVq+85dIaOP8mslagL2LeKEGy4TfBMC+
   yT6fgdfuszGCeZdc2NB1I8ljbirPAsHJlcsr00356c1NhKB1nn45oDCuu
   k=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 110703816
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8Oeft65fRBS2FS4+AI7A1AxRtL/GchMFZxGqfqrLsTDasY5as4F+v
 mBMCm/QbveOZDT8KNkiaoni908G7cOEzoM1TlBprSE3Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 8YmCWEXQ0G/nt2V/bSqe/h925sjM5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+aF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLTOLgra4z3jV/wEQRMwQvDHzgnMKfpVCOd49dF
 FYlqgMH+P1aGEuDC4OVsweDiGWEtwEac9NWGvYm4RrLy628yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16q+ZpCmpPi49N2YaeSgeQA0K4t/urZsyiB2JRdFmeIa3hNDoHTD7w
 xiRsTMzwb4UiKYj1bi//F3BqyKhoN7OVAFdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxZkaFl
 GgJnY6Z9u9mMH2WvCmEQeFIELT34f+AaWfYmQQ2QMdn8Cmx8Xm+e4wW+Ct5OEpiLscDf3nuf
 VPXvgRSopRUORNGcJNKXm54MOxypYCIKDgvfqu8ggZmCnSpSDK6wQ==
IronPort-HdrOrdr: A9a23:glxx+q6et7Qn0Wn6rgPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:TB6R2GD+hSNQlZj6Eyddym9FAO10TmTi70rWMn6pGDs2SKLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Ai5uF0gwpWDWRYb1Pr/AVmZe5EOyaqKaVEXlUts4?=
 =?us-ascii?q?7gO+rKxxcZjWilgXna6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,224,1681185600"; 
   d="scan'208";a="110703816"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8uIS1YoGC9qxbavbVfEvtrXXtcS6OJB1KMXqOoQDMEgBT2Dg1T1ALxQQdr8E3MUFhlCO3aaBxIUjAGwqU/0TIjBkjyHJ4plvfhtdZi2kjh66H9tdSS857PcaZF6g32sgcvxxqO35Tkm3J+MoR+6ksGa01zyzVWvLuDt/jo0IG0l9Dse3tfWT/Din/AJGf1dGPaJegGARZxtTxP0PxQQ6hq11r8VIJyp7962bT+d6Z9gKkqy/wBkEpmInZrmVoPCCcwoc2fCbQuOy0YbJhWHHw81NEk57xdH+vi9eHK1MxxdNoqkDblvlhgAnS6wBMMH2SJ2r+19S5EFLm1WOqVbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vldaK20ltYy9hgaPKrVmj2hkVjXD0XLuGfzjcC48qMk=;
 b=dk6QXTdqfhhOPQ2MNYb491LosY5QfC1ChHQ/HN+iG7TeC2Zv5+7si7Wi9Isn2wg7bSeFNL7pknr4nOqTN8lG9XTFNn1v3aIXHA2ybjv747XnaMT+7j/u06F6YgQ3Vm0IU2cujHSLZ9is2+rtzsBaXS6KLvY9/8TC759wedbmGImua+MtkLrSfazoED7X0vTINTrkpZFn+/8sbdE5ySgriFhE5aIHs0+adr3BlK/UIV+TcPyoK2YjWWDLwYc4Cud5pfxUiNXH58bvhRFufrdxk9x/z1b7neyt1Led4J2dBHi7blQKnjK73qjz2gOUw/rLRz60FuHcYCyYfvyl2QeTFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vldaK20ltYy9hgaPKrVmj2hkVjXD0XLuGfzjcC48qMk=;
 b=CGjbnFe63g5gZoPWlUD3CpfA+A3ANG1WIp8ejxg6rCoX0csU6aL51TSGDZe+Z5vDUpSRC8u6baUWCRNPOx4Z56oBERvpsC5DT30NmySSxiGlcsLN5NQyxPZCyCeRvR6pqTKG7cqrT52zzgN1T9pGCCcCPrUzNkq/srBc349jlKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c1e75aaf-407d-6163-b382-b0c984e9db4c@citrix.com>
Date: Wed, 7 Jun 2023 19:07:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/3] Initial support for Power
Content-Language: en-GB
To: Shawn Anastasio <shawn@anastas.io>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1686148363.git.shawn@anastas.io>
In-Reply-To: <cover.1686148363.git.shawn@anastas.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0678.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bef3025-d6b8-4aec-3740-08db67821d1f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7/oD2Dl5/Rmwbbp8g/y/aOG3vKOyKjhTvCW5JvqSr9jwHtRW6PawANVxdVUxaMYw3TCgzXdyi2cfUrDIOizHNOyK/HPs5RF2ib3e55tzNjLBPlods6Hk4WXifs16mT1bF3ca9LtnMoyiY7owtLrm9/2WVrM8a995ztRrO+f9Fcx1m3KJNSBlvA0AcPT+oYAhjJ6ETAxXaWPcUn8YaoEW1Z1OLwfsMtWMKf61MABYM65hwbgxEmW1E2vnxtJ/rIB7T5CNZRaOnVM0duGhPaAsobd7Oz9DSag8MiTNLVbYd71BEvDABP+OWSB9KPxLc3EpVS3hSGPbyM+sfxHVmHdZ6nz2l8720Ht4q/84kgo7f7BEAqyiKekurh1fT6rzVh/1icbZQsJ0UZ4XK0cFoJqTHWERU6v7AEKFwiFsBisxK7imNgi6nPG0Zqto1yiOTjtyWzoa1IIgiRGfC8rAMpkOCfHTDX9Rupi6dWoPrOI0wd05qzsg8yNIX6m5zmkJE0JtnMn/tFlJW881C32pRfIaB88wANbqmZcsNHCZkAcEy5HMCFDTqlsDloxC5ay/2ywR8pVaKhv6P5UFQH8RyK0avHdy6IFSVQE06A4VLRWFA8ZEXBx9eC/GIxo303HJZrxtPysXGW4ev0J9zeZwjlGP/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(8676002)(4326008)(66556008)(66476007)(8936002)(66946007)(31686004)(5660300002)(316002)(41300700001)(54906003)(66899021)(2906002)(478600001)(82960400001)(38100700002)(6512007)(6506007)(86362001)(53546011)(186003)(26005)(31696002)(36756003)(6486002)(966005)(2616005)(83380400001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGQ5NGNjMUZNVDI3VGllK3NTZHkrbkI3SWxyNk5DN3ZqOElGaEhVbFVaV1VC?=
 =?utf-8?B?dGdqZHp5VDBVU1hqSDJIT3RQRndzMGZMd2Z4Q1hPTnkralY2c0lNbUp1c0dy?=
 =?utf-8?B?YnpMbC9uRjNNeFMyTTJMRk1KcXhqZFBBOVNDaXErOG9teHBlcFZ5emF1TUZ1?=
 =?utf-8?B?MCtNay91QTFUaU5tTDBob1ZSNElXOXZ5dC9HTm1mVURYNFFNVFJxZGhVUUlZ?=
 =?utf-8?B?b1YyTERIYkRMRDBJbGpPY3lkMGhaK0xJUzcvak5qOG9kY0tmMkw5Z0tpdWJr?=
 =?utf-8?B?L0grelFVbWNtaTlSOHJyS3pnUWZXWk0xalZnN2ptSmJLWUdiQkdIdlZOai84?=
 =?utf-8?B?RTd4eDU0eTRTNGk2M2FtQXl2eUE5UEtvdXNlSFVGWFJiMXFUUmo4S0ttVDVu?=
 =?utf-8?B?SlR5QUtSdGhVVS9ZSjRWYWpzL29KK1NLdG1qeXU4SGhnRTdGUm9tdDgzbjFs?=
 =?utf-8?B?WWh4eTVSQ0N6OS9peUFIc1RQWE1aUGREUy9GamxCOUFkQ1dVWGVJdXBBY0JQ?=
 =?utf-8?B?SXJ3UldLVTNlQmZFR21DeHlQMDVJdUR1YlhCL3hJQ0VJNUR3Ym5TbHVCMkFJ?=
 =?utf-8?B?Tzd6T29FSG4yem9aMzZVZ2lQMmhPZzZEdTJJMmRuaG1XK2lNU2RIbHk2QWJp?=
 =?utf-8?B?Nm1GTWVIS3FRdDZoOWFvRzRmS2lLOUpRTmdsQllHT1pOR01VU1k2QSs4ejBs?=
 =?utf-8?B?TUxWS0c5ZENaOU1VTkhnUUZKMXl2NUtnclZqMTJmajJvdnZQZ3lkTEszRjVn?=
 =?utf-8?B?L2NvR0VXaWhXU3NYMnQwc2VDYzMrdkxlMk5haGtRR2tMRktyUFFMRkV2R3VJ?=
 =?utf-8?B?eE9YdTlBS3FUU2R0dndZSXRLTGZNTzQzQUxTU2pJc0ZpYXFOT1dXMjV4T2Ey?=
 =?utf-8?B?SXhXUmVWczZXa2N3UEpkQ3NWd3Nna2llanRvNlMwdGdFMEJkZk42czdZeGV5?=
 =?utf-8?B?SkVIbG5GS3lsK3NsUjY5ZEtRWG4vYXJsTGkvaUZsdm9Pa28zRUFqZ2ljbHVG?=
 =?utf-8?B?eEpINitUNFlESnNxY2dNWHg4TW05N2JGWG1hYnlNLy9kcE11RHZ6cVQ2Q0VN?=
 =?utf-8?B?QnRLa1dub2c1aEJ6RzZpWkhTYUxKUm5RVWVBVUVTQ0NQQWdtdFM3ZmszS2xv?=
 =?utf-8?B?WHY4M2NQWGdNMFZQWkY1TTFkODNyUWprZlppWHZSQUNQK1lCN0dJUWV2VHdt?=
 =?utf-8?B?K3Q3ODBibWRpNXRyRkwrVVlBa1h4aTVZVXhLeDRqSThtQUJMVTl2U05NcmVB?=
 =?utf-8?B?SFVLN0p2OWhqcWl5NkU3OWwvMDFhUE05YWNBV0I1OUlFTEhqaGhxc0tnUTE5?=
 =?utf-8?B?T2ZGTVdzcVdKeHNpMnZHaXRrQnNCTWFXZTMzTGFVZ2diU1dheDJNSnRXMCth?=
 =?utf-8?B?M3h1cUhQVUxuKzNvNnl2NVQrSnVZUjViT1ZVRER2dTQzek4ybFdTdENTMnY0?=
 =?utf-8?B?LzMxYmJ1c1lUeDhSYTJZT0ZQS0xuT0VwVXd3MXA0UThkQzQ1OUNDeEtONm1C?=
 =?utf-8?B?eUd2bFB2RnNleGFqdTB1OGN2NE0vYnkyTFFrTHVreEwwRFBUa0VMQ09ZVm8r?=
 =?utf-8?B?bEhmZVR4bGEvb0o2c1BZallTU0cxMno0RFYvcWRYQWRtd0ZlcHVsaUJXR2hS?=
 =?utf-8?B?cklkdGx2RGZybFZOL2tTc3phaUtPTUpUQllocjhRaEwzOWJKbUFZc3JRenZv?=
 =?utf-8?B?ekJUNm53OGF2dDBiMTBDSFZheUd6ZFdCYWp5MGx6ejlkVXdUa2x1M2lqdEFj?=
 =?utf-8?B?UFU3dVpMWnRBd3dSTlUvcmxtZzJZT1FVV01WdVVIVjQ5ZHdqY3dJbnZzV1Bm?=
 =?utf-8?B?ZXgzTXZLNi9DUUpKMlduTHFLWGEwZDJoU2tQYms5bmtTZHRhcDltYzJqUmlk?=
 =?utf-8?B?bGVOSTF0cWpORmpyZUhkMWFlQmZybnVRQnRkbEM2UzJDSDBNek9PdnIxUnlo?=
 =?utf-8?B?QXBMNVd6czgwQnNlOGZTOVlUbHF0YmdYbkFlM2dsRGw2S2drVnNqWU44RjdZ?=
 =?utf-8?B?bHBTWjI0QVdWbllFZjR5aXhJTjRDV1hlYjkxRFhDTlVqejhhV1Q1eERtYXpk?=
 =?utf-8?B?WkhKSi9ua1lueGx2OVZhVkh5MFc4QUlDRG1jNy9xWjBQS2R5TDhVak5XeGsw?=
 =?utf-8?B?L01wOUkyVmY0aUd6bVJrYWRFODYzdmpkRGorcWZRK2tpK0x0cG1BQ3gvZGg0?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?V3RkN3B3V3BJcDVaQ2lUS3AvV3grQU5NMllWUHBOMjFjZlpTb1dEN25xWjNX?=
 =?utf-8?B?TTRPczl3bzBCR3VLaWp4SVlVTUhFQ1Exa2ZKbVNGZXB0Smg5UnppaVdQN2Er?=
 =?utf-8?B?ZHdtQ0ZWWVhjMDlSR2lsUGk3eWhJSXViVWFGZXZvbG83VE55ZjEvdFZZZi8y?=
 =?utf-8?B?RlUvc2ZJMnJodldWQmdaclI1QmljR0MzOFJEL2loL29YcXBCZ3VXUGRyelRD?=
 =?utf-8?B?b2pvamJIdmdyZEJNKytIYjhZLzJ6MFNVMHZ0Zms5WHE4aUlzSUR4TWxVZyt6?=
 =?utf-8?B?MmpNMHZNdk5RQ2FpM3NJYkFwcWJJNXMyWSs2cXkzL2lGMkNrSFlickcvdmYz?=
 =?utf-8?B?UXc3VzFSb1pveEo5N09PWForbDhKWnptL1U5dUlyeDNjeHZRWVFnVEZiOTBU?=
 =?utf-8?B?a0NIWEswN0l5Rk0zWEVjWFVjeXRNS3g3N1FOTFFNbkQxWVdwbGRpRGcySVBk?=
 =?utf-8?B?YlYzS281cTdOWHVLM2g3SDFnYkFkalhveW83TGRXL3dLbTIwMWlHOEErRDVZ?=
 =?utf-8?B?SHRha25rdjRoc21YNFZIQjRVOEpqaGFvSmJIeXoxM1BVWVNiQkEvQStheVg2?=
 =?utf-8?B?eTE2SjJNQm9vbjlIOUtydFFLUU5pOVJOVXhJdGgvam1ycHZDdzZKaHh0dmtU?=
 =?utf-8?B?SjZXMUZTdmFtZDY0b01TTm5DSE15NGhXdERibHptM0tIVEpoMk15cm5KSFVM?=
 =?utf-8?B?MWh3WEhXLzQrQ1Jzand0SEVocXhXbkNhcWI4OUhhSEhVY3d3Q1VWY0NrbnNm?=
 =?utf-8?B?VU80MGZVeHAycmtuZzl2dDRTS05tamN1b1NGckJQUG9hQzFmemZ0RFpHeFdy?=
 =?utf-8?B?QW9NTkwwSU5idkZGR2t5SzFRTmVqamNMM0FVSFpzU0huUHF1eCtjUjRHL2FV?=
 =?utf-8?B?dXBvSWV3dFRXRUdxalNnOXpOZTB2WHlYWmRwK0kvT3doSTUzYXBmek9tRVl2?=
 =?utf-8?B?azNkMkVvT2lEOEx2d0JFbzNXVS9hQysyYmRINFE3dnNnTVpHMzJtR3lsVEVQ?=
 =?utf-8?B?ekM0WGlWa3ZZR0owZTY0VG9jOEJjbVJoVWRyMzNVOFhOeDllOWF2aS9ZczVM?=
 =?utf-8?B?ZkNVdnF6NUIxUTJkRHY0Wlh0ME5YOHliZlVsS0FldjZJSi9kaGIxbzZRTEkx?=
 =?utf-8?B?d1loTDF3UVpONHdRZlZwMmZWVXJnSWlDbDl5cEx5SVprVFphckpnMUNiaVpn?=
 =?utf-8?B?WDRJckVBTE9pSnI5cnF1ejJBQTgrZUpweFc0bUlqVlA1L050blFMWis1TlVi?=
 =?utf-8?Q?O3k52ouIHIUmkef?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bef3025-d6b8-4aec-3740-08db67821d1f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 18:07:53.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HRVm4N1ZGgq5kqxUol651BS36r+0bHmMvoZoxnbCCUcrJPK2l4kSL6+J5uINUbbfcOyxFyvryq/Zlhybve3fp3YSkcCkxIY5pPsVKGCeg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5718

On 07/06/2023 4:06 pm, Shawn Anastasio wrote:
> Hello all,
>
> This patch series adds support for building a minimal image
> (head.o-only) for Power ISA 2.07B+ (POWER8+) systems. The first patch
> boots to an infinite loop and the second adds early serial console
> support on pseries VMs, with bare metal support planned next.
>
> Since Xen previously had support for a much older version of the ISA in
> version 3.2.3, we were able to carry over some headers and support
> routines from that version. Unlike that initial port though, this effort
> focuses solely on POWER8+ CPUs that are capable of running in Little
> Endian mode.
>
> With an appropriate powerpc64le-linux-gnu cross-toolchain, the minimal
> image can be built with:
>
> $ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
> $ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen TARGET=ppc64/head.o
>
> The resulting head.o can then be booted in a standard QEMU/pseries VM:
>
> $ qemu-system-ppc64 -M pseries-5.2 -m 256M -kernel xen/ppc64/head.o \
> 	-vga none -serial mon:stdio -nographic
>
> Thanks,
> Shawn
>
> Shawn Anastasio (3):
>   xen: Add files needed for minimal Power build
>   xen/ppc: Implement early serial printk on PaPR/pseries
>   maintainers: Add PPC64 maintainer

Oh wow - this is a surprise, but certainly a good one.

We've recently done just a similar exercise with RISCV64, starting with
getting cross-compilation and a basic smoke test into our CI.

We use gitlab CI, and one example is
https://gitlab.com/xen-project/xen/-/pipelines/889871648  (search for
riscv64 in amongst all the x86 and ARM).

The configuration is all in tree, in the automation/ directory. 
Relevant files to copy/tweak are:

automation/build/archlinux/current-riscv64.dockerfile (x86 cross compile
container)
automation/scripts/qemu-smoke-riscv64.sh (smoke test script)
automation/gitlab-ci/{build,test}.yaml (wire the jobs up)

The smoke test looks on stdout for "All set up" which can be any string
put out via earlyprintk.

If you look around in the Xen tree at bb62c25e3e5c and take the makefile
override's in particular, you should be able to get `make -C xen build`
work without any magic TARGET= overrides, and without most of the
headers you've added in patch 1.  The trick is to have a head.S which
doesn't include any files (except the config.h it gets implicitly).

We're still trying to do some re-arranging to the common / arch split to
remove unnecessary boilerplate.  Having a set of PPC headers too will
make it easier to spot the rough edges in the current boundary.



Looking to the future, where could XenProject get some real hardware to
put into our CI systems?  We'd want to do that in due course.

I see you've nominated yourself as maintainer, which is of course fine. 
How much time do you have to put towards this?  It is some part of a
full time job, or just your own free time?

Do you have any suggested reading for those of us who are invariably
going to need to learn some of the CPU/platform/architecture details,
but aren't really PPC-literate right now?

Thanks, and welcome.

~Andrew

