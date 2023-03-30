Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C36D0A3D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 17:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516781.801448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuSJ-0004R0-CN; Thu, 30 Mar 2023 15:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516781.801448; Thu, 30 Mar 2023 15:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuSJ-0004Oh-9Q; Thu, 30 Mar 2023 15:44:51 +0000
Received: by outflank-mailman (input) for mailman id 516781;
 Thu, 30 Mar 2023 15:44:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiWc=7W=citrix.com=prvs=446b09b9a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phuSH-0004Ob-RW
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 15:44:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb3a5a7f-cf11-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 17:44:46 +0200 (CEST)
Received: from mail-dm6nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 11:44:43 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5163.namprd03.prod.outlook.com (2603:10b6:5:22b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 15:44:41 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Thu, 30 Mar 2023
 15:44:41 +0000
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
X-Inumbo-ID: cb3a5a7f-cf11-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680191086;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=a+GwM7p5K9GJNs2alCHcirrZ7MwehNLuVidonvdeyWQ=;
  b=T4hfQLrYVyNxJqlJnZ97/BA5jLJNAT0bSPn7IBH2SaEio6AC8EanG7rm
   3oqq2vVgfNR5EUQw1Wx8VOmLA/PppvcrLKn8M0NO/h3KREBDvk+o2YN7/
   X1Z+zBY+adeibI00TqV6nJNFE1GW2iSq5fc0x/4fUjrpcEMFTFP1KOy1A
   4=;
X-IronPort-RemoteIP: 104.47.73.46
X-IronPort-MID: 104111598
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YO69zK6NOYj6O9Be2neGfwxRtArGchMFZxGqfqrLsTDasY5as4F+v
 jAWDGDSOKzZZDSkftxzPou/9R4CuJDdm9ZgGgts/HhmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasQ5AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 NpJIyorUhe42eebkKjmbu9HidstI5y+VG8fkikIITDxK98DGcyGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0otjtABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXwXqiAd9DRNVU8NZlpmfN50o9GSQoVEGkhtuWgFTufIxQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmIw7DR6hyUBUAFSCBAc90ssMIqRT0s2
 USNltmvDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OKu8j9mwFTSux
 TmP9HQ6n+9L0ZBN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLtm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:Sm6X/K/6WtESljnHs4huk+GYdr1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQkdcdDpAsm9qADnhOVICOgqTP+ftWzd01dAQ7sSi7cKrwePJ8TezJ846U
 4CSdk0NDSTNykCsS+S2mDRLz9J+qjDzEnCv5a8854Zd3AOV0gW1XYaNu/0KCxLrIAsP/AE/B
 T13LsAmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlKl9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4Uow3TX+0qVjbZaKvO/VQMO0aCSAZER4Z
 nxSiIbTotOArXqDyKISFXWqkvdOX0VmgXfIBej8AbeSIrCNXYH4rF69OVkmpey0TtmgDg06t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/poVFZ9l/1rwKpuKuZ1IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkeoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWQKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniee/GmzdlO6FTAUW+9VTPixoVV7510vbD1X/7wPTaCREprk8y7vv0ZCMGeW/
 vbAuMpPxYiFxqcJW9k5XyPZ3AJEwhjbCQ8gKdLZ26z
X-IronPort-AV: E=Sophos;i="5.98,305,1673931600"; 
   d="scan'208";a="104111598"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cc0lmtxWfDEu9dAPHo8TOOsNRGN720ZiRof7QNOT7ZGMu3kwxZgIzUsVCwuectj1WMmpZIoITMOb9/86VywWBkfjotXR6tdXAo9vQ4JFoJSdQ5hUIn3xgrkAC8zXybA2U2ADg0oHHRupWS05VMykuZOzjMPXs6NOMWC6b0oB3wWZNV4PnBRNIuPPegO5ZykDpZ1n+poXnSAzsUYfcfXpB3LzqErucWSnLFKBkcRHFDrEW33uM0a4L87zQgUX3m4xW4iMFe11Jm3CTIhS/a19yMLiNFZkTcHdFBhYUADgRcCAOyvbMOImh62nItpTaBfaKfRrxzmx1PRmM9u9T6J/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FJhgGxI+xAdJfNiJr2C96Uyu4FlD2es1J5YxDl4xeQ=;
 b=fMzHGpkJyNjiLvMCTa/vIdJgMYiEbLv1uG2XqnbeDiDVxvPM9afSYjhgbdhFmAtxRd3VZbKpm6uctRzJCExuho0/yzcuwNjWDxd1zF+UgqRdf4N8OHFGKjWiEW1FtSd2xdmLmEE1y4fOo4Jb9mbx/y05SG1/zGcOx24XND+LS5M6VjVEI91YKvxyeCld3srYYHL3vjvBWGzDs6AnNHfjjfZTo+M+1ZMUfs9Nx4FG1+IslR8PFI271MU3EOrrtU/ploUUQ8XwvumWy+QI5cKdvubtP9XuhmYKxVdPh7G+0Cz/XKEdHC/2O4lrqiI8q77FTu8BoE1ET44QIgTUV/g8Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FJhgGxI+xAdJfNiJr2C96Uyu4FlD2es1J5YxDl4xeQ=;
 b=fBaxUd2VyXJJILdB2OWWDvJZN88J+Y/DB2vFvi/zBIfvOgiBGfH2hqhUlgHkIacZjSzF7dSf4Ic6Vl0mgOgFnSX6/nzrMHf0j6/lcPnzGCaJFMfzwMLfF4c811TcQnxuTe8xqStXZxrt8f8rWinaBt+TXPUPniB5iaSgCfWZX/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Mar 2023 17:44:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: marmarek@invisiblethingslab.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] efi: only set a console mode if the current one is
 invalid
Message-ID: <ZCWuYjP7L4obvXt9@Air-de-Roger>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-3-roger.pau@citrix.com>
 <c62446e1-8e47-5fa9-1c7b-a441d38711e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c62446e1-8e47-5fa9-1c7b-a441d38711e6@suse.com>
X-ClientProxiedBy: LO4P123CA0583.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ed8047-5363-466b-0ec4-08db3135ace7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PircOjYDAfbl4gpnhpXZrjrSeiUMk86zexx2ceIhdw7kMDuBaNHFwzhNgQ9e2kNvJFy+MCvWpGbmOvkfv2mNru0KvzRxt0G7xBiT3TaDX4MQmE3aD7uxkI0hTGSKP+IAruxJr4D6fn5QRJtfMd3jYPyTF8IPlGkXOg1cxeXdPrDJOFAwsymuKdS/nw3t/KUy74uBUfv7lBa5daZLpk91rOMrkoC5yPlwuEvqYWsxXPyiwtu58XII9Frs3lao1D93EVIm8QJw9hVAGAYvT9WgDExARg9ayL2zvhpdGcmB6NykU/gslGEqDF/tP/dwfApTPJWqca6aJIqHafv7c/Z1b526eOwwvJnqjlzTMvb+VDBgnQ8n6J2JfPaJG8r64DDN1qUWulgzLeZbcoodwSFIwA2uAbH+rkq/3YcvsFqu2G872H24JRAgux0LOqX3DLQx7d4pacTdcZ6NlYK6o1xhT5Z4CtLE8luSDEkCTEU3OEWKpJwbW7N7k+sLmRjAW82ZR43xNn8xRKOFW/2XKJgjcTrhNfrMZxYQAsFJpIf8zm8P9Ko4p6PdEQeoL5pvgE2N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199021)(6512007)(66476007)(26005)(6666004)(53546011)(82960400001)(316002)(33716001)(6916009)(6506007)(8676002)(478600001)(66946007)(66556008)(4326008)(86362001)(41300700001)(85182001)(5660300002)(9686003)(6486002)(38100700002)(8936002)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDVQR2pocXRwY2x6NFBSMEtkL2xQNXJBQ3FjZVovY0ZrWGZZQnpSdnova2wx?=
 =?utf-8?B?ZFZrSjVYek9hNVdibWdxWHpidG1sWVh1SjRqcXF5RzJBS1NDMXEwK2JuMktr?=
 =?utf-8?B?UEovb005eERQT3l0SFVnWExJU2ZsekNKckk0Q1dndFl2c05BRFI1dEF0cjBi?=
 =?utf-8?B?UG1ETWRLekxDUmFlRWJYOEFRcHJXYTBTUlkxNEhkVG8rczAxd01zVDdUZTl1?=
 =?utf-8?B?STczVG92djliK01kM1BEOUgrclgyN3NyR1lWTlFzNU5VaWVROGJiSllvQzNp?=
 =?utf-8?B?UVhDMWd1bVI3YS9Cb1o5ajlJTE1HdlZ6SkNMQ0F6VU1OaVZJT1B1TVFqS09t?=
 =?utf-8?B?elp1azdUTkJseDljSXR5V1MvVHlYMWE0bnFlbkw1UDI4cE5sdDgyUnZjRDRR?=
 =?utf-8?B?dHh6KzRySFU5N1Yxd2g1M09XSnhVdWdKb0xibzYydDdHUXNTNW0xM2t5OHlh?=
 =?utf-8?B?VnJvSWlQQjk5ZlZzNDh5WU9IZkpDdGpoeWMrRmw0MTRmR0V0RjA3UWlLa05N?=
 =?utf-8?B?VjlXWEJrTGt0OWpkOFdWaXp6ZTdvZm95WVZiRU51Tmlwd05kaEZ3MWxpTyty?=
 =?utf-8?B?cktZSmlVdVhyUEFRc0NKQ0oyREhFcjFsaXZDZlpBc3M1Q3U4MWdqOCsydkpO?=
 =?utf-8?B?WEZhdGlObDBLQSs5Q2RwRUVQLzBnbU1TMldSMEdoZGo0aXNBMWxCcHJGMzIv?=
 =?utf-8?B?OXdlQ0p3ZjNaa2dJNmo3Zm1vbnlrZHVuK0ZGVnMxckNUVzArRDI2ZmZ4b0Iw?=
 =?utf-8?B?NTk2UDhLcWIxdWRJdlpIMy9sTTQ2OUU2VVFja2hSa05sdC9ZUmRJbkRNREJr?=
 =?utf-8?B?dENHeHN6ZktCaUxpc2JJaU1adC9tcWRNNTZtWTlIc0tzdFUxZGt5bHFRaDZY?=
 =?utf-8?B?RloyOTVvR2pKTG1GSUEzYXJ1SmNEbDVzZ3lnQ3RmYnozUWlVOW1wUWdUZCtw?=
 =?utf-8?B?TjdKRWhjanZKRWp4SktQVkd5cHBhdTNBZTFMdVlSSUt4L0NjVjI2MVpYTW8z?=
 =?utf-8?B?R283UFc4RC8xT01MWXU0NlZoMEpIWEt6SlBKWVQ2bFUrbVQvVzBSaU5TaWhN?=
 =?utf-8?B?b0RrTlAvSk1PVEQ4MVdLcmgwRklpSmluOWVFVEpaVG5pQTBVMEIyS2l3dmNr?=
 =?utf-8?B?RmRzNis5V0krOEdIUzhSZDhvYkQ5aXVVQUNXNVB6aGErR1FYdENud0lBU052?=
 =?utf-8?B?OXlobW9hUEZWOHV1OXZyV2Q0NmtZaE5WdjgrYlVDSGZNY1p1RU5JaVNyb0hF?=
 =?utf-8?B?OW9RbkRneUNoN1U1OTRFQWZBRFFSMUh5bVUzVHVTakVXbndvbUpEdSs4bUV6?=
 =?utf-8?B?Q3dCdjdyUFB0YVk4alNrTDczaWt4Q1hMNmFJRnVxMkxYc0NIakR3VXJrT2Y5?=
 =?utf-8?B?MVBxMVMvMnE0Z3dSVWsrSENacmxNZXBrVTYzb2U4ZjFHMkxTN2lOK2UxaTNS?=
 =?utf-8?B?bmdNcVlCR01XdnIyRHN3RFFpN1A1M1N6c0JwQzVtVEhTeWc0WGliU2dyQy92?=
 =?utf-8?B?RHpsQ0x1TUROZFcwZFpvVTJjVlY1RmFJYzhNSUY1cHlwUENTT3FkMzdWQ09m?=
 =?utf-8?B?dUdOVWx6OEFaOGlmQktsbFh0enBVMWZkM2N5cG45NlB4ajFEeHBUeHhKUDE0?=
 =?utf-8?B?dy9UV2JKVjM5NGRTVHMvUEVuMnV1YmxUQ0k5c003SlN3U3JTOHh6SkZ2MXc2?=
 =?utf-8?B?OWxYUDZZYVo2b2g0cWJhbVpYSnRZYVFQNWVLc0tTbWJhQjNRbUlsNVBDZkZl?=
 =?utf-8?B?aHpvRDIxeW5zdGM1UlZnQW5ZejJqMUE5T004TnhTMXhHejBlQ3FZd1dTSmV1?=
 =?utf-8?B?b3RrRDVwbTZtcWt1Y21lTGJ5RTNVYWxvZ29iWGE3TnNZVVVzZnVlVGNZSXEr?=
 =?utf-8?B?dDVtangxRzl1bkJvKzV5WThyUkxEdk1DWEt6d1ZQREFyamQ3eVdqZjRZeDBQ?=
 =?utf-8?B?TjllRGFzS2FkMWdheEc5czZFcXNiT3M2RTUzTURNdmZMS1k2MUg5bXB6ZnZU?=
 =?utf-8?B?YlpRNWxQaDJkdUxLdWlBTytjcUZtU3lDZ0RvNEZJRE0zTkZYUFNORitOeE85?=
 =?utf-8?B?WDRNM012Rm0ralFnc2tmSW9YL2VSTW5heDNHZjN2N09xN1RjUmQ2Rmt6WWU0?=
 =?utf-8?Q?9wyFWrY/eVGhH/z5JAU365uc5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G2Op/5sFOyt0MkgVjqbtwkCnbwakqNxIB0pd8f9xkC4Fmw5hGz2dg08ksxqG9gIO4HUT6ov289XOk4UxPZZFiNG4MHCusqXkRfODM2peNbW4x5lzkrz4QO9LqkSjXg//ukovKUDx3B6+gzXWlaCOxGGFfpSn8C8zDrq3UgHLU8yndkeMK6zmB3hLZo9Gv2m7ZSNQoEg2gpRFRitY9FSODsEkA1fsZs7t0/3baDdlaCOKTfy5bpFnDsjKo/3KNcDDhjfh/T6gqk4mhABKChThoPN7TnhAggHR8Y6dv/R+rXxR/oAGrVekIkbq57eBoI3OCtDdO7CrH0yGi4vemIh1Zyh1eZMIu3J3H4BGjIfeyeeyXO4wskgz5/Sg1TXK7cymjUsQaO9HHECR5AkkD6tbXIvdBlHDUN6/VsUqySLDf4v2WUkyNWcppLqrqR4dF8LALTGvWOmimF89Rw23M/VwdVUy4jiHk7HxeKh/GDBrmWsndiqy6jhu3qqrK4ZOOzr/Kd1eMkSNVR4oJRbpYT9MigVndfurBD9l7Jd4D/NfussjcBkT5zOXHYzIwI2YG80kJfi8KYlHhB/q6PqLl7lplmFcPC93EevacENFXHgYjXssa79ez3PBINgCjQyLVwIyhVgDPUg3I5EWFnhrwrJCnaumMWH6j8CgT5GeXDWfJ96k+v24a+3/19pzznetOz1GIo8LyHWgKWAnhIxPrd7HM8NrO+7mRo8ZRkOO6nxQ6IDn6OaSiwEGdrCOMqegmxGPY+nXzMNhj/uUA8SzEC7N/e8QyaTUisxNrTdMGCkIfNOE+c5UnITQS5TtXB0vo66N/9viOPAA1IMzzCoskc4eze22VXs7WetRMw+7NCytHUg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ed8047-5363-466b-0ec4-08db3135ace7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:44:40.9876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fymsq18no+Ewl/UcwePEzXf0mHkk0agWExPd90WVfhpgHJxtApEBb/O/ee9j5yfpopdsajSJKttsXeaFn4MUPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5163

On Mon, Dec 05, 2022 at 03:19:13PM +0100, Jan Beulich wrote:
> On 23.11.2022 16:45, Roger Pau Monne wrote:
> > Do not unconditionally set a mode in efi_console_set_mode(), do so
> > only if the currently set mode is not valid.
> 
> You don't say why you want to do so. Furthermore ...
> 
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -799,6 +799,11 @@ static void __init efi_console_set_mode(void)
> >      UINTN cols, rows, size;
> >      unsigned int best, i;
> >  
> > +    /* Only set a mode if the current one is not valid. */
> > +    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode, &cols, &rows) ==
> > +         EFI_SUCCESS )
> > +        return;
> 
> ... it might be okay if you put such a check in efi_multiboot2(), but
> the call here from efi_start() is specifically guarded by a check of
> whether "-basevideo" was passed to xen.efi. This _may_ not be as
> relevant anymore today, but it certainly was 20 years ago (recall
> that we've inherited this code from a much older project of ours) -
> at that time EFI usually started in 80x25 text mode. And I think that
> even today when you end up launching xen.efi from the EFI shell,
> you'd be stuck with 80x25 text mode on at least some implementations.

Won't you use console=vga vga=gfx-...

To switch to a best mode?

> Overall, looking at (for now) just the titles of subsequent patches,
> I'm not convinced the change here is needed at all. Or if anything it
> may want to go at the end, taking action only when "vga=current" was
> specified.

I guess I'm slightly confused by the usage of both GOP and StdOut, I
would assume if we have a gop, and can correctly initialize it there's
no need to fiddle with StdOut also?

Thanks, Roger.

