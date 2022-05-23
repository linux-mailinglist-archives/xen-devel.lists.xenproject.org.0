Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C6530C7A
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 12:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335729.559910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4sd-0008Nm-KC; Mon, 23 May 2022 10:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335729.559910; Mon, 23 May 2022 10:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4sd-0008L0-Fu; Mon, 23 May 2022 10:01:39 +0000
Received: by outflank-mailman (input) for mailman id 335729;
 Mon, 23 May 2022 10:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1/tb=V7=citrix.com=prvs=135606018=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nt4kd-0002dq-3y
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:53:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c3b21ab-da7e-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 11:53:20 +0200 (CEST)
Received: from mail-mw2nam08lp2175.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 05:53:17 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5465.namprd03.prod.outlook.com (2603:10b6:806:b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 09:53:16 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 09:53:16 +0000
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
X-Inumbo-ID: 2c3b21ab-da7e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653299599;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Er/yBhvdJArxp83rPCJMWsmhZ3OweLmcLpFTR0wi1tQ=;
  b=N4WiuYFm/rXL742NMTt0XUrSevf4krnZc6Zr0mQHzGe9ln5L6DRIS+iK
   OkJ0VVQKGZaN4K7GOgxYpGeSfDpjNvKgnP4bPAeW3uZD3icUSUADigS9A
   JqujFEloREFaWKwlpGbZ9XGieEjiHlKfmiCwt84ylkZfBEYNTH9tWlDqe
   Y=;
X-IronPort-RemoteIP: 104.47.73.175
X-IronPort-MID: 71925730
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ohoxMKOGqBtUWGnvrR3RlsFynXyQoLVcMsEvi/4bfWQNrUp0hjQEz
 zNLXmuCPP+JZ2L9e9x+Pd/ioUIBvMCDn9VmSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2NUw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 Y1nt5OsdFwQMoboyMg5XjNXSBgkIvgTkFPHCSDXXc276WTjKyep5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB5GtaaHPiiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33yilLmID8Dp5o4ILszHOxU900IPoPeDPOfCaYP1aglyx8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZ1hHWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsg/IHc99ZEul/7R7XzKPRu1adHjJdEWMHb8E6vsgrQzBsz
 kWOg97iGT1otvuSVG6Z8bCX6zi1PED5MFM/WMPNdiNdi/GLnW35pkunogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:mrUe5KrEpawGKvaUKnfAzS4aV5oleYIsimQD101hICG8cqSj9v
 xG+85rsyMc6QxhP03I9urwW5VoLUmyyXcX2/h0AV7BZniFhILAFugLhuGOrwEIcxeOj9K1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71925730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjDdiOc5XEQUztzyNF5Udn2UEgguxaPPh5RCX1CZNUROory2xNdP98RzlAZyUbWy6sDvg/4pymkQ6n73t9XzT1g+mJypnqrSxHwGiLlElQcWSPN1/nMP+wZBRgoWeKxMFoVpcZRhovIFLV66Y3N8wbCOAwA7WzJ51qUDPh/hw7a+n943SSECdOvkivgmCOdaltSgG/PXMkczEnsRVVhiQjFdGmlAGGi9r7mYJGGR7erhfwdt9yVObqwHR1Be99cH8usjcNAw9RqhAQ8h9bZ0EdN3SBDXOBv9E8Zal3IiGqChI3QKMZ0jyefWqZ7v32dXU9MXPfjkbcH70zacm/thcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hueTV5O0UHuRLSL6GaRN1R2ZatIg17psVt+HIchGY4o=;
 b=iyf3Wk7xzIZrpc94ooDkzsJX/lv14rVhRaW3DqDOI9NG25Gf/zLtukVkMc1GZ/jiocUMeD1AdGPP7/vLQg0Q/Rn1AvZKZh0ONeOB04LSawi2gj834GBYhXXma1EiS51fJ0HB1PJXIIcnnniUYHqpiyEChlPKnIsMALUAzB2piX6wHe5aB49Ky9+NX9S/NUM6NkckAZgxlLhvBcW/aLk5A2VM9hB6lALD7sGTTw7UHiM9Oy07U4Tf6K8HjwGzOtlFFKtIJEYAQ5ud2qMe4thTSH2n8Y3NYRgDqMILzNBANWFqewFWfR1rNNbRfuBgw/jpAnt4fiwi5n6Rc0Xlr206vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hueTV5O0UHuRLSL6GaRN1R2ZatIg17psVt+HIchGY4o=;
 b=RJjYSe8/Al9IC9Q4SxelK0z1J9nT8IJb/MGhyhO5d8lqx+RAcFj8yyAR4AYFADDmyOB1oaGpFph790oEySoxZmAfB0eEdCIHEdK6U/k/Np2g4Df12Jd1RZQLp8OYc7k/LTHc1tJ2f/+NOWAYX2L7b/tTAkc7RDBp2eYJYcAM4oE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 May 2022 11:53:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Message-ID: <YotZiM5ViiRKSUXh@Air-de-Roger>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-4-roger.pau@citrix.com>
 <33632dc6-940f-6737-c808-48e6c28fc0bf@citrix.com>
 <42cac54e-134b-dcfd-3ce1-1d6bfae9176c@suse.com>
 <e4d202f7-f4db-71e6-46a1-ee62ef41f2dd@citrix.com>
 <5330ca97-2b72-409e-c021-61ab4356e051@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5330ca97-2b72-409e-c021-61ab4356e051@suse.com>
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0f31213-1be0-4b5d-7327-08da3ca20ef5
X-MS-TrafficTypeDiagnostic: SA0PR03MB5465:EE_
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB5465ED6A6714BE7FE13631658FD49@SA0PR03MB5465.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WzrvBS03KY7erswSgCR//c0lkg66CJYI3hThdAJNH4FlyTCxKMlnbC0YnF1ve+AKvOftzaVb5cx72QHC5igl0SyTD5nOxYSRWcg0w67jYPBR6xNgHzUptJcAyTWVB4PzXYEIBtwbvYLpEYC8jAuvjtnvloc8iKNTfNmEjKP4bhcnXfQkPXV8aczZAZolpPc26CJLFLQ37iT8ROmqcbQ/dBWLBuMgAv8HRkpw7aAjjbDueNvkecmPabDGb8oH3T84eiJP+BRnIni3nSRfTl5DPNOq7EmjR9t7tCy4WWuiA3pJq9sDf5zni4UBgYlSCK8Du5iYGWREV/bfdo33OV3Yn75VSVbCdt3gJzzwbapZ2f9R9/EGv2Yu3uG95pHy05vu+grWiHPTuvDExsuD+nU1laZsj93cvgWbblfmNUxzh6EnLBdNJXODID/t/9nuim4Rn/SlU1C4G3yhsqsmpmEyDGYdH3L3ba7lQLJ5xx0teIbHXc1yAbMB+Hqi+5oi3lx8NIc2UFOuhfZdyNA2oQCEEvOvy/DVWtk73FYkw0Jn5F5hKiFuKcYcEY6MSyb5ueI0eLT8QOdJnQ+K4D55b9EneoAgSmpRzCspMvn2y+OZaJ+hOAygCPd7TpBxC6AfzCnYV618Y+n1rT8u2nvbcYqhcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(6916009)(6512007)(186003)(6506007)(53546011)(26005)(9686003)(85182001)(508600001)(6486002)(316002)(83380400001)(2906002)(8936002)(5660300002)(66946007)(66556008)(8676002)(4326008)(66476007)(82960400001)(6666004)(86362001)(33716001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmtpQzZ3VmJzdmMzb2d5VFVKLytTM1NkQzVYUFZxRE92aVdJL24zSVZTa3Vu?=
 =?utf-8?B?eHVMQ0N6NTlrNW81eU5mdzlhR3hKOXVDQW9nMk1NbWUvQ2Jad2o4RGh6S3U0?=
 =?utf-8?B?SzNzeHJuNE5LWW9ONFNCZ0wxNlg5N0hoTHZXWFNBSG9ic1prZFNLUkF3Vm9r?=
 =?utf-8?B?VXlmQ0gwV25uS1plZHAyVVAyNHdiOU9wOTVjV1lyM1pCVFdjRCt1dCtXT0dw?=
 =?utf-8?B?ODc0YXBzOFppNWZNTFNSQytnRnpTOVpXTFlGcU4xM3lVdFJrVnMzTE5JRXNh?=
 =?utf-8?B?SU1MUzZKZjJFN0k1YkFYeXF1eTkyczJ5QVdpVHA2V0MrbG9vYm1hU3FPVUFv?=
 =?utf-8?B?b2t5TnlJblhKSnNZVzg0RytlYnZIR0RMTFU3VUdWVDQ3NEFpNW1mVVJhWjBx?=
 =?utf-8?B?TlNiN05LRjhMa3FMd25rVloxb05LRnZaYlRhSjY2VmRZNkxyeGllbEY5OFFZ?=
 =?utf-8?B?ZVp2QVF3eHByNVdPNjVKS1IrVFkyeDBGR3I5YVFtQnFIYm03NEptYVR0c0R4?=
 =?utf-8?B?Z21lNmtMSjVEaFVmSk0xSndYM0Ywc0lUT0lpWGxRWGpPODhvZmxNVkhodWh0?=
 =?utf-8?B?YnI2ZSthT2pma3hIV2wrNGRNU2h2ZkVJZ1FNZ1lJckFKb0NJeG5LTm41Q3dB?=
 =?utf-8?B?Qzdac3hxVXpUK2FCTlFHN1EvUHBHNExVcFdaSHFVMS9ScWM0bFlwQ1ZtZFZx?=
 =?utf-8?B?Q1RmYjJIKys4ZTh6M2QrT0Vac3YxQjhVZEhOTTJ2cXFheXBkMXFyYlRaSEFh?=
 =?utf-8?B?M1N3Uno3dUQ2ekV4aGdiL0RMaVVtNSt3czhNbWpYSkVzYzBZT0t1bWdZMktQ?=
 =?utf-8?B?VVFXOXAvSUl1R3lqUklDbWVPTktlNmtPZ1ZYbEE0VDBKblRxdmQyeGFLWXpr?=
 =?utf-8?B?WTgveXptZGZNT0lpcFo0NFRZZlVKY2Q5UHZTS21lYXA0WTV0MmVVWGRFRlpX?=
 =?utf-8?B?aU8wSmtBV1BwMzJkRnlCQVZUZHNRMzJJOGw1T1p3cTBHZG9uZlZDMkhkWEJJ?=
 =?utf-8?B?MUxlNk9Jd0Y0QktnRm56VDU3a3U4cXlveW9SRDVFSVJIQmY3MG43aG0vcXNQ?=
 =?utf-8?B?Z1ZzTmlVWSs0dXNaWXJlTmdNeFhYTUlyWTRYVzR0eStjTldHR3NlWjRrS3hk?=
 =?utf-8?B?ZUE2QnJvbkJnMHkzcThqWEM4ekR2N3NPQ1VacEJhRGpGSTJDSXFIdzl6TDhS?=
 =?utf-8?B?S3crN3l2ZUI3M2ZkYVJRanJ6bHpBbnUzLzNHVzRubGhVdTBYRnVmZ0VmL0dr?=
 =?utf-8?B?dEZCZ2xkZllQY0lXOUUxaDhDd3VIWlBmdWpRdDd0UStKZ3hoVVNQTTlqcy80?=
 =?utf-8?B?WkhCQXNGYm9haFhPNVFNZ0t0SUpNNjI2RG5nMGc4d29odVRIdzR1WDVYbUZl?=
 =?utf-8?B?YjR3SWtzNXQyb2tZQVhpc3dyYjRHcXFYSnNVeFpvWEJmTC80WlppV2MrNWQw?=
 =?utf-8?B?Tkc3WDhsT0NKT2tCamhVQVYrRDVVSDF0MDcvREdEMTNFdWpDcTVqcW4wb1Fl?=
 =?utf-8?B?c3hMdWFTRHVIN1owdW9ZVzNmRUc3UHpQMVBQTXpRaGt0Tm5tUEVDWHlpb2tG?=
 =?utf-8?B?UTlSUjl5dEg1MEZBMDRzdkkzbEdnejFRQlVBQzBvYUY0RGdZaXJJMEFialZy?=
 =?utf-8?B?RHF3NWhNWFBVaCtuMTdRY1dJUzArQ3hKMC9OMmZ5MGZvblhrVUlnN2U3ZkZT?=
 =?utf-8?B?TGl5b2N5dnBHUzN5NURsZEt4dUhLdEpVSVQySTc1UlhaSGdLdW5KQUFHcFRy?=
 =?utf-8?B?K3hXNnR3d1ZrN0RhZEhSakNRRjNvL1ZKNXQrMXhqYXBKbzBxUkE1eUpCMVRo?=
 =?utf-8?B?MWg2YWpRNVVXWHUrNDJGWmJHMyt5S3RXU2JkY1U2RnF5Q0dFQUpKNmw0TWRM?=
 =?utf-8?B?WHBRR0JzOGNSRUFESkxxRXkySHM5T0E5VFQ2djk2ekZCeklzSG1udGVYVFQ3?=
 =?utf-8?B?OVg3NGdXWSs2ZXVVaDRybElOM1k2eGU3MDNwdjBoS2FtMEV4UlFHc29pbk9G?=
 =?utf-8?B?U2U1M0VoUEhzempPdGVzK3NQWC9MaGxLVFpOY1JHSVNsY21oTjhJelpvbHVn?=
 =?utf-8?B?cFdqSjByci9IQm1oZk9SZThEVGFZdURQem5OL0hyMEhQSWtVTW9tV1IwZVNL?=
 =?utf-8?B?bjJuZUpQUlFIMUlVVngzRlpRK2t2WHpCN0p2N3dyc0dlcVZVMldzeXpXeG0y?=
 =?utf-8?B?K3pTY2VvbE1SM3AvL3Q4aGwyOEJoNXZDb2tNZmF4Z2wzRzA1K2tDcUQwd2xE?=
 =?utf-8?B?ZDQ5ZFd3bUhKNnhGZDRMRHVpM3VYMTlrSTAxVE5BdXF5R1Z6L2dDUHJQc1Zk?=
 =?utf-8?B?bEc4Z282RU90NU12S1ZMc1Mrek1uNnRCTzFkSmRZckk5ZEk2N2hrS0NIdklR?=
 =?utf-8?Q?Ww+UA2kUKolr1dno=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f31213-1be0-4b5d-7327-08da3ca20ef5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 09:53:16.0907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5oNoZ4t6S+brlPyA52XsEu0D2mmNCsB4IfZvl99AM4e5Z875hK0nqgNpVKmihpaimVb5q9NyQEqYotcZoNGYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5465

On Mon, May 23, 2022 at 10:12:55AM +0200, Jan Beulich wrote:
> On 20.05.2022 16:58, Andrew Cooper wrote:
> > On 20/05/2022 15:19, Jan Beulich wrote:
> >> On 20.05.2022 16:10, Andrew Cooper wrote:
> >>> On 20/05/2022 14:37, Roger Pau Monne wrote:
> >>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
> >>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> >>>> @@ -135,7 +135,7 @@ XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supplemental Streaming SIMD Extensio
> >>>>  XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
> >>>>  XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
> >>>>  XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messages */
> >>>> -XEN_CPUFEATURE(PDCM,          1*32+15) /*   Perf/Debug Capability MSR */
> >>>> +XEN_CPUFEATURE(PDCM,          1*32+15) /*S  Perf/Debug Capability MSR */
> >>> This is the bit which requires more toolstack logic to safely enable. 
> >>> Using 's' for off-by-default is fine if we want to get the series in now.
> >>>
> >>> But before we expose the MSR generally, we need to:
> >>>
> >>> 1) Put the configuration in msr_policy so the toolstack can reason about it
> >>> 2) Reject migration attempts to destinations where the LBR format changes
> >> Since this could be quite restrictive, and since people needing to know
> >> they need to hide this feature for migration to work, I guess this would
> >> further want qualifying by "did the guest actually use LBRs so far"?
> > 
> > In practice, it's every major generation ("tock" on Intel's old model),
> > so isn't actually limiting the kinds of heterogeneous setups used in
> > production.  (Migration gets steadily less stable the further apart the
> > two CPUs are.)
> > 
> > As to dynamic, no - that would be a security bug in a cloud scenario,
> > because there must not be anything the guest can do to interfere with
> > the manageability.
> > 
> > Use of LBR is rare, as demonstrated by the fact that noone has
> > complained about the fact that migrating such a VM will malfunction.
> > 
> > As we now have a way of reporting "no model-specific LBR",
> 
> Which only rather new guest kernels will know to look for. Hence ...
> 
> > I'm tempted
> > to suggest that VMs get no LBR by default, and someone wanting LBR has
> > to opt in, which is also an explicit agreement to the migration limitation.
> 
> ... while in principle I agree with this, I see a practical issue.

I think it should be fine to expose no model-specific LBR support in
PERF_CAPABILITIES, but we shouldn't change the behavior of
DEBUGCTLMSR.LBR exposed to guests if the underlying platform has
model-specific LBRs and those are known to Xen.

That way old guest kernels that ignore PERF_CAPABILITIES.LBR_FORMAT
will continue to work, while newish kernels that check the format will
avoid using LBRs.

In case we introduce a guest config option to enable LBR, should we
then expose the native LBR format in PERF_CAPABILITIES?  Or would it
be better to just keep the current model and not expose
PERF_CAPABILITIES at all (and don't report PDCM in CPUID in that
case).

Thanks, Roger.

