Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA877562A9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 14:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564494.881939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNGS-0004yt-KJ; Mon, 17 Jul 2023 12:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564494.881939; Mon, 17 Jul 2023 12:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNGS-0004wS-Hf; Mon, 17 Jul 2023 12:23:44 +0000
Received: by outflank-mailman (input) for mailman id 564494;
 Mon, 17 Jul 2023 12:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdAb=DD=citrix.com=prvs=555bb5b00=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qLNGQ-0004wM-Oa
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 12:23:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c23b872a-249c-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 14:23:40 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 08:23:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5987.namprd03.prod.outlook.com (2603:10b6:610:e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 12:23:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 12:23:19 +0000
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
X-Inumbo-ID: c23b872a-249c-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689596620;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6uCl18GswcnARF2LG8ri7XpBSfCjE1NkWSDpmyffwcQ=;
  b=NywgoeKoNsZSURW51QiNtoXq3BmelAmVcJlH5h3U78jOqrEikTqrMBeU
   HywLpfqz4nta7xelw5osPSsxsmWm5Qe5bEyv2ph2cbA3+SKdY8ZC3A57h
   l/NmElQsF7AHXst5ntOlg2Ntw3mbpvvp8agW0qv4pHAW0lq+hpjaTxQjj
   M=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 116328911
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oVfXH6qbWknRDJ7ideqf5Pt6Yj1eBmLgZBIvgKrLsJaIsI4StFCzt
 garIBnSbveCN2r0eNF/YNy39UgO78TSmNU1GQA5+Xo1Ey4T+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBziZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGs3Uyu/tfOw+uiicsx2pfYAEsf1PLpK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKNEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6Ax2g3CnzV75Bs+WWmin97moxOEQM9GJ
 1IFxSlpnJJj+xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQCz
 V6MmNXkQzZmtLmcU3Ob3r2Joii/PydTJmgHDQcLTAID58Toqcc3kwrGVNdlEYa/k9LuFDf/h
 TuNqUAWnK4PhMQG06G6+1HvgD+2oJXNCAkv6W3/Tm+jqw90eoOhT4ip8kTAq+ZNKp6DSVuMt
 2RCnNKRhN3iFrmInS2JBeASRreg4q/dNCWG2AY3WZ486z6q5nivO5hK5y1zL1toNcBCfiL1Z
 EjUukVa45o70GaWUJKbqrmZU6wCpZUM3/y/Dpg4svImjkBNSTK6
IronPort-HdrOrdr: A9a23:/+89HqkEDJ/C5sdAUX3HJeTA2FjpDfIq3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7gr5PUtKpTnuAse9qB/nhP1ICPcqTNOftXjd2VdARbsKheffKhLbdBEWndQ86U
 4PSdkdNDW5ZWIRsS6xiDPULz7BqOP3lZyVuQ==
X-Talos-CUID: 9a23:BOyXgW3fbGbR5xk4lLz18LxfQfoYSUHv3XHqeVaALHxKep6rR0GQwfYx
X-Talos-MUID: 9a23:czBs4wVx1eZB2vnq/DPenQ9Fa+412b+zEUwTgKoF/Pi+ZCMlbg==
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="116328911"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REfUc/gPUAlGieIAl6m9CDz6O0Jm5p5xFAwesI9mbb2hbF1riLh0HJXuYdlsetleh4s7U1sEQmdzed2slpwKpvuovfRGlAPVKf9AckSrCU97fBdsIbCLFmUsCkDescj6Ew7QeKi9y+o+TupDmMfU6Pas59W9CQNg84C/pRpsx0JP//6nEW50I1HQ/gFNq+lmE75DNrBPZ5CULwVyEQfet56XSn8TTzKbdbKyBbFMZrETuKXh96kUTJT4I0f3++xHwPhXjsGGEVXTCOZdcj3aQkPnTVJrGXFSR2v2WuqNIQ23KnrMezPXEmu9EUKNOvf8pILysESDphA7t8GBkqG8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwNToH4q43CeZZFee+7DNm2NRKC4m0ZgSi8ZqdbLa5k=;
 b=UF3Z3DqHxhl6CCmRdXRzfABzelQR9WBN8U1VVu0X8H7J12hQfD4raN3Qvi9Cv2BW013k4u8L4gBJNOdG7bqV+SNiu/rQdw7/Gry9zcqZf+ScoHJtJ2XkNfHdB26SlLU+BAoHWCzsk4ng0TNsayLOpUmQQvGPlbj1oU16AnL5sf4Ynq++tlz22r6gAehctAlNFwGnqQn5YcAYHUWqUNbQKz3U+rTJNffYUNjGnn8ohA9S6j7Qin8MwPfP/qz2GSohim79s7lSH1uzjpgjxnNdL/WEVKuzTq8Q7OteeJKjWJETj5RvWyXB+xUC6Ascfh9hQLVClyk8VZlJWcneNv24tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwNToH4q43CeZZFee+7DNm2NRKC4m0ZgSi8ZqdbLa5k=;
 b=CRNr5Zsff655dXb+3hidWGq1+p2spvsKEKQyIUZiQKBpoEK76mlflZxn+I/wFZK5TC4XJHG8T8eA+13kWuB3u7LwY6eidN3n6Nz8as7J/SfJ3fKtsXn9c+ZQWWbjjz88As0Cu8Ezz687XmM7TRvOGeQxgZ0IP5Z84K8CS+KGcOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <214bdf26-9f30-7ee2-e59f-e8f0c96937ee@citrix.com>
Date: Mon, 17 Jul 2023 13:23:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: drop old (32-bit-only) MSR definitions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Simone Ballarin <simone.ballarin@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df2c3154-2e8b-194a-ec1e-472819bbf026@suse.com>
 <38707d09-92a3-2807-4bf0-167be5c3bb15@citrix.com>
 <ee342a26-5f26-0e47-06a6-c74fdb3270d6@suse.com>
In-Reply-To: <ee342a26-5f26-0e47-06a6-c74fdb3270d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0149.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fbfba8-33b6-4f70-f8a5-08db86c09ad2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yb7jktjJbzy7i6ofxwWWQw91mRRkmV7xtCeQwOmx3WWeajuNfOSQvFMrz/iZH/NWoo4DUTgnMbKAFKKsQiM6747cf+FqIRyv9ogiVPi7YvZorguVzS7QkxCPWdOKTrvZQ31dWOs8OIQIDlSB8w7sPJnPenfgaP1nF97ng6iaaPrUf/SUN3r964ukWkfzs88PXoZDSw9TWjMZ9Qf/fQmdLkG5nKwK+BVsHrOF3V03pJQmRFd0EztfKfFRVVsY9gIrq3fqIMnKEifavf31ijl8uxyQMp19annvGx6lSMjsR5Yk4rN+XRYx9k/xIIe5HDLDQOHFTOE/fZ3IYHJ/173ygx3Q+VKJU0Ny24r9wd4JoT4/7LYX/6L1iZlMhehL6GYPS77QNDYyzNRwBaAi6feIb8fPCvYkDMKeHmEDIAoQtlo22371JpNcW4fGlwvdAR746kFq8vOlMmbnobbf+0DKYXA1n6JSQ2uhhBEo7Px4O2tlCX+79OTM702wX5+61OYCtBgJ0yQsM0JxMp49z3Xq03Xi35/T4/kTPpIDg2PgUFqr0IlAw5aaUICt5cBklvPawtoyE+ju+jb0mUVUrKpgxO9Yq58rX3LNixNJAN5VlAmxVCMfAt/M4r9z+Yb/4WTwmC5Iz8kAb/Nx60FwGv7jXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(31686004)(478600001)(6486002)(6666004)(54906003)(31696002)(86362001)(2906002)(4744005)(53546011)(36756003)(186003)(6506007)(2616005)(26005)(6512007)(316002)(38100700002)(82960400001)(66556008)(4326008)(6916009)(66946007)(66476007)(41300700001)(8936002)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REo2dmVMRmhZanZJd1FabVh5U1lHZVl3eDRoV0oyVERJbk5Jb2NBbVJuMHlI?=
 =?utf-8?B?R2NYQStjeWNwRW04QmpHUFRFZFBjWGliQzBRcG9nQ014dTJVT0ttdlVMOHN0?=
 =?utf-8?B?ajFlQXdwNmlPNHpwY1Nzc01oUmdtVWhIWjIxeEc3OVlNVFpadlkwQ25VU0Qz?=
 =?utf-8?B?ME5hZWdFekJmaTE2SUZXYWVBaCt0bWluWkhjakc4UXlxeUJCTTF4NGZBTXIz?=
 =?utf-8?B?c2EwdnlzdCsycm40U3RzZE9aR0ZDM3FKbFVjbncrZVRGSHZtQWNyb0JaK2oz?=
 =?utf-8?B?UHRTWlR5ejBuZDZ3aGs4L2R2ZW9mQ0tNbGkvOGVHZFZocXVxZmNnUjNoS1pV?=
 =?utf-8?B?TVhLRVVkSGtMRlZBSGttdlhhRG81T005QlNkbWp3K0s1NVZEd2VDRWlLazg1?=
 =?utf-8?B?OE5OVkxxN3N3eVU2ZzkzSXdLWHV5ZktKaWJpOXYzVmZYdjlxbWhuSmJuN0s4?=
 =?utf-8?B?M2FJWmUrWkllYUFEV2gvNmxYcUFYcjZOMFdyemRkR1FTWWpDdjRHV0xNT0dq?=
 =?utf-8?B?T2dOTFdwck9IbjZxTURzazNEY0pQTFBwcFBZZzNZS1drdEZxcUVxRndCSy8x?=
 =?utf-8?B?YjlhV2tYcGJkL25zNVRpOTA1ZG5ieEVxS2F5UmIvdG1mRDV2N0pONTVOd2x4?=
 =?utf-8?B?TmpuTkJTTTBsZDdsMktJQmpaZTlYTVltd21heVp6NGIzb01ybHJ6VzdSMEFS?=
 =?utf-8?B?em92OEdvcjMvQ29JYkswcjZMUWp3Yk5aZjFtT3Vocnl2OTRVdC9PVlVxdThv?=
 =?utf-8?B?a1Uwa0Z1SGVSd3dmOFI1SW1IZWRwaFgvRFM2aU9qanNQTTY3c0hPVFlnMU02?=
 =?utf-8?B?V0Qxdjc0MURQakdEVXBObVJWMDZMNU1ybnBYUFpseTF1VTZCZzIzakQzcTho?=
 =?utf-8?B?SVByQVViQzVrc1F2ZlNFRXdyYVBIektkQ3BZSlFldmFNNDF4MFA4M0F2Z3pl?=
 =?utf-8?B?amV2YkFFR0NzU0xrOWJEY25FanhJSkt1SGtmMnRzRXlnM29RNnFPWVZDNXNC?=
 =?utf-8?B?VExJWVZTbnlNV2ZlWmJza3FxMENFVEtTeDRMK0Y0a25jOUp4cGR0UkhFNzB3?=
 =?utf-8?B?UWFpdlYvbDNsYVpndDZ4MStJbno2bEZ3LzJjSjZ6TDRCK1dzT1ZUZFljS09H?=
 =?utf-8?B?NUxkMGQxZWU0QjR2UTRybEpCY1oyYkw0QW5uN0cwdWx2ZDA5TXR0bFUwL3hM?=
 =?utf-8?B?R20xaHlxL1JJZ1dTTFRPejR1czdISEU4MG9IU0dVM3BPZGVlUGJEMitRd0dL?=
 =?utf-8?B?MS9xenFWdWs5dkMwQXZDQ0FESEs2V1lSVDdac25tMTlsRnFyaERPckZBM1Uw?=
 =?utf-8?B?WjA3OVlnYzZQaVZXeUZWT3IvV3lDamVTajJEVmF1bzNnUXREejVqdDlNdnAw?=
 =?utf-8?B?NzB6YXJMbXdtSWVzV0lvOFFneXlnZllxYmRtMGZZRnd2aGVReHNadkM2VzZS?=
 =?utf-8?B?MFAyMkRoZW9iSkVwMXpyNTh1eUp1MElHNXlYN2hzcmhtU1hsVWplQmROc1ps?=
 =?utf-8?B?aERLcklGWHNudkhrNDZhSkhsYW85NVZGVWNVZmhCVDJjdkwxQWNQMGJpZ1Rl?=
 =?utf-8?B?OVRXdGo1b2w3R1pHYWV2aDdKNWRtaWt4S3pmVjE5NmVKN1ZsOWJiM2cydjVL?=
 =?utf-8?B?ckJSWWtMRldRZnl2N1psenltWTNaeFhTM2RHYW1hMkx0RS9hc3o4WTQyNFhB?=
 =?utf-8?B?RjU1NWoxRFNHUkxBZHRkMjQ5TnR0eFlzUmRKdDViSS9la1FqcEVxTmdRczBH?=
 =?utf-8?B?UmhKWUs2bFRXbTFRbDhvdm1hUnk5UnBxaUFscWpQaDNueWdnbDlIcHRtQm0z?=
 =?utf-8?B?dERBY3NuT3hTR1FSamlxWlVIRWx4R3pjTlE3S05kc0RxVzlMSXAvcnhKOHBR?=
 =?utf-8?B?RDE1WE5WY0QzYkMyWXBIS0FKaUVXR1Z4Y3UrajRDMWNBVlJCZUZvOThueTZF?=
 =?utf-8?B?cHBxc281bzk5dXkwbmhTU2pydlEzWGNTMUtXeGtUdHlMWnlPYVlLOWJLSFZX?=
 =?utf-8?B?TXhYMDlmb0doZ1RpSkpkYm54b1RGekZYbCsyVmFqMXBtMVFmUldNWWlmdmR3?=
 =?utf-8?B?dk5CTWl6NmdtS1RGVHh0VGtaZ3FJWjY0ajNIdU1TSEFuTklIUDc5RlZuTEhq?=
 =?utf-8?B?Zkg3ZGVxWlFPYmJEWlIvWEt0cklKTFBrQ2dnOHIrZ2xWQm9pK2E0REl6Q2RN?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zg4cG9gc7RHj0pw+Wav5Zbu46grlNEascA3S5Da3u3WFjSVMUSlpjh4s1/l87ybPJsKYq8ONL1F3tj3nrlMcEZNAi6RPjNLqoo65GCjg6mm98sotTWVRFRXTxvV4aFLsm/cBU94LixsmA8a2Xgx2qq3OjbmbhE7qqvTNSrDswdR1WcpGfjbsDKiAEqxxyI4kiv/am9KDFJnCZXFMvk8Iyvl7ieTdm0Dmfd48P2P8mMNXIb4v+yS4KeoFBZQv65FG0Bva6dXJUPlPBI4Wz6U4/Md8y6uDxCVHGcOeh7Q6a0OqfPG89oxNk8zSzVRs1YK3LqXFORuR2iwib8ahCIy6K0UuX3hfc6bZ7XsMQCfngmrldnjx/WFSpzgT/tkY0uIQtVkL1HZqBzbts/ci+fM1AZIW1q+ar1MwbMrBWHB+4OwSS4vCdh/6YoBYWBTbBAIa0bJ28XNOLKU8e07Ewb2wrr+GKaou6KKh71cFDlNefj8KOSetMLcRrdjX5eAOXuCuGIdUmac5rg/nmKFaFT/dP8SPrSJB4nav2kL9/+GYA1M07XMLh77OxM6yXkV7CPX1rTzhicSMOEHRK3f0gHkp8kD5/KRTXCpnxER/BUMqACq8Os23/Uf9N82ZR46X1mC8HpbXuELVMY7y4ZsLfYBsrc2tip47AaGz1P/UOqZAnOWZCBCHoB5kg3QCfRjU9pvvv7XYMPSEN0DVE4AakpHtOgtQoqCgY1s6rU2BxXzfH26s18PoOiWwOvy2S+lLgLeuNV8DB/ScJQgALT61a/C12FVdngyc7KvmV8zHEy1YjrClJOjge32u2f+5c8Yhkof9FuH2EdKHLVuWXpYOEtA2JEi2y8/aXlYqQ3nLiGpCO7geUfN5DqScsRtXvmzeH4Qi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fbfba8-33b6-4f70-f8a5-08db86c09ad2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 12:23:19.5046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZZLWC84ThGoMkpFIY5ez0Ag4Uh01v57rNQdLEcznjblDMSljALt0PjeNpn0pi5gl3t++LRlcwT/XFm6vGEMj/lYpPTLkYegFQ68AsB2axY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5987

On 17/07/2023 12:52 pm, Jan Beulich wrote:
> On 17.07.2023 12:33, Andrew Cooper wrote:
>> On 17/07/2023 10:17 am, Jan Beulich wrote:
>>>  /* Intel defined MSRs. */
>>> -#define MSR_IA32_P5_MC_ADDR		0x00000000
>>> -#define MSR_IA32_P5_MC_TYPE		0x00000001
>> These are architectural.  They still exist in all Intel and AMD CPUs.
>>
>> I'd suggest keeping them, because I think we're required to expose them
>> when advertising MCA.
> We have them twice, and I've kept the instances without IA32 in their names
> (at the very top of the file, i.e. already in the "new style" section).

Ah ok.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

