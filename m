Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F015344B89
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 17:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100371.191188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONX4-0004qw-1D; Mon, 22 Mar 2021 16:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100371.191188; Mon, 22 Mar 2021 16:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONX3-0004qW-Tn; Mon, 22 Mar 2021 16:35:57 +0000
Received: by outflank-mailman (input) for mailman id 100371;
 Mon, 22 Mar 2021 16:35:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSIZ=IU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lONX2-0004qR-N3
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 16:35:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e907e63-9de5-410f-af48-0aaa9061c69e;
 Mon, 22 Mar 2021 16:35:55 +0000 (UTC)
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
X-Inumbo-ID: 5e907e63-9de5-410f-af48-0aaa9061c69e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616430955;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=61rUhLM+UZf/K/gBDqfpryxPK0ZOcihIw7fPC067+bY=;
  b=b4GS23MoXwh54hakL6zRbPcIJ/jK14iUYmLJUD5E80ZV+Rv34f3vlM5X
   dvku/6JaW6JbivKRFjhwAvkfNvPUgTuEySBR+uUk8NfOibmT05IpC9fWN
   uSD6tU6KFVt3b5sZiLrTKVd/XBHDOpRXTYKjvNiSiXgzbhQRkdQw+X82W
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bcLKy1VG/wKD9EBA/RIzeIgPZ5Yorn9f0tKNPiOGj5kyCWflWCLrwr2c7tcmeGRoo0L/pS9jNg
 0BS0V1lw8JwhJb/gfc7yXkQeF87K3YsCRiJ3ps5RjP8XZAswYqZyz0IK+6aY4QEB/Oon5mF3Ow
 pzvyqA5OuJsLL+sl484Fnbs8hQ2iGwovBriy1rGlnlM1RG25Ir5twQNwpjfEfobYb9bC18IlqM
 FPYKqioQcxuBsW9jdRAyphKTwEpwSBCUH2RbHWN+uj0v52WfzxneB83jwfRM04Mll0vCcF5RbO
 dko=
X-SBRS: 5.2
X-MesageID: 39722982
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2zQ3eaPnaeNt4sBcT0jw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQiztRIACdD0FwWU1iDZ02CJ
 KT6qN81kWdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LV1JfRFR+E0hACFw5e2LtKyx
 m5ryXVxIWG98u6xBjVynPJ4/1t9ufJ59NfCKW3+7AoAxr2jALAXvUGZ5Sju3QPrPir+BIWlr
 D30m0dFuBSz1+UQW2vuxvq3GDboUUTwlvv00WRj3emgeGRfkNCN+N7iYhUcgTU5iMb1bkWus
 I7vBPti7NtARzNhyj77dTTPisa8XacmnY+jfUVy0VWTIp2Us4gkaUk4EhXHJ0cdRiKirwPLe
 8GNrC42N9ra1+AK1jWsm5zqebcJUgbL1OtR0gPvdGtyD5GnHx15Ftw/r1vol4wsL06UJVK/O
 LCL+BBk6xPVNYfaeZHCP4GWtbfMB2AfTv8dEapZXj3HqAOPHzA77bx/bUO/emvPLgF1oE7lp
 jtWE5R3FRCNH7GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7CLTCDYEpGqbrhn9wvRungH9
 qjMpNfBPHuaUH0H5xS4gH4U55ObVEDTcwuvMohUV7mmLOLFqTa8sjgNNrDLrvkFjgpHknlBG
 EYYTT1LMJcqm+xXHvVhwXQRmPNdkTz8YkYKtmZw8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJPr+5nL4FWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIms9WbcmZC4WufKnZEPofrOT
 8ag24y1bO8LpSWyyxnIcmgKHimg3wao2/PaJsAhKuZ54PAdokjBpgrHIx9fD+7WSBdqEJPki
 NueQUETkjQGnfFkqO+lqEZA+nZap1bmwekIcldrFrFrkWCrcQTRn8WNgTeEvK/sEILfX55l1
 dx+6gQjP6rgjC0M1Yyh+w+LRlxcmiNOalHCw6EfY1QvbjudGhLPCC3rA3fryt2Vnvh9k0UiG
 CkCSGPY/nEDmBQvW1i3r/w/El5cXiceExMeml32LcNZ1juizJW66umd6Cz22yeZh85zuYRPC
 rsTBESLgltrurHnyK9qXKnLzEL158uNuvSAPAfaLnVwGqqM5DNv7oBBeVo8JFsM83OvucHXf
 mEQRKcKCr1BooSqkqoj0dgHBMxjnYqkfnlgkK4qEe52WMyGvrULhBNQaoBL9SV8mjjQLKp3f
 xC/KUIlNr1Fl+0TNiMjZzzRXpkDDj4pGatVeEmqZxOp8sJxfNONqiedQGN7W1N2RU1Edz9m0
 wfSplq+bypAP4aQ+UiPwZiumcznNuBLEEXohX7L+83c1YqlWLaNbqyksz1gItqJk2Kvw3rP1
 aDtwVb4vfeRiOGvIRqQZ4YECBzaEIm7m5l8/7HX4rMCB+yf+UG2FahKHeyfPt8T6eCcI9g4y
 pS0pWtn+WNcTD/1x2VlTxnIrhW+2LiePiMOmu3aKd12u3/H0+NjKus6NOyizmyaQLTUTVnua
 R1MWoKbspCjTE+ipYQySbacN2vnn4Y
X-IronPort-AV: E=Sophos;i="5.81,269,1610427600"; 
   d="scan'208";a="39722982"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSmFyJDOMt3mlGqJagnk2CpV+hiUdBvYFThXGtECp6tMK+eUC7ZaOqCLo2W4XzIudWD9NM6WxWdXAQb8WBIcf0oSRlkJm6WhiV1R6Z8pFXCXkidpQfbU2H+XWz6REGS4oDxLjFs9DjZ/Ck30Kt0rYC7zFRYCiIlSEg+5G8rwwPMlOwCffn4Dn0voWA68wRi5JlUyA0sDQ+EbEnsWa69HYHqtHwfJIKvvZNI1INESBAx1aHKteCisNgO9f48LL9A6Ufsr4owAiloCrT7nK6+Tf1NoHBmzzmUEKPd6PYzLRYgmkDd3xlhV738Y5/b+KES6OR+P48KcARAxm2L4P9nkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61rUhLM+UZf/K/gBDqfpryxPK0ZOcihIw7fPC067+bY=;
 b=hqwb3JKlqk4uKKRwzxYNPIUq4kW64MOnxvpip/I4O4+lIYHaYcVb24DxEXniITZNnCtCzEla7I+jLjQlEtyjFh+6hi1h0sSCKYRdNH9WCU7lyrdswrSg2aCUYeV37+gFaHoWzbPoCSZbFOqzrrPSUfaQl5oQ+J2gVZ6yLBJ+JV0q24T1TcZNWd4ADfe7kqBseaSUOb109Ykrg2/un2zgDW9K8tjZtCR80Q5AM2iA6iusu1lTTY8kCn3+hZ9jFvDtY4L2QNWeBscdanp/SBentAHumovq74yjjom6LKJEMvbg1bAKagBRk39f8H2av7IVReOqhORcdjEiX7b5pxfbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61rUhLM+UZf/K/gBDqfpryxPK0ZOcihIw7fPC067+bY=;
 b=hY8UErlruj1Ky/9FS+VBZPGfu6zR/YDauQVQkUUXXusMaKi49EvMDcAXxLCvtrpxy7bdW1xMEQVrq+tsHXp7YT1px1brU5dz77/+riA6XWstzAGToH9tLjHp+MDHdkrrNvsEuH2jZ0xgJV3ifRJPA3xn2EKSW5DFW9932GN0IjI=
Subject: Re: [PATCH for-4.14] tools: Fix pkg-config file for libxenstore
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<JBeulich@suse.com>
References: <20210322162013.12639-1-andrew.cooper3@citrix.com>
 <0a006343-4d2c-acd7-d2ce-abd04220e0de@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1926a28a-2fea-33c6-b729-5a9b4692da58@citrix.com>
Date: Mon, 22 Mar 2021 16:35:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <0a006343-4d2c-acd7-d2ce-abd04220e0de@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0286.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::34) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5ed6d38-7033-4ae0-3337-08d8ed508f38
X-MS-TrafficTypeDiagnostic: BN3PR03MB2372:
X-Microsoft-Antispam-PRVS: <BN3PR03MB2372A7FF7F0FAB770BAF2CA5BA659@BN3PR03MB2372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMqh/wm/Uif2f6IgKGe3qeiW/dnAS6OHzvBYUoYlf2YnagLRpBmFQIzKB9u58VuEDZtF1QcUUJY8SYCZRdxOCZeIxWc05neK1fY2l6DVZyJzBOPYvHY6LVztbjU06rUkPDrjBHU/OL5pkb5rEtKoFaJbiXlH2fvFoDmfedViC7jWEqk2x4sBzS11U93DBc0ikcTAw6n7rIgnAu3JzSaKJXLOUn32/hZeTXoAxkZaFEtdBPR9nWiL1HborsFk+p6TBT0lcyBicw5M/nyhEELqNoios1FDvt1AAzQXMQpwMDsDX1S2l/f7/lPj3NLT/ljXZ5sB1XNvzN05QuuUoz4otcS4TptC1RBPNS4SpeLeJIlseTB+JBHstfXPMC6LbuAZd6eurLVYWOoNMUzf/Lz9GZH85bG7ZzrBvET1bApFEj3r8+zm0I/u+EJ0vH417GNiCi0IUPewe1ZibibsT3A0L8oeUNT8NFcDrbubTOxfPjOFZSV9+3+nsOgskS/Bf+TkH4EPF9WOvQn+CCeeOQ7hquvwXoNkfvVbQjNQPrB8kS9OoYOR+9fczl3eLArlxsnGBl8rbHUU2PgRyn7m0ak5x104CH8IDaj7vqf5ndRq2HwqtheBzQVYRoWaND8Ma9lCoKt06+BtnC7nVZybasrZgPS4PBa5mpfC0RW/gg34RPr/z1LX8IX9EJZpAxUj22/d4H9KJyhAN073WV28oIJjOD5Qnukm9kmiZOXsAUhn90A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(16576012)(66946007)(66556008)(66476007)(186003)(16526019)(54906003)(53546011)(956004)(8676002)(2616005)(26005)(86362001)(31686004)(316002)(110136005)(2906002)(8936002)(66574015)(31696002)(36756003)(83380400001)(5660300002)(6486002)(6666004)(478600001)(4326008)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cDRqa1RCYXgyTitmQjBVY2w1OVpiZzlHMFU4bE8ybUN6MkZzRUpwY2xTYlkr?=
 =?utf-8?B?V0taS21rdFY2Q2o2OTVRTm5nZkVsdFVPaiswdHhZM20xVE91NTR4d2NUaWsv?=
 =?utf-8?B?RU91a0ZwUXpiQWdON3UyWFdOSk5nMlZkRG9VOUtkMm9hMnRZb2dpL2EyM3Ft?=
 =?utf-8?B?TU9LMzczaFd6bWhGVW8wb3B2eW82bko3VERQWmVDVFVhNnFMVVlUOE44MFJG?=
 =?utf-8?B?T1A5THhGMjlVclh2VlRGRTFtQXNNY2JzSmd6d1V3RDlPVkgyMzhZeTlLVjVC?=
 =?utf-8?B?eHd0QjAzT1JlbjdwSFhZZEVhSHg5SkRPc2Jjb0dtNjgzNG5Day9tb2lDQ2tV?=
 =?utf-8?B?UlNWK0lkUWVmaXJ1QXpPLzAzdUhMRzd0d2JVMFgrMVJpelA2L2tteDJjTU05?=
 =?utf-8?B?dEkreXJES1VSRVhVTlI0RUNwNlpBekI1QkZDQWp0T081ZFFYK0pkcUxtNW53?=
 =?utf-8?B?dlVTazJpcnRsTUhYSUZkMnhzWGw0NGQrSWZVTlF5Y01pMHp1TzRzNG1sajJE?=
 =?utf-8?B?TnBDL3Evck5pZVNCaVpZYVlNZDNwbHlCOXV5Titqa3dmekJUYXBjOWM0bVFv?=
 =?utf-8?B?cmttNFJMVGJQdjkydzJkbndhQnR0dkM0U3NqR01TNjk1YXJJQ1lYRkdwb2Na?=
 =?utf-8?B?K0hWZ3JUVnlLS3NqamJUb1dhbnFmb0RQTHlDR2djakl4S245NHJhVW9iYnlx?=
 =?utf-8?B?YTVNZ0JuQjg4N1dSLzY1cG9LZHM2emRmUUU1S1hOZmRiWWhGYzd6WElzcFZu?=
 =?utf-8?B?N3ZlbzBSczRGeHZMcGtNZm5jaDBZNjVIajRURWZuYWkvY2hIanZEbTlBUVVs?=
 =?utf-8?B?RkhNd3IyeEJTR2N3UUNoN2tXVVBpRTQyYi95ZHZnY1dZZE85VWtpRlNodFRy?=
 =?utf-8?B?OXNGOVZrVWFGN2RteDZlRVhhT1hiQjFJVG9KWng5d2VoWXZ3U0Q2Z2V2UW1L?=
 =?utf-8?B?eXMxN3MvOVVyTllDeVBrRUw4OVVEYkZxM2dPaENLNi9peWQxRlJUWlBuekVO?=
 =?utf-8?B?aXZkQWMvUllsZzgwTGpCemE4K0JzUWNQUVhsTlMrRHY1NUVpOHdNQXlnN0NQ?=
 =?utf-8?B?UDFpRk9VT2VvQ1pBR1FHcEpvVTJwdlNhcUZ6bDRXQlBSUnYxS3kyNHBnSzFw?=
 =?utf-8?B?ekNsVHFIUHFxZlp2TlJBYkdEVjdLa2daRHJNbU1XWHE4T2JXOUFJeGlLZGoz?=
 =?utf-8?B?anNBNDJJaHMyelVldVJuZFFzTnJxeU5DVEptSzRTU2w5ckNZdHFIbHJnQk1i?=
 =?utf-8?B?MkQrMHZJcnlMYTZhVitISkswLzRQYmxHbGdMTlVvUUY2cFdHRUpwWUpreG5R?=
 =?utf-8?B?ZGpvWmhtQlNsTyt6a1NsY1pGZXhFRE9hVExlL0lGUWkzczBnbjhkZE9uMVRL?=
 =?utf-8?B?WHR6bk4rN1dJSCthdWkzQWd3WDNyaVRqYTkrS0lnM3NXWEREVEJhMncvQm5k?=
 =?utf-8?B?SHl3WDRpSURib3lDTW85d2Z6TkkyMDNNTC9RSXhHWVRST2NyWUpUWGs2dWc3?=
 =?utf-8?B?NlZXSTYwa05wbFJZdlFsZlc3NE9XNFQ2MGlIalZvenZkK2V3YjNoOXBLZGEz?=
 =?utf-8?B?c2t3eVdFNW1BL0ZNbE1VVFptS1dkeFY2QXdlWEVqdi9RTFFCWDFiVTc1bFlE?=
 =?utf-8?B?REZBQnNDb2JvendmM2t0OVNncVZSM25NZFM1RldjWW9HZG04WTFrYlFpU1dL?=
 =?utf-8?B?ZEZDMkpZK0JzK1RxMHkxUTBhTjRvbVdFUkRSTW54aExibU1nY1VxVjRnc0hD?=
 =?utf-8?Q?O+ZDEfhUcnp8uWWZQM9KmhEwCRbuiPk14s1McPU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ed6d38-7033-4ae0-3337-08d8ed508f38
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 16:35:53.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Bssbo7+IjchjLk+cERdYJkjN1ZiDtMTUDpPO7FNBI8Z1YMHqULgb2ijmgl0lDoPYQIIKpQnnfbvXMy8u3kSdKgN92V4AbUmUl2z7m54WiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2372
X-OriginatorOrg: citrix.com

On 22/03/2021 16:32, Jürgen Groß wrote:
> On 22.03.21 17:20, Andrew Cooper wrote:
>> There is no dependency on libxenctrl.
>>
>> Fixes: 1b008e99 ("tools: provide pkg-config file for libxenstore")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Ian Jackson <iwj@xenproject.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>>
>> This has been fixed in Xen 4.15 by the uselibs.mk logic, but 4.14 and
>> older
>> cause everything linking against libxenstore to also try linking against
>> libxenctrl.  It also causes RPM to create unexpected dependencies
>> between
>> subpackages, which is a problem when trying to separate the stable and
>> unstable libs.
>> ---
>>   tools/xenstore/xenstore.pc.in | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/xenstore/xenstore.pc.in
>> b/tools/xenstore/xenstore.pc.in
>> index 2f64a6b824..98c3f1ab39 100644
>> --- a/tools/xenstore/xenstore.pc.in
>> +++ b/tools/xenstore/xenstore.pc.in
>> @@ -8,4 +8,4 @@ Version: @@version@@
>>   Cflags: -I${includedir} @@cflagslocal@@
>>   Libs: @@libsflag@@${libdir} -lxenstore
>>   Libs.private: -ldl
>> -Requires.private: xenevtchn,xencontrol,xengnttab,xentoolcore
>> +Requires.private: xenevtchn,xengnttab,xentoolcore
>
> Any reason you are keeping xenevtchn and xengnttab?

Oh - good point.  I misread uselibs.  Its only toolcore who's dependency
remains in 4.15.

I'll send out a v2.

~Andrew

