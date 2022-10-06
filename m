Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092015F63CA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 11:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416794.661484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogNPx-0004VV-KR; Thu, 06 Oct 2022 09:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416794.661484; Thu, 06 Oct 2022 09:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogNPx-0004ST-Go; Thu, 06 Oct 2022 09:43:49 +0000
Received: by outflank-mailman (input) for mailman id 416794;
 Thu, 06 Oct 2022 09:43:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xibJ=2H=citrix.com=prvs=271cd1fce=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ogNPv-0004SN-GX
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 09:43:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c916383-455b-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 11:43:43 +0200 (CEST)
Received: from mail-mw2nam04lp2172.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2022 05:43:29 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO3PR03MB6806.namprd03.prod.outlook.com (2603:10b6:303:166::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 09:43:28 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 09:43:28 +0000
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
X-Inumbo-ID: 5c916383-455b-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665049423;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KsSOSNnnD9yJmsiRRR4fsWhHFlns4g8E00TDWhZCluw=;
  b=Y8HknyHu7FEhXntE7y4d9sBqIoLkIrOcWLOubmeg2kDzQSQ9TvjPmbs9
   +f1p8WTZvlBMybrHJBT9EjLQcXgQlM/UhW1fadlx7g+4VYrWiXoTlYziK
   vjy4bqts309vlMHlbvkHxqGAcaGZGdEm4Ht3lux86aWAsIhBUBj6TQAF5
   U=;
X-IronPort-RemoteIP: 104.47.73.172
X-IronPort-MID: 82525856
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SvIq6ajaZkHAHO/0FGTrHfOkX161mREKZh0ujC45NGQN5FlHY01je
 htvWz+BOPuKNmfwfYp+PNvnpE1XuJ+Gn4RqTwE6qS40QSMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVmPa4T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXtf/
 8BBDSovVA2OoNLpwq7kcfRMwf12eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVMruFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rWSx36rBdx6+LuQ0+42u0WX/VYoCQAaZH3mg+KX2wmsVIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS8xqRw6DZ5wKYAGksTTNbbtEi8sgsSlQC1
 EKNnt7vLSxitvuSU3313r2Zty+oMC4Za2oLfzYZTBAt6sPm5oo0i3rncNFnF6Kki8zvLhv5y
 TuKsSsWiq0aiIgA0KDT1U/DqyKhoN7OVAFdzhXaWCep4x10YKahZpe08h7L4PBYNoGbQ1Kd+
 n8elKCjAPsmCJiMkGmIX78LFbTxu/KdamSD2xhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLISrwJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:dTH2V6+hn2b8zClZ4JRuk+G4dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FDQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriqknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYa
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkioFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MIWKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCEPknrVeI2zNaBwg1PwqD3XZ0Wu9ige3ek0hlTEfsurDcXZI2pe1vdJoJ0kc7/msr
 iISdZr6sTYXBvT8LZyrnPDsqZpWAgjue0uy6IGsgG107X2A7yvkNDnW9DuA5eoOQoYewrEcw
 g+tX7IVYh90nw=
X-IronPort-AV: E=Sophos;i="5.95,163,1661832000"; 
   d="scan'208";a="82525856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H59t+GoE4tfpp1dolKmVPf4sgRi3cNX6NQvnQCWEJOj3QiLR+znvp0FCxmqowrwg0hUT/sMZDaOYuoGSuVZh2cxVnD3ownKpgRlfWZO8JWNMCQevoRB0s+c/iTwG9ny1HuYp4KpaABZ+kOyo3U4VmjVfI3bq67g/Tiu7jTCZAvqQxvE8Bi4tX/ndtm+s0u1okNAQ64U05CVY+h1SwtLx7KWhVFDDBW9FaZ/RkIkJJozb/2QqKGkI7Hd61munJ+kq+UpBLv+ZDe2U32ZucauqjAk8/su+C4jgxiE1JjNBTVNLrNVoc/59IwXnGcRSdNHlTzRLcFgTk6/uQAVAaltTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlBIEbgRsMGfqFtBiCdkG1qpAhfAF88pKmiABeAVQn0=;
 b=I2lHhhd0EepPAork5N3iHVkMlHtA1K3l5d4OAjjRDk9POxdwD2svQRTieqmWbwtY2m5vwI6zxoYIbT3B01iG7Q7oK+zzPgJCpYr7liiVMQdsqs7DN/WBvv+QjFQZKvW0GgoMxHjk9Ea3aHj1jZ5rjLCSQTertwyZo4ozSlfbPT7EvIxckEuSa5VqyXUeKRPjmEY812Dh3rYlm0w/vYd7VcHs6FCryxdBOnvRxhAQKlJCj/2w5RDvEbOEiOGt0h9/NL79+FOCtadKkyHQC2OKj5WHJa+VgtSYw4dWLZ8nRKhFRv8veN3jgFTLGrr+fhS3NzB7e0mLmf8loKVuqFa2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlBIEbgRsMGfqFtBiCdkG1qpAhfAF88pKmiABeAVQn0=;
 b=lMgutHk6Eq6pa2NQ48CEifsHkvGJJGWbQ2xm9oIoAnZEr1R5K0zD4+jLGdIR+AYJevkfObbEK+upgnhpzelfKdvMf/bMfmr+A/4bvhsDITfARqn1s/FgjaAkS4CrsqkB3SdLseNUQtvf0nvZNtV1yUwt1DjrWEcTbCzV7Yukdks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 6 Oct 2022 11:43:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17] x86/pci: allow BARs to be positioned on e820
 reserved regions
Message-ID: <Yz6jOVAmkWX4ZGmW@Air-de-Roger>
References: <20221004153645.3686-1-roger.pau@citrix.com>
 <4c1ce9fc-7501-89c9-f66a-9b6671d98302@suse.com>
 <Yz1CPNwo1hiWZTw2@Air-de-Roger>
 <e38bae0c-c0ce-4953-2813-0d03bd3effbc@suse.com>
 <Yz2Q1C7Z2zolHAvK@Air-de-Roger>
 <544a7408-ea02-db17-39d7-82b7a1f56622@suse.com>
 <Yz6WWYn5uO4R3zNg@Air-de-Roger>
 <c041b9b8-6354-53ce-ea6f-d19ee328e346@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c041b9b8-6354-53ce-ea6f-d19ee328e346@suse.com>
X-ClientProxiedBy: LO4P123CA0502.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO3PR03MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ae8bec-a376-46bd-93b2-08daa77f3864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9fB7ptCD4LEYBy4Iur+IQy5EBOC5B3yCIctsnuJSuZ9WNzxhthp+ICs6PIqYlxzECGgMv3H5dR25JGoPRUrqYBFB1SBtscPppfmuLAh90h1OC0u42PJVneW2AS0k/UhO152Ykry8r9ZEhdba+PQM2nOZ55PT1Bc2YPur0CLqEqct2/Zp+Fs29F7uQTLf1frFyfiqyksP98KCgj5yZ10C2sk0Xs8e17GueD0P46DCiv6iSSUY3IaIaKb7CM3T4jor3EOAT1zD4MqbDQ03iRvas/1AU61mfEUKxrBN0J5a1+mhh/cEE+toGAygquzbjTsUAhAQjYmOIK4zRi+RMYF5IqnQNP2oiGCV9gDcH6llfFH9oI15HG3ZLlc8PIuDWtgzbKrWxfSYC1IX4YHZ28xf4AGqZ9fAfuw451HohNDgYm/X3aii+giOy3fZrgisIR/vidcABY3M/gfTqXFiK7SR+wc2pVyK6C0KIWymLQGp4O0J+tIJX1L8i5uNoJikFRTyIKjr+i3jm1lt0QwXznjoFFoSbo7Fjk1s+mUtgQwoImjXr0rg4GbTHWYsWbT2XyQQpoGQeAhZvOLZIAWH9JK+fXCueyCkNmfPwYMJ8YyQdMCJuUa2TxGHFDRnlW4N79jnmtEF7LqlQNkUN4sQzWJfNRdGryYQwInlnUEjvtNR4RpuB5E9UBLUxwtJBbQBOGlo/yiSCs2ZUyeJLP1cGnWJUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(8676002)(6512007)(9686003)(186003)(26005)(8936002)(85182001)(4744005)(2906002)(5660300002)(4326008)(66476007)(66556008)(66946007)(6666004)(41300700001)(53546011)(6506007)(6486002)(33716001)(66899015)(38100700002)(82960400001)(86362001)(316002)(54906003)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzZPSlExSE02Qyt5QTcyb1gwUDN0ZTMyZnV4WCtmYnBxWWRUbWRESWNuck9E?=
 =?utf-8?B?SWFJa1FIMEVzV0tBWmx0V0xCVSs3UXA2U1JaSGhUd1lqNkd0K2VYM2VwNGpo?=
 =?utf-8?B?Tm9rNnBaT28waGEvUVFPQ1RNTk5kVVpKSWFwVlVzRTFmV1kvbzA0OEpIMWh5?=
 =?utf-8?B?WnJJaDRWVmo0VGtNNlE0MmJFN0k0clhmSWY2dDRwaS9zaHd3OSt2MTd6Ynps?=
 =?utf-8?B?RXArcGdoZHVrUFQ5eUVlSGs2TWNqLytXQncwd29DTjJXNnpvdXlIMTQxS1Mw?=
 =?utf-8?B?aHdrajJsdVRETTd2N1VXSnZyOTBFMEdGbjMxbGdLZkNwMFpxV3phckdZQmw3?=
 =?utf-8?B?UDV6b2U2ZGV4QnJmN1dSMzhwcFBuRE1ubXg1d1VZandaUDZUb001Vks4UDZZ?=
 =?utf-8?B?c2VZWkFWRVAzaFVRWUROWkhuZ09UZXE0T1U1cWpyT1JCaU5Id2NWVXVmdkoy?=
 =?utf-8?B?NTBqNXczbzVYQjZFdnVnbmUzRnZxSjI4QTlaN05SSWo0eVppdUR1eGVMTUta?=
 =?utf-8?B?VTdGSUwvZ3dNbkRhdHFuczBXOWx4Z0t5VGFPQ1JTYmJlTy9oODBtVTRrbmc1?=
 =?utf-8?B?TFdRQ2Vhb3hJZ1NzNTcwaDM0bjBHOTlsVk9HQzJmbVd3ckp5YmFnRVpGMy9S?=
 =?utf-8?B?UUZSay9oWWloNGJkY3M4a0lGeVRFemp1YU5ZR3U4WWptamFKQ25ZbnRLY1Nk?=
 =?utf-8?B?SHVEV3U3cVlXRXdNRlNOK1RROEJWcXVWRjVtNkRIWlYycTJWTi8xRjRKMTVr?=
 =?utf-8?B?c3hBc3E1SW5MWVQ1WjRub3ZOV0FwNDF0L2gzbHFBOGliWWI1LzlUNGlxSlB5?=
 =?utf-8?B?SUdZRTZwMzh1NFJPSHhjMVVGdUtmbXdSdWFHTmwrRnFZRzlLS1hEOUIyZ3h1?=
 =?utf-8?B?UzhTZjJOdVgyZ3BYeTRqTXBoK3o1VmR6TjYzVVUvaUxlSWZoWHNITmZ0NzBT?=
 =?utf-8?B?NzRXV2lBdFRYVDE4UXI2UjUyY2tnTUkvTFRFOHFyUXZwWFVPNTVYN2hHa1VJ?=
 =?utf-8?B?N1c5QnV5ZHVIOWhpOHEvNzJUOTNEUzJRS1hXbnlCZ2ZvNUxnejJNV0JjUlBZ?=
 =?utf-8?B?ajhRSmxENkxHcENhdGpodWJIdjNCZ2JDK2h4THN3S3BQZzFjVmEvWXVnc1h1?=
 =?utf-8?B?am9rYTdlbFNxRFJxUndpb1ROeE9pd0VlTkhrdWRaN05wdGFBdk5pTTlGL3Nu?=
 =?utf-8?B?czloVFdvaUJoYUxLeS8ycGpwV2wxR25YRHBvbFNNWHBmb3hmazR3WWwwZUVF?=
 =?utf-8?B?ODA2bzJpeTM1bnVVdkJxTUdaZlB4THVhVzRsdXNKZjFyMnFaWVNWVW04bGFB?=
 =?utf-8?B?bmVnbVQyRGJnQVRIdC9iNXJFZ25ZUUQ4K2xwWHlXaEdCK09YMFEwRzJ2NWRE?=
 =?utf-8?B?UllJTTEyMjVXNDAzV3Mzb2VvSVBBNXNGaXZ4VzdNRlY4dmphaUZrT1I4Ujlx?=
 =?utf-8?B?Q1k4VmEzY3lJM2M2WUpIbVVnalF3RUlaUkhuU0VjTG41ajRkYUNjUmxWd0wz?=
 =?utf-8?B?YVRKeWx1VG55K21CdmV5VHNoVWtLUHdheFhpZU1MakxGck5sNmd1MDRiRTZE?=
 =?utf-8?B?WFg3N0xUNFpNWGRKdEJZbUs2WmJqekhKTnhZZkV2K2o0bm5NZEorSUI2UDc2?=
 =?utf-8?B?R0RCQjE5TENoemJyaEo0L0VkczJEaFZlOVYrdFFjamFpSXNEL2lsNnM4SGRa?=
 =?utf-8?B?dXlnQzg2a1JGd3lqbUxBZUVjQkVXS1RJT2lvMXVXU3NSWW05ajFoZXJUMDRN?=
 =?utf-8?B?dmEzUUhVdy9Rc0N5VnZ6YjF6QW9IZ25VcVQwWUEvTzNhajNEZ1dSTmVKd3RV?=
 =?utf-8?B?R3lENDJlZ0xlQ1YxdnhuUzFOZjVIRVJrNnhRT0JQWEdLL3NwNS9hTmdTcjdo?=
 =?utf-8?B?a0w5dHFDQjlQcWs3bXNHUWlWSUM3aUF4R3lzc1NjQjNWVWJoMXhxZGduT2t6?=
 =?utf-8?B?aUZJendPcnBqdUF3enBjbjY5MkhZS1JpQ2poZUlKTWJLckRya29OYkp1QlNw?=
 =?utf-8?B?eTJZcDFSZHJOUy94WFN3ZE5zQ2IvZ3doalNrc010bzNwb2NocDh6TENxQzZZ?=
 =?utf-8?B?dVZmcHZQTmh6RHFOVlhjRC9weGRJajVadEN0RXMzb0FRVmtGaU43d1pENlVl?=
 =?utf-8?B?TzZWVnhpMHVWMHd0MThwTFM5QUllTzEwdFNJYmJIaE15Z2h2YVhaVVhnTE9P?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7kztdpbzeHURh67OR0XEWPh4JrI9tHruKB9NUd25im4rTuIqiFk8amYLtsAtALsfwzBvUy+MFXE/63mTz0il98+KVT91/QCQflXz1jgflj7kNeXs88Hbed7eiz4H6O4bzeVtFxdyigGuE/AJdZNJeY5geoM6FSCVZLPwf2PiqjksK23nRSkEy7kdoeo09tjPP/uqqCpLbhtMYlxj1zlzcYgXKfCT/NfsSYNS22c3a3D7iYmuGGVZqDbIzLm9vbHjo+a90vWHOJ0p9GbxriBk+V2peHzXRRvVxbhmVb7kQQ1ZYavQ2oDQNQzKZwQVOFEE42W9pDo+lA2qTV2bZdcE7q/SXSHDe7ctQwuOak0UGwVSS7wybjx7mKPgzAJgZbMtSBLq/idKg/jqsANAjHg8uLS5b4BQt+orITV4uVYSZm4m8IxH0fU+p2SSgP28RyXeJYHcMMHvDu+VzwER0uNCit7YgMu/2jm8bzv150gITBjHWT404WNWtidTsHp/sNYm9bF6DqGReJc2eRRYyRCd7ysPtgDibv8Z1Mh85xExJYeCImX9j71ZRnQwSipq45I1iaZmgO6o61ls69N/oOxRAcGD5bat8EV1dZc1dfMDnY9/Ujc+/iC0Da0PwBbX3pkmjr+3g6RmMzL2u4vy1/g0uPyZ8uG50LyqSJZ23LqIhbR9nzilf2lzHy6XrIheJgYnLkUErhwBJijqC9ZE/N24HGgfdAvSv3mPFcCKmJyTqyqbpecZpIqyAkb5gLymHR8U7yA+QIrhBD6GPD/YW5Yh83hm1sViIFfNeKRWBewTC8/NCykiIRK07//4dRxvE/NE4fBNnfvPJGBwXpH33wLyy0N4Mmi1m4zeLO+qbShw9G0iF/V7kYwcCg6FoNxwTIMiVczfWzZpSIIVvt2faNTQ7CtcEB+UeXkyO357mGrQLhs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ae8bec-a376-46bd-93b2-08daa77f3864
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 09:43:27.7817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbIEN17UJ3h4dk8IaO9EpeACjPlMFOh0ZfCq3fkMp7fqdIMBxdDGcWEx8hDShK6wC2d9Ffek/8WBpRTydeSa8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6806

On Thu, Oct 06, 2022 at 11:02:32AM +0200, Jan Beulich wrote:
> On 06.10.2022 10:48, Roger Pau Monné wrote:
> > On Wed, Oct 05, 2022 at 05:42:08PM +0200, Jan Beulich wrote:
> >> Or put in different words - how
> >> likely is it that we could first gain understanding on their
> >> intentions with this region? You did say the system hangs hard without
> >> some kind of workaround, but that doesn't clarify to me in how far a
> >> use of the device by the firmware was actually involved there.
> > 
> > It's a black box to me, so I have no idea what the firmware attempts
> > to do.
> 
> Right - I don't expect there's a realistic chance of getting hold of a
> firmware person of theirs.

Even if somehow I could manage to do that (which I think it's
unlikely), it's not going to happen before the release, and there are
production boxes out there that have this behavior and we need to deal
with them.

Thanks, Roger.

