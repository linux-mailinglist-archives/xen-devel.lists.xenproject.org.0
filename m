Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FEB6D45C1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 15:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517449.802776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjKDH-000372-2B; Mon, 03 Apr 2023 13:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517449.802776; Mon, 03 Apr 2023 13:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjKDG-00033y-Tx; Mon, 03 Apr 2023 13:27:10 +0000
Received: by outflank-mailman (input) for mailman id 517449;
 Mon, 03 Apr 2023 13:27:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/KQ=72=citrix.com=prvs=450b71a79=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjKDE-00033s-Im
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 13:27:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 388c2b9d-d223-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 15:27:05 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 09:26:52 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BLAPR03MB5410.namprd03.prod.outlook.com (2603:10b6:208:29c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 13:26:49 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 13:26:49 +0000
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
X-Inumbo-ID: 388c2b9d-d223-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680528425;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t1fkTL8HsOL6DzgWpK3QGHaxBLd4HWSxC4csE9hEYPc=;
  b=JQXzfvWZC0vM2zpdvo1C59xE1WTUfg3BtehPIaASzi9dRGos/Pm1gEhB
   +BA2LW1BIKxcZ/YNxPNU77OYRoUB7g5s/XeOA5+SzNuj12Bo2Xxgo4bux
   HK6P0Uzrbv1D8z/L4YPDOxI+MZoLM92pn20Rxgx+J6jTkYp4BMOWcLW5U
   c=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 106547825
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lVpx7KibkeP8VPf9HdoBkkubX161RxEKZh0ujC45NGQN5FlHY01je
 htvUGnUbPnca2Dwe4olOYy0p0MBu8fTy9A3QFM++ysyRn8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQcLQoMNjCcwNipnr/jUttmmYcdN+j0adZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluSyWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHulBd5NROflnhJsqFSP61VQIQUPbGuygN2mt2fhSu0OC
 VNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQEnsIrQT0h1
 neSgsjkQzdotdW9Vna15rqS6zSoNkAowXQqYCYFSU4A/IPlqYRq1BbXFI4/T+iyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsjA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:MY017a18yJU3K80J7x1G2wqjBAkkLtp133Aq2lEZdPWaSK2lfq
 eV7ZImPH7P+VEssRQb8+xoV5PsfZqxz/JICMwqTNSftOePghrVEGgg1/qe/9XYcxeOidK1rJ
 0QDZSWaueRMbEKt7ef3ODiKadY/DDvysnB7ts2jU0dLz2CDZsO0+4TMHf/LqQZfmd77LMCZe
 uhz/sCiTq8WGgdKv+2DmMCWIH41qf2vaOjTx4aJgItrDKDhzOw6LL8DnGjr2wjegIK77c+0H
 TP1zf07KW7s/2911v12mLJ445N8eGRuudrNYijitU1Nj6psAquaYh7MofyxAwInA==
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="106547825"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mB1mmXF+aylgBGjOWaPSQlAFMio6He+ps3MaWmk1+PqKcp02EeGbaWQoLXrovAtw41RC0MDy1cB0Yf5hCJWlkTLYMYeSntea2+xhKXqeVVASI1ohy3noBUUwggMQS/lpvP/ftCO0XHl4/OCDav7Vc7YNqhbn8E45YCBE7SK//Yr/zhGc0EzRoGG3aopIn8zf6UtchctwFt8Bev4RIeCGREXbRG+pOhyf4fH3Cw7Z2NJMkTPiuaMeZpcYmUbHTIu7dxKsiqVjOsWhRF434E6QfcqXL9zzR0ejPX3kkSkWIgK6fhazsesOeJmDtKwcOfYTnpyXQIAFqRegIMdAJOxeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuyfu2/BsHus3kHZGId7MNczCmHstVKYik7fQ1vMBSI=;
 b=mXe2PDdASLPCtoeViNadZDC16EsdXq7ZDpcQ+uMHM2G66RP/wLaxWwsAA9DLVBetQIFq8T2BSUSdtUOP5v/fbKMbEC7Y7Zg6ZzBkTlSs74TSOsDYTbnUwW55WOCf8inEOT49Cyb1R7TwKXKv7uNKNzpve7DwBsVVbd7+Dwp24KtP6aGETQ2l16q6pMBATlHkGdyDDmC/runZNmPQek2N1L506zrcyBUYACPgCngpY1T8aL9VT5HDKGyHzK0n/qGAcok2RferIDq030L1hhtO7POwwga0ax8RWeqrJdOcDevM5VcX7FGCs7i/sBVRl8YgD8Vd8zOyw4KHfzto9AHP0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuyfu2/BsHus3kHZGId7MNczCmHstVKYik7fQ1vMBSI=;
 b=Q3dPnquMKELdRylRMWfWtLDun0HpNN39Jxm1MkXL2K+dFUICxAbtz5hg5h0GRV1eP/uhuKYNxlv2ZQLxYYVS1OYIQmGwKmSurrfw9F1Ezg6jCJ3RMXoojqhoXZ32FVXnGtq1zhwbU+lDZbpzxTXIawlqGF7fUQHeNA2gVB4kptM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Apr 2023 15:26:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/pci: Correct ECS handling with CF8/CFC emulation
Message-ID: <ZCrUErZZkd6co1Dq@Air-de-Roger>
References: <20230331175719.500285-1-andrew.cooper3@citrix.com>
 <ZCqVEHe1Qo3skeVf@Air-de-Roger>
 <4b76def9-9940-ccf0-8050-12ddf2c1253c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b76def9-9940-ccf0-8050-12ddf2c1253c@citrix.com>
X-ClientProxiedBy: LO2P265CA0142.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::34) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BLAPR03MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bd20a4-5c87-4e72-e82c-08db34471472
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jXyyPQ0ViY0rMp6AJmgwsTKxLZVIEgO7N6qSzD11XuTq1viEP5lRDtFJUD2dIduyk+nN/xIfz54a7o4NMCEiygbwrAnBAUAxpnGHF47NNnALnk7Z4iztDsed7nWKUNzt92UspqFFn9dYKEPkfQBWmaHFtg+TivYWS1rvQgBmdOgiTMPfOi3GK9BgB/FpUaCXAZKRNNiUzUKimoqoEZ5JOBMq0cTPqulw48NueAMzBOhSx9ZwXx76ak0ije8RPnEMRApFcCxKc2GoXEsLY/9ZpvcbeUU1x8H2qiopsYbnnJSS2GpcYzD4tipZnKUYLNz0tKfAiRL6XvUjQ8daU7A+758FLgvmWWX5Dm/Fwjm5xt7KTblJtXIh8uUu7PAZZTtIbK0idyifckcnCCPfStWYffjztjr3/IEwOngGdsOR8ambDeZVBBhV1iwIVkszFwYhdWLRz4Y/AAv7MrjfnbJtmvi1cLe2x0Uj7fX17v1BuQKPe+sfC0R0piwUVoq+9kXDuaPTDhLvOShGdtxqY6g/QIUEdBy6tJ6UeAKYzIb1cj0BaJFVGk39Q9zCOwMBTxS8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(38100700002)(30864003)(5660300002)(83380400001)(54906003)(316002)(6636002)(6486002)(33716001)(478600001)(186003)(53546011)(86362001)(6666004)(9686003)(26005)(6512007)(6506007)(82960400001)(85182001)(41300700001)(8676002)(4326008)(66556008)(6862004)(66946007)(66476007)(8936002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2tnMHZ4Z25PaVFHbnVRM1I3Z0pUU3lzUGJIcEs2bFJUbHpDcU10SE1LS2hG?=
 =?utf-8?B?WWxVcHhmUWtzV0hqZW4xbGZBU3B4NCtxS2FYTVhKNVdNRi9VUUlGYkM0VkRC?=
 =?utf-8?B?eW5ydDJmWmxheTRSdUwySFpBTEYxaUxZOWVtUTRiRHQ1eWRHbHgza2ZaNFpY?=
 =?utf-8?B?bU5WTVhSYmxaQXJ1QXZUbjVab0N3bUhHTlhTS1djdXFsbCtMVGMxRmpCd0tB?=
 =?utf-8?B?VHJZMExVK0tIOWxIMkJjVWRqNy9Ob1pHOU9aWUV4bVd6YWM1azFZSWlQUmx0?=
 =?utf-8?B?dUdReUROelZpR3RqTGFwS1lDRTBhWGRUbE0zNisrNGVubE96V0ZlSlRsVSta?=
 =?utf-8?B?YkFwTW5LRFpucU5jOU81bTBJLzh4TW5FcmEya2NnL0MxTUdIMFZZYUxrZ3ps?=
 =?utf-8?B?RXBldkJPeE9SR3hjTEhCUndFejNoNzVVaHE2NENRNHc2N0EzUnZpL1NDbEF3?=
 =?utf-8?B?enJNZUVTS0VNTm1Qam8ydlUzWDBwV2JPcnR6aERXcXZCRTR1L3ZBSE9uR3FV?=
 =?utf-8?B?cVdvS3J2dDRxT3RWTXJRUFA0MllvMlZMaWdMbTVPU0xXb3pPZFlCY2gxbGtO?=
 =?utf-8?B?WFpNRDV5eXQ3d24raXdHUGdUdjFxZnRBR2poWUZXaHE4TFdsU0tLbEdFelpw?=
 =?utf-8?B?cm1hUzlzRFY5WUh1Vm4rMlhvemNhUEtHZXh4RnBYTjlrUVQrZFZCbHhWREFu?=
 =?utf-8?B?dm1ndStObzNqLzBHaWVMWHhnbmxiN0gzbFNpYmFOQndYbHpueXQ0aHJBcVlh?=
 =?utf-8?B?N2hlT2NZSTA0L1d0N3RmSVUraExRMUJoZVhZYStRdm1nb1FpL0s4cWN6MW96?=
 =?utf-8?B?YWFMUzNkU3hzM2d4T2Z6RXY5TkVPT1phK05OQklDaXNCSVdxQmxWZXJjNmE4?=
 =?utf-8?B?QXNBOWFDNDhOKytwaCtsZC9Bc3hOOXk1RjRteTRaLzNEWEVlcDJ0a3gyZ1JL?=
 =?utf-8?B?NUxDUXZaeThPNmNDSmNXWmxTOHVDOUkyYUsrRWVncTVlYVVUWWJNQUt4c1lu?=
 =?utf-8?B?Y3hnZTl5cXVSMmJRVG5keitlV3lCQ0liU2dYMHlReWhEZ0pTTTZ0QnJqMkZC?=
 =?utf-8?B?cjQ5S3lvWThaekFJeVh4bHFLaTNDY1BHcEZOZFdiZFlQazRIeVprTndCKzVJ?=
 =?utf-8?B?aFEzYXRwbmNjSGlHb2FDRGxnZE5SSmwrTTB1MWpkNzRXRkErY2ZHTTROUVZC?=
 =?utf-8?B?aWhndWxqUW96c1I2QVVjVXU2cUZaZVRnWWlkQ0NvdkZrVDJNM2tSYk1xODZ4?=
 =?utf-8?B?a0pCejdjcWh4eVRpbzJiaFFlcVQ1YWF3RGhIbHBCeTVPSjg0VkhIZmZ2MTRE?=
 =?utf-8?B?aVBJU3RRUjRObURCRXpDdHowaGhjd1ViNkFBeWpGUE9hVGxidlo5VXExWnhx?=
 =?utf-8?B?Q3Mxa2dyUTRaMUxHU05IQ2FWOWlOa2JPcmUwdnBxUzFsKzZKMUI5QzA0NElz?=
 =?utf-8?B?MHhYVzNFZHZjbDI5QjRWb3dkeWJnbnZneEVkdUhXY1NsTGU4LytBUG9xQ0RJ?=
 =?utf-8?B?N3hMYnZIK3R6Z3F1OGI1SzBmbjVLR094dEFzVzA1cTZJWUloVXlNUEtzaHZn?=
 =?utf-8?B?bTFlVW5PL2VudUwrdDUvRWg0aWd2SEVxcXNUSDZNZXRFYmRCWGJOeEtCNXhR?=
 =?utf-8?B?MXlLSXJKU0p6SVVsYWN1WDBZRmpIUm9mNHByVk9WTWJ1ZFVRYTkvcVZzQVd3?=
 =?utf-8?B?N2U4OEFWa2grclNYOWdMQ2lqaWs5NTZ1ZmEvNjZrdHdKNlBibDZrdGVtOXZ2?=
 =?utf-8?B?dEJ4TkdKRmRySXRzaHQrZWxDeWkzYnVsZ2FuSWE0TzVWU21pUFhoenErZDV3?=
 =?utf-8?B?OG55MGJmbkcvbU1aYUJQaXhEdFlVaU5XNUx0K3BWMGoyNFdEbE1xZWRraVNB?=
 =?utf-8?B?V1BVVkorZDVTZUVVTnlxYzBUdnZiakpUQ09qdEVYY29qdVR2UWxObUJsWjVK?=
 =?utf-8?B?NkZReXRGenlaVmpmUTgzQ3gyRGNycmh6bW0zMVZyQng4eGk3S1ZTRDZxM2sx?=
 =?utf-8?B?R2pYVkhCaWRDa1MwZ3hJVWdpSnZnYktQakxqa3drVmxjV0hXbkNqQkEyTlJI?=
 =?utf-8?B?cDZVNE5FL2pBQ2svZUp6Q2hhRE9WcHhVTUhTd1FnRHdOTVZkTGp5Y3pjeEhk?=
 =?utf-8?Q?V7IksAk/UbNk05GX18Sqa16Gb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kjB8EoHMnohUkQpwDZBCNxQqQVA6tW7vHXHcWQZbtwDOubwSdaMFn3w1uUmXw919FXyIZhLBjllbS4Ldzj5TSeMN1kTQsK9xO5HKRBdXScQ5h6Nd757nwdU4kurqtKNGIsg6qu2gKpH3k3bMBKuf2Bdzx2Jii4BKGaTk/3VneHai2AwBLmu3hXQIC/d3SbkzT/DE/AliN0N2FGHUVXJYqni3V6jaCoJxb3k+Jo2JiSDifza/ZBvWGSjw/R2R0fcWk9ymGXVRUv/1+9pVjUQ9N3XwAg39ZMVqX26kRYE8zre7qVND7/WtxWVVMZnR90rbLYkAKWU5urVyd0aVkHyLKceL4Uq0QRTYcw2txLY/nssbaIilUK+gJo9qre+rUTq0l+e1W6MqJ4Vxek0UYtqvFwQQzEU0PCcyFnL/YkT3hIk6ovEthu18l01q6x5nH1/TwAuBEHpXgN2YeS+KS2uLaJR0s6NEmN/IFHzNchBV4/0/8o/c1Gz7X+afllrrNPX4GGGvqivxLCFPxueZ4sYpXdJuu7e6skztEi/zR1RW4uXeJQcrBM9rAMP0ourwghZgO8+a5qz4hqoXs2Puj/Oh/cEzwE4LD1zEb1cl4+Tit2+KrW1hBLiQxJMFekjfpBtVLRv+mq3mGU1sxLWih6a1+GniiSiCNiDD42oNsyubf6DcKXlC0HoGgo0aJeg+eILDBcJ1DTQb153heMVhcfC319OtbgCEGY24OO3b7cEkMnJx8PHENLC1eaEyRyvaa2nsQYyQ5+FRHMff7MCX+r+5djmBWWye1fy69JiTAjWrYHN6dOl2NOD7WEAWGKIrEVoC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bd20a4-5c87-4e72-e82c-08db34471472
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 13:26:49.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mx4C2QJvVZ6JByLslqBYMqMTTvM8UDNEq8Qy6JDM7/hOx5G4TGU0ZIXUCXq0SZ/rcggsztQmhQuDxJ/OeS8FsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5410

On Mon, Apr 03, 2023 at 11:16:52AM +0100, Andrew Cooper wrote:
> On 03/04/2023 9:57 am, Roger Pau Monné wrote:
> > On Fri, Mar 31, 2023 at 06:57:19PM +0100, Andrew Cooper wrote:
> >> This started by noticing the dubious Fam17h check in
> >> arch_ioreq_server_get_type_addr(), and then realising that checking the host
> >> CF8_EXT setting is utterly bogus for the guest <-> qemu emulation path.
> >>
> >> What should be consulted here is the guest's MSR_AMD64_NB_CFG setting, but a)
> >> there isn't one, and b) the vestigial remnants of the cross-vendor migration
> >> logic cause MSR_AMD64_NB_CFG to be unconditionally read-as-zero, making the
> >> CF8_EXT path unused by any suitably-written OS in the first place.
> >>
> >> MSR_AMD64_NB_CFG really has been removed on Fam17h (it's now just a read-zero,
> >> write-discard stub), and the ECS extension is unconditionally active, meaning
> >> it is not correct for Xen to ignore the ExtRegNo field on newer AMD CPUs.
> >>
> >> It turns out that Xen did even have this behaviour in 4.5 and earlier, with
> >> this problematic CF8_EXT checking being added in 4.6.  Therefore, revert back
> >> to Xen's older behaviour - it is objectively less wrong than the current
> >> logic.
> >>
> >> While fixing this, get rid of hvm_pci_decode_addr() - it is more complicated
> >> to follow (and to call) than using the CF8* macros in the calling context.
> >> Rename CF8_ADDR() to CF8_REG() to better describe what it does, and write a
> >> comment explaining all about CF8/CFC accesses.
> >>
> >> There's one rare case when CF8_EXT is visible to guests, and that is for a
> >> pinned hwdom.  Right now, we permit such a dom0 to modify the CF8_EXT bit, but
> >> this seems like a very unwise idea.  Leave a TODO for people to consider.
> > One weirdness I've noticed is that for vPCI we decode the accesses
> > taking the extended CF8 bit after this change, but then if the access
> > is relayed to the hardware using vpci_{read,write}_hw it will be
> > forwarded to the hardware using pci_conf_{read,write}<size> which
> > doesn't have support for CF8_EXT.  So if the underlying hardware
> > doesn't have MMCFG support and the reg is > 255 it will be dropped.
> 
> It is important to stress that this change does not influence whether
> the guest issues ECS accesses or not.  All it does is change Xen's
> handling of such accesses.
> 
> Previously vPCI blindly ignored ECS accesses, so the vPCI layer
> effectively truncated them to BCS accesses.
> 
> Now, from your analysis, when MMCFG isn't active, Xen's PCI layer will
> effectively terminate ECS accesses with default behaviour, even on
> systems where IO ECS is available.
> 
> So we've changed one valid behaviour for a different valid behaviour.

Given vPCI is currently limited to PVH dom0 I doubt there are many
systems capable of running PVH dom0 but not having MMCFG support.

Best way to fix would be to implement ECS accesses in
pci_conf_{read,write}<size>() if the register is > 255 and there's no
MMCFG.

> 
> (Quick tangent...  Our PCI handling is currently very dumb. 
> pci_mmcfg_read() returns its value by pointer but the callers never
> check.  Swapping it to return by value would improve code gen quite a
> lot.  Also, when MMCFG is active we still pass BCS accesses to IO ports.)

I wonder if it's really preferred to access registers below 255 using
the IO ports, as Linux seems to do the same (prefer IO port access if
possible).

> So I think we do want to improve Xen's general behaviour too, but this
> difference here doesn't concern me.
> 
> >
> >> Fixes: e0fbf3bf9871 ("x86/AMD: correct certain Fam17 checks")
> >> Fixes: 2d67a7a4d37a ("x86: synchronize PCI config space access decoding")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >>
> >> Whoever reviewed those two patches originally was clearly a fool...
> >> ---
> >>  xen/arch/x86/hvm/io.c             | 24 ++++++------------------
> >>  xen/arch/x86/hvm/ioreq.c          | 19 ++-----------------
> >>  xen/arch/x86/include/asm/hvm/io.h |  4 ----
> >>  xen/arch/x86/include/asm/pci.h    | 26 ++++++++++++++++++++++++--
> >>  xen/arch/x86/pv/emul-priv-op.c    | 19 ++++++-------------
> >>  5 files changed, 38 insertions(+), 54 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
> >> index 5ae209d3b6b3..b0d3c236e985 100644
> >> --- a/xen/arch/x86/hvm/io.c
> >> +++ b/xen/arch/x86/hvm/io.c
> >> @@ -248,20 +248,6 @@ void register_g2m_portio_handler(struct domain *d)
> >>      handler->ops = &g2m_portio_ops;
> >>  }
> >>  
> >> -unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
> >> -                                 pci_sbdf_t *sbdf)
> >> -{
> >> -    ASSERT(CF8_ENABLED(cf8));
> >> -
> >> -    sbdf->bdf = CF8_BDF(cf8);
> >> -    sbdf->seg = 0;
> >> -    /*
> >> -     * NB: the lower 2 bits of the register address are fetched from the
> >> -     * offset into the 0xcfc register when reading/writing to it.
> >> -     */
> >> -    return CF8_ADDR_LO(cf8) | (addr & 3);
> >> -}
> >> -
> >>  /* vPCI config space IO ports handlers (0xcf8/0xcfc). */
> >>  static bool cf_check vpci_portio_accept(
> >>      const struct hvm_io_handler *handler, const ioreq_t *p)
> >> @@ -275,7 +261,7 @@ static int cf_check vpci_portio_read(
> >>  {
> >>      const struct domain *d = current->domain;
> >>      unsigned int reg;
> >> -    pci_sbdf_t sbdf;
> >> +    pci_sbdf_t sbdf = {};
> >>      uint32_t cf8;
> >>  
> >>      *data = ~(uint64_t)0;
> >> @@ -292,7 +278,8 @@ static int cf_check vpci_portio_read(
> >>      if ( !CF8_ENABLED(cf8) )
> >>          return X86EMUL_UNHANDLEABLE;
> >>  
> >> -    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
> >> +    sbdf.bdf = CF8_BDF(cf8);
> >> +    reg = CF8_REG(cf8) | (addr & 3);
> >>  
> >>      if ( !vpci_access_allowed(reg, size) )
> >>          return X86EMUL_OKAY;
> >> @@ -308,7 +295,7 @@ static int cf_check vpci_portio_write(
> >>  {
> >>      struct domain *d = current->domain;
> >>      unsigned int reg;
> >> -    pci_sbdf_t sbdf;
> >> +    pci_sbdf_t sbdf = {};
> >>      uint32_t cf8;
> >>  
> >>      if ( addr == 0xcf8 )
> >> @@ -323,7 +310,8 @@ static int cf_check vpci_portio_write(
> >>      if ( !CF8_ENABLED(cf8) )
> >>          return X86EMUL_UNHANDLEABLE;
> >>  
> >> -    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
> >> +    sbdf.bdf = CF8_BDF(cf8);
> >> +    reg = CF8_REG(cf8) | (addr & 3);
> >>  
> >>      if ( !vpci_access_allowed(reg, size) )
> >>          return X86EMUL_OKAY;
> >> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> >> index 0bdcca1e1a5f..325a9d118e52 100644
> >> --- a/xen/arch/x86/hvm/ioreq.c
> >> +++ b/xen/arch/x86/hvm/ioreq.c
> >> @@ -285,27 +285,12 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
> >>           (p->addr & ~3) == 0xcfc &&
> >>           CF8_ENABLED(cf8) )
> >>      {
> >> -        unsigned int x86_fam, reg;
> >> -        pci_sbdf_t sbdf;
> >> -
> >> -        reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
> >> +        pci_sbdf_t sbdf = { .bdf = CF8_BDF(cf8) };
> >> +        unsigned int reg = CF8_REG(cf8) | (p->addr & 3);
> >>  
> >>          /* PCI config data cycle */
> >>          *type = XEN_DMOP_IO_RANGE_PCI;
> >>          *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
> >> -        /* AMD extended configuration space access? */
> >> -        if ( CF8_ADDR_HI(cf8) &&
> >> -             d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
> >> -             (x86_fam = get_cpu_family(
> >> -                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
> >> -             x86_fam < 0x17 )
> >> -        {
> >> -            uint64_t msr_val;
> >> -
> >> -            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
> >> -                 (msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
> >> -                *addr |= CF8_ADDR_HI(cf8);
> >> -        }
> >>      }
> >>      else
> >>      {
> >> diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
> >> index 54e0161b492c..3f3fb6403ccb 100644
> >> --- a/xen/arch/x86/include/asm/hvm/io.h
> >> +++ b/xen/arch/x86/include/asm/hvm/io.h
> >> @@ -144,10 +144,6 @@ void stdvga_deinit(struct domain *d);
> >>  
> >>  extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
> >>  
> >> -/* Decode a PCI port IO access into a bus/slot/func/reg. */
> >> -unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
> >> -                                 pci_sbdf_t *sbdf);
> >> -
> >>  /*
> >>   * HVM port IO handler that performs forwarding of guest IO ports into machine
> >>   * IO ports.
> >> diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
> >> index f4a58c8acf13..3b814f4ebacf 100644
> >> --- a/xen/arch/x86/include/asm/pci.h
> >> +++ b/xen/arch/x86/include/asm/pci.h
> >> @@ -3,10 +3,32 @@
> >>  
> >>  #include <xen/mm.h>
> >>  
> >> +/*
> >> + * PCI config space accesses with CF8/CFC:
> >> + *
> >> + * 1) Write {Enable | BDF | Reg} to CF8 to set an address
> >> + * 2) Read or write CF{C..F} to access the register
> >> + *
> >> + * For sub-dword register accesses, the bottom two register address bits come
> >> + * from the CF{C..F} address, not from CF8.
> >> + *
> >> + * AMD have extention to this protocol to access PCIe Extend Config Space by
> >> + * storing the 4 extra register address bits in the penultimate nibble of CF8.
> >> + * This extention:
> >> + *  - Is unconditionally active on Fam17h and later
> >> + *  - Has model specific enablement on Fam10h thru Fam16h
> >> + *  - Has reserved behaviour in all other cases, including other vendors
> >> + *
> >> + * For simplicity and because we are permitted to, given "reserved", Xen
> >> + * always treats ECS as active when emulating guest PCI config space accesses.
> >> + */
> >>  #define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00) >> 8)
> >> -#define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fc)
> >> -#define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
> >>  #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
> >> +#define CF8_REG(cf8)                                    \
> >> +    ({                                                  \
> >> +        unsigned int _c = cf8;                          \
> >> +        ((_c & 0x0f000000) >> 16) | (_c & 0xfc);        \
> >> +    })
> > What happens on Intel when the bit is set, is it just ignored?
> 
> "the bit" => the ECS nibble, or the CF8_EXT bit?

The ECS nibble.

> 
> The ECS nibble is ignored on Intel AFAICT, while the CF8_EXT bit is in a
> very AMD-only MSR, so won't exist on Intel.
> 
> > We only allow such accesses for dom0 anyway.
> 
> And guests running on AMD hardware where CF8_EXT is active on the
> northbridge of the core we are instantaneously scheduled on.
> 
> >>  
> >>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
> >>                          || id == 0x01268086 || id == 0x01028086 \
> >> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> >> index 5da00e24e4ff..008367195c78 100644
> >> --- a/xen/arch/x86/pv/emul-priv-op.c
> >> +++ b/xen/arch/x86/pv/emul-priv-op.c
> >> @@ -245,19 +245,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
> >>          if ( ro_map && test_bit(machine_bdf, ro_map) )
> >>              return false;
> >>      }
> >> -    start |= CF8_ADDR_LO(currd->arch.pci_cf8);
> >> -    /* AMD extended configuration space access? */
> >> -    if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
> >> -         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
> >> -         boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
> >> -    {
> >> -        uint64_t msr_val;
> >> -
> >> -        if ( rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) )
> >> -            return false;
> >> -        if ( msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT) )
> >> -            start |= CF8_ADDR_HI(currd->arch.pci_cf8);
> >> -    }
> >> +    start |= CF8_REG(currd->arch.pci_cf8);
> >>  
> >>      return !write ?
> >>             xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
> >> @@ -1104,6 +1092,11 @@ static int cf_check write_msr(
> >>          if ( !is_hwdom_pinned_vcpu(curr) )
> >>              return X86EMUL_OKAY;
> >>          if ( (rdmsr_safe(MSR_AMD64_NB_CFG, temp) != 0) ||
> >> +             /*
> >> +              * TODO: this is broken.  What happens when dom0 is pinned but
> >> +              * can't see the full system?  CF8_EXT probably ought to be a
> >> +              * Xen-owned setting, and made symmetric across the system.
> >> +              */
> > I would assume CF8_EXT would be symmetric across the system, specially
> > given that it seems to be phased out and only used in older AMD
> > families that where all symmetric?
> 
> The CF8_EXT bit has been phased out.  The IO ECS functionality still exists.
> 
> But yes, the more I think about letting dom0 play with this, the more I
> think it is a fundamentally broken idea...  I bet it was from the very
> early AMD Fam10h days where dom0 knew how to turn it on, and Xen was
> trying to pretend it didn't have to touch any PCI devices.

It seems to me Xen should set CF8_EXT on all threads (when available)
and expose it to dom0, so that accesses using pci_{conf,write}_read()
work as expected?

Thanks, Roger.

