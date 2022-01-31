Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7734A443C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:28:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263008.455531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUqf-0002eP-UK; Mon, 31 Jan 2022 11:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263008.455531; Mon, 31 Jan 2022 11:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUqf-0002c8-RJ; Mon, 31 Jan 2022 11:27:53 +0000
Received: by outflank-mailman (input) for mailman id 263008;
 Mon, 31 Jan 2022 11:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEUqe-0002by-T3
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:27:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d27265a9-8288-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 12:27:51 +0100 (CET)
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
X-Inumbo-ID: d27265a9-8288-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643628471;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SEzLHKKDlfMYNu/2+VcZV3HPKBvrcA72pAvgvP9zg9M=;
  b=JdBYnLMleU1kdjlxiTXXDiGAcxPIl0HprZ2v6rg+d7yiCTVzsLWhhaOc
   juQtDTlYOnVzs/m+S7mYMiZAeFSwVluellu/iWH8rs1gjEi4zWuToBiwW
   /JE8dQz7jjbdaLXb/01yBdS7NLOB8vR8k5uvEHW+ZMmPUocknlyPxOwXS
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RoIYAWQB8g5cy/2vulw/TtIpwO5xoK92KLDb0LCpslVqWJxmPvIEgxDRxGkwJLSrlRsiEBOk2D
 m/1cMplfmYiDQ80dcE3LIvCYcJaRtWtSRbJQm0T2ikc/YyK0135JPPfS3/G76Zk6/DPBYMNrsk
 VnjJYcJrMADAyPtNS+5ZFB+r2YINoZKcIuFBC9q3JXZaKbdtIz3WyJFqUqJz4f3rbXaPDnY+V0
 EUz7PgYqrOuL6unTZ2f/loCcTn2cx2nZ74NOv21bGH4Bto1ICWaAxo+WcJ2ayvWjS7gqxI6jU2
 Cjw1DzzaWa8hF91ZZg3bp8U1
X-SBRS: 5.2
X-MesageID: 65297471
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2OZJWa7Vrm9e2YvRvveKlQxRtAzBchMFZxGqfqrLsTDasY5as4F+v
 jRLUW2EP6vZYGamKdBwOY60pxxSuZfXm4NmGQA4/ig1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2dcw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 sRXkMSLUikTEqD0hv1DdxxnEwhgIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmpq158SQq+2i
 8wxZjp/UkufShJ1E3g4GIsVrcXw31aifGgNwL6SjfVuuDWCpOBr65DEKsbYf+uvVMpcn0uGj
 m/e9mG/CRYfXPShzj6C/mOpl/X4tyrxU4IPF5W17vdvxlaUwwQ7EBQLUXOrrP//jVSxM/pFI
 kwJ/mw1rK499GSiVNy7VBq9yFaOswQAQdNWH6s/4RuU16vPyw+DAy4PSTspQPsiucwtTDomz
 Gi1jsjpDjxitr6SYX+F/7LSpjS3UQAXJ2IfYS4PTSMe/sLu5oo0i3rnadJuE7W8iNHvLhj2z
 yqXtyg1h7gVjskj2r2y+BbMhDfEjojESEs56xvaWkqh7xhlf8i1aoqw81/Z4P1caoGDQTGpp
 2MYksKT6OQPC5CllyGXRugJWraz6J6tMiDYgFNpN4ks8XKq4XHLQGxLyGggfgEzaJ9CIGK3J
 h+I0e9M2HNNFH27d4ovWJmfMegn9bb5S/DgafD9cMUbN/CdazS71C1pYEeR2UXkn04tjbwzN
 P+nTCq8MZoJIf85lWTrHo/xxZdun3ljnj2LGfgX2jz6ieL2WZKDdVsS3LJihMgd5bjMngja+
 s032yCim0QGC72WjsU6HOcuwbE2wZoTWMqeRy9/LLfrzu9a9IcJUaW5LVQJINQNokitvr2Ul
 kxRo2cBoLYFuVXJKB+RdldoY671UJB0oBoTZHJwZgv4hCBzP9fzvc/zkqfbm5F9roSPKtYvF
 5E4lzioWKwTGlwrBRxABXUCkGCSXEvy3l/fV8ZUSDM+Y4RhV2T0FizMJWPSGN01JnPv76MW+
 uT4viuCGMZrb1k8UK7+Naz+p3vs7Sl1sL8jBCPgf4gMEHgABaA3cUQdeNdtfZFVQfgCrxPHv
 zur7eAw/LeV+9FtrIiW1Mhpbe6BSoNDI6aTJEGChZ6ePijG5Guzh4hGVeeDZzfGU23ovq6lY
 I1oIzvUapXrRX5G7NhxFahF16U764e9rrNW1F08Tn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0a1GkDfl8vlocl7x4zV6/eTbXBwKbQWMkiFUMJB8LJghn
 bU6oMcT5gHm0kgqP9+Kgzp67WOJKnBcAawruotDWN3gixYxy0EEapvZU3ek7JaKYtRKE08rP
 j7L2/aS2+UCnhLPKiNhG2LM0OxRgYU1lCpLlFJSdU6Untflh+Ms2EED+zoAUQkInA5M1Ph+O
 zY3OhQtd7mO5TphmONKQ3uoR1NaHBSc90H8lwkJmWneQxX6X2DBNjRga+OE/URf+GNAZDlLu
 rqfzT+9Azrtecjw2Ao0WFJk9KO/HYAgqFWalZD1BdmBErk7fSHh0/2namc/ohf6Bd882R/cr
 u5w8ecsMaD2OEb8eUHg51V2AVjIdC25GQ==
IronPort-HdrOrdr: A9a23:KUZuha/Wp9M5DHbDxVpuk+DhI+orL9Y04lQ7vn2ZHyYlFvBw5P
 rOoB1773DJYVkqNE3I9errBEDEewK+yXcX2+Is1NWZPDUO0VHARL2Kr7GSoQEIcBeOk9K1u5
 0MT0AgY+eAamSTxKzBjjVQuexQpuW6zA==
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="65297471"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/nNh0XYppO+b8+hXEvu2zGZY9Qz5FwBy74Fsq1jCePBOJNyr6ePhyxBjYYBpgokWnH3kLI+l0e/GONAzL+nibzwjaVDOEOf6lPSbRuPCsB3xmpDK7zbqidspyQYMHUu6hoxurTjqVJPFez4Xt5MHfEjTTzrnvLvM1JwV5MYam9nvlJ8RdsEBzaYPRCSfGxcMgtztOTmida1K1M17jjJfra2dhjZw/zHpe9dneh3ppxH+nl+XuPkh/I+m6vxmVc1EHiSimH3PGt91TviHFvmOotV/TGsy569JS2SaZNd8KKSNtVTSYBqoXNFwGXtydDwS9qJ+tkxWHG4fd6SN2dLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfZIS6fa6niDjeBcq7713O/YnxTPZAggOnpIc0e2qoY=;
 b=HmdDbrDDuqbn61W8SXyK4lwQgmK+Bzv6D4i4jt/0JTV33Erhok/947rGmARkqyeY9Ose8bwKMeuHbFYdgTqH8mr6aix94shhIQEahlavW+EFpDVWrZ3Ut/XfCsuVl4ILi32bCStUUUlJgqsc3fOOUinPi6wCWNo5L/DoRfLkEk5es56PhxMxyQNX2gCPmqEfuCQFM5ZSgySLINimW+MSvh9pwoumYUUITqG1NbmxE0Af1eGK0lcZg9Mk89vO4ufp9W97o4Ps9N2Qq2kFyqGP6aeGdzBYfWw8FkRH0X8NNRV2lIA1dElPRpIwGRhqzPwixxXCE47NWDILkbzHUqJGEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfZIS6fa6niDjeBcq7713O/YnxTPZAggOnpIc0e2qoY=;
 b=hN+7OnwXevh7XJiEoLAjDd+K2IH+x5GvJWwX3bwUvsZhp3yLEURmF5CsHVxTV09Y0eMHDS6gDAcMQDlfXamoesEp16MMeQuNbsG+KXjL0wmm3ZFI91Ss1wjByQUc1A57DiRCMRyONQwO90/xTCq4ztWZb9ulFstXoAcv9S4+kEY=
Date: Mon, 31 Jan 2022 12:27:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Message-ID: <YffHq2hjpakgdhQb@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <3db8d85e-4b9e-ed0c-5053-cc953c835efc@suse.com>
 <5de61dc5-0292-de1b-fad2-aa99d5351043@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5de61dc5-0292-de1b-fad2-aa99d5351043@epam.com>
X-ClientProxiedBy: LO2P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff5cfb6b-bb68-4b79-62a7-08d9e4acb35f
X-MS-TrafficTypeDiagnostic: CH0PR03MB6049:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6049F7E0D9844E792DA8CD038F259@CH0PR03MB6049.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IB7IqIjdRckZIdtb6iHbdxv6BzYv//t14RmDQV0AQYTZAv7w6OHz0wJt2x+Cdw1UvB5v+V+VEXqjcJ1RYb2kM69UH8boDMC1aEYcsL+2PAaaNIjFrBZrbm/cR8rrOdpG4Ux9unkYOQsoID0sT53pgM6/gFM0F+L0Fpwk7NjFZ7maM/2qn5maWQuOcEOywaherT35/SY/PgXOB7RCfDv70z91dMpuHuAvxWmcuw4ndDERwkIfjI+6yKmzYHKcJA96z7MyrXDA1GktljaYPM2sJ9IbxrnuWs7BgAmU4PJkV1Qh19MVpVnOaP9rAtBZ/oD/wI8jhWBs4p2bRwj8CfdotisUfMw/3+N3ABQvddthI+qEF5PAKiY7y+glxfrZUSPNW1rjjy6TgoM0db4fTIy9OmKdtOFFVyOOPLYzt/jwrBYa7I4RTc+oHSil8h8EkjKZ/68gVFuHxe6f3KQC2pGrWq/eGOT56UCy3WQ3mkqkdkULmxz2MdonKc2EZa/iKx60h5U1TdGPdYtrMijyHFWPuavHdsicKqs/dupJAYXo2MECweIGv28k64LamTA9ikxldb+ViJo8sHXmq6mET49wZn45QgYnBGpCwxXyruwj3HnXKdaXhaYtjfmNC9zvREEmJIecYzM5YXsJdWJtDQ183w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(85182001)(38100700002)(186003)(54906003)(6916009)(26005)(66476007)(66556008)(83380400001)(66946007)(82960400001)(6506007)(6512007)(6666004)(508600001)(86362001)(7416002)(8676002)(53546011)(8936002)(2906002)(9686003)(4326008)(33716001)(6486002)(5660300002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2Ivd2RhaWZTVStYVFlNWVhCa1h4b0NJNWNhNStVNGE4ZlRLNTlMN0FpZHVp?=
 =?utf-8?B?RUlWWTA3RnZzZVVLenZxV3c0dHlrVHZ5MmN6ZWpuSlNnS1hQc1R0c3pENWVK?=
 =?utf-8?B?eWpQTm5KQTlENWRxRXRZV2VDTFF0RGtoZk9NUjVqNDFORUc1MWdyZExFQ3cz?=
 =?utf-8?B?NlgxTVM5OHFLZ2E0a0pscjlNcjZ4SjJRQWlSZ0NucmtPTGw4UnNBdEtac28v?=
 =?utf-8?B?a2dqWW1YTEpkOFBkZjFvTjJBZjJTb0hySmhUUVZrNWV4WlYxakNiaXhOVWxC?=
 =?utf-8?B?THYyakF1WkdUaTB2TllPTUxuQmdURHVOejV4Z2JNejlEWjRzUlQyZ0wrZm5Z?=
 =?utf-8?B?elozZVJLaWdLa0NzYkhESEFFcHgxT01JdktzTW1VT2NyYk0xcVkrUGdyekhJ?=
 =?utf-8?B?ZzlPclp0RTN5UC9od3UzcWppWUJaQnY5T1RKRlZtZWNOdFl3dE1EL3FsSS84?=
 =?utf-8?B?QjQ2V3VvSGZxY3NSUVJmSmdqNWNIb1VFeTNlQTR2aEQ1Nnd0Qm9hVmIvWHpy?=
 =?utf-8?B?NTRqaEFqditrL3ppNVdhc2lSdHFRaHlCVWZoLy9FMVZzcEcrZ3hSazdjQkZT?=
 =?utf-8?B?Y1V1K3ZxRTU3VVc2Ym4rTUNvenJQbGtGN2JMMzJqNzNZY2x4SGZRemEzS0JZ?=
 =?utf-8?B?ZjI4MFRqUDZmMXZDcjhSVjZSRllCYzFXdTRMWjNoTVA1ZTlEamM4Mk5HdU0y?=
 =?utf-8?B?K2xKUWl5ek1HT01HekF2dHRrU3p6ZDNRV2dEaW1vUHMxM2VNSVdBMVFkUTZJ?=
 =?utf-8?B?UG5OcEY1MXpRSytVQTVjdi8vL2l5MEZ1dVl2Nm4wby9rQW5wckcwRXBtOWJq?=
 =?utf-8?B?MUxMaitYRzdXZ1JWUnRpck1ENS9Icjd3QjVzc1V4eXlYVTdRWlFlcVh3NVFr?=
 =?utf-8?B?cjBTS29id1daVnZpQnZxMmo0K1ZZSEU5U1lZUysyaUl0RjN0NWpqOTY1ZmNz?=
 =?utf-8?B?ZkFKOUR0dkdDb3hkRkhVSnQ4M2p6dDJxRUY4Vm82VHU5dGlEaWlwZERpdU1U?=
 =?utf-8?B?ZWZXRlVaMXRGM0VpQVg5Ty80eXVXbjNmN0RiZVpsTnhabUFwdUZLYzI0eTBw?=
 =?utf-8?B?L0hseEFIVm9CSC9OVC9lRENEL0lvTnBFUEtCeE5MSC8yNHZzM09oditWN2g2?=
 =?utf-8?B?alE3bnVZQVAzMUt1NDRscW9zdTA5cHpBZVE3NHQ1NEh6UXFucVFtMkZrQUFo?=
 =?utf-8?B?K1A5bGt6d05FbzVuOVZ3bHQrL3lmSGh1clY0bVF5Q1VxWCs4ZkNtVXJZNU9z?=
 =?utf-8?B?OFoydkhJcFZMNjdqcXBuZGtJSVgycG1wNklqUGtlRjhiTHlNY3JMMFVxeE15?=
 =?utf-8?B?MFBOaXJST2pQV0xMK0c1dFEyOExPV1JnaVNsMWF2SHZQcE5hWW1INStLMktG?=
 =?utf-8?B?blNXZ2RQWFpodkxZMDE1ZUlRSzA0K3Z6Zkh2TUdhVjFMYldDSHdlK3FyOGpP?=
 =?utf-8?B?TTQvRDhkQUQxYnBNQXFJM0prYWU3U0o4RkcxdlExajlobjZaWEdHYWZjVHR1?=
 =?utf-8?B?emdPdUhlNE1xVFI5T2VWSHBSbmNid2NwRGxJQ3BVeGViR1cxZktja3BRRDdU?=
 =?utf-8?B?WjQ2ZEZPeDVXUmlsNllBanM2MTlVdHpDYkpJQTBnY3dVdk5aSS9qRU9OUDBt?=
 =?utf-8?B?c1VRVW1IcjNzSzJVVS9oZDk0MHBhZTg3V1FKYS9pcDVBNDdqeWhZWlBFMFBZ?=
 =?utf-8?B?ZVd3alhnT3JYMklWcGRHbmViS3hmT3FuYm1NeVV4dU9RNDBNS3FTRnBQcFE0?=
 =?utf-8?B?bFprMjBaRWZvazh2Y0ZtWFgzRGRVOG5CVGI1MGpwODIxeTJVczBsbDZ1ZHZE?=
 =?utf-8?B?N255dS9ZOTFId2lCMHRzWG1tcWlpUXhJRUpjZXJoOTVsaTZ2SE9HV1I2WnZl?=
 =?utf-8?B?K2s3NGhDRmhtRGJhaEdXNnIxbzF4WG1PdmMvMmpKVlFYU3JKNHJnb1AvVHlM?=
 =?utf-8?B?VEpDSmtsNVVObFVXM3dFRno4VHcwK2sxdXBFMU8zVnZLYnJQNlRLYWFuWGVY?=
 =?utf-8?B?Y1BuWlB3ejRVNEhjY3hRdGhQTlJsWnNxcmVmZHZvMVYyWU1VSFlnMzRYaW4y?=
 =?utf-8?B?ZjFJNGdIdG4wYS9NUjVobmdDaXJVZnVEcGw1MEIzcEZhMitUSzd2N2Z0RlJ4?=
 =?utf-8?B?MGdTRWg4MW1kNjZ1UTNWaTFEV3p3dEtHanR3TDVESFBEdHZqVXlHWWtFWWRR?=
 =?utf-8?Q?u3SjT5zXtyk1MucdVyn47to=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5cfb6b-bb68-4b79-62a7-08d9e4acb35f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:27:44.5923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/DPhyFWeekGRRmSnPFM6dGjaKqyX8yqcTB1tR1YzJOlb5l+ZnBd1OSZG+a7KganxdxhLrGdBQZjXliBEGnq6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6049
X-OriginatorOrg: citrix.com

On Mon, Jan 31, 2022 at 11:04:29AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Jan!
> 
> On 31.01.22 12:54, Jan Beulich wrote:
> > On 31.01.2022 11:40, Oleksandr Andrushchenko wrote:
> >> On 31.01.22 11:47, Oleksandr Andrushchenko wrote:
> >>> Hi, Roger!
> >>>
> >>> On 12.01.22 14:35, Roger Pau Monné wrote:
> >>>>> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>> +                            uint32_t val, void *data)
> >>>>> +{
> >>>>> +}
> >>>>> +
> >>>>> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> >>>>> +                               void *data)
> >>>>> +{
> >>>>> +    return 0xffffffff;
> >>>>> +}
> >>>> There should be no need for those handlers. As said elsewhere: for
> >>>> guests registers not explicitly handled should return ~0 for reads and
> >>>> drop writes, which is what you are proposing here.
> >>> Yes, you are right: I can see in vpci_read that we end up reading ~0 if no
> >>> handler exists (which is what I do here with guest_rom_read). But I am not that
> >>> sure about the dropped writes:
> >>>
> >>> void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >>>                    uint32_t data)
> >>> {
> >>>        unsigned int data_offset = 0;
> >>>
> >>> [snip]
> >>>
> >>>        if ( data_offset < size )
> >>>            /* Tailing gap, write the remaining. */
> >>>            vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
> >>>                          data >> (data_offset * 8));
> >>>
> >>> so it looks like for the un-handled writes we still reach the HW register.
> >>> Could you please tell if the code above needs improvement (like checking
> >>> if the write was handled) or I still need to provide a write handler, e.g.
> >>> guest_rom_write here?
> >> Hm, but the same applies to the reads as well... And this is no surprise,
> >> as for the guests I can see that it accesses all the configuration space
> >> registers that I don't handle. Without that I would have guests unable
> >> to properly setup a PCI device being passed through... And this is why
> >> I have a big TODO in this series describing unhandled registers.
> >> So, it seems that I do need to provide those handlers which I need to
> >> drop writes and return ~0 on reads.
> Replying to myself: it is still possible to have vpci_ignored_{read|write}
> to handle defaults if, when vpci_add_register is called, the handler
> provided is NULL
> > It feels like we had been there before: For your initial purposes it may
> > be fine to do as you suggest, but any such patches should carry RFC tags
> > or alike to indicate they're not considered ready. Once you're aiming
> > for things to go in, I think there's no good way around white-listing
> > what guests may access. You may know that we've been bitten by starting
> > out with black-listing in the past, first and foremost with x86'es MSRs.
> I already have a big TODO patch describing the issue. Do you want
> it to have a list of handlers that we support as of now? What sort of
> while/black list would you expect?
> I do understand that we do need proper handling for all the PCI registers
> and capabilities long term, but this can't be done at the moment when
> we have nothing working at all. Requesting proper handling now will
> turn this series into a huge amount of code and undefined time frame.

We should at least make sure the code added now doesn't need to be
changed in the future when the default is switched. If you don't
want to switch the default handling for domUs to ignore writes and
return ~0 from reads to unhandled registers right now you should keep
the patches that add the ignore handlers to the end of the series and
mark them as 'HACK' or some such in order to notice they are just
used for testing purposes.

Thanks, Roger.

