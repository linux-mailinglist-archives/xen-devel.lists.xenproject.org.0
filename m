Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3867159A0
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540957.843142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vPq-0006Rx-7N; Tue, 30 May 2023 09:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540957.843142; Tue, 30 May 2023 09:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vPq-0006QH-4W; Tue, 30 May 2023 09:13:18 +0000
Received: by outflank-mailman (input) for mailman id 540957;
 Tue, 30 May 2023 09:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tCH=BT=citrix.com=prvs=5074c9224=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3vPp-0006QB-8S
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:13:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 338527f8-feca-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 11:13:13 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 05:13:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6208.namprd03.prod.outlook.com (2603:10b6:5:39c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:13:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Tue, 30 May 2023
 09:13:00 +0000
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
X-Inumbo-ID: 338527f8-feca-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685437993;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tDtkzfK9yt2H4e5dpSN4bE2A3kcZ+fQvyTNKwVcqm9E=;
  b=H8fvFrMVhPROwdTV1pU+UyeOM6BIcl7d1VjbPQJ66Hw1/SNMDk4galnX
   laL4vTMnPfVjgqOtb3cizRKy9BGE4NURf0iZH9BdnXjf5pKp65OgDc+zN
   1EHsnV0lto8VZA+D0RgHyQGvUXWN5vxjda9XBW9G6sE6JgSFzXvPcrcKm
   w=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 110224105
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rSikLKsp8Oj24wW1wn6Ry3U3uOfnVHxfMUV32f8akzHdYApBsoF/q
 tZmKW+HOa6DNjD1eop2PNuy8koC6JbQm4A2GlNkryAzEX8W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKFzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLREvcRaCvMKMm6uxavY8vs8uEfHKI9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdpITuHhrqMCbFu720cLNB4JSwCHguCSl165ePB8J
 WM09X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyLzflTrKR9dnVaSz3tv8HGipx
 yjQ9XZuwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:Pl4rG6ulBQzGUksfkM7GtemY7skDSdV00zEX/kB9WHVpmwKj5r
 mTdZUgpGfJYVMqMk3I9urwXZVoLUmsl6KdpLNhXotKPzOGhILLFvAH0WKK+VSJcBEWtNQ86U
 4KSdkYNDSfNykdsS842mWF+hQbreVvPJrGuQ4W9RlQcT0=
X-Talos-CUID: 9a23:YltlnG6XzOlf+UbTUNss8W82BcYkSV3nl27aA1DoMW1kdYW0VgrF
X-Talos-MUID: 9a23:jYTyvQZv0UXJ3eBTqhT0uDJ9KpxUwL2FFVAKsrclteakOnkl
X-IronPort-AV: E=Sophos;i="6.00,203,1681185600"; 
   d="scan'208";a="110224105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HncBl6rgb0C61BvTsCG2oILWg9AHVxomE+H12TZNdPZoYOmLRGJqv9FxNfRQxP8bXg12ClAI//7rs95c6hRFmVR8Y9MRAnFpSnA0AJSZawq1XXjc+4DFJix0LmofO6OH9okqWgsiQgllpJYxP3vKatvPZncFF/7wcV5P6nBbGz4LfVqHlZTVuv2LwM4AKbr1we7Le8fHaFcCXBlzruQl5YZuNFV73Jzt8IEtyDmiWv1CKttzheNQkmJWYTLE1iAx8nhDyK+I5GplkDZK7dQM825UJh9ALCvWa5h6CoC0kPwMrf54NIred+xNvCjru9lwB3IERLiQaWvZxhdGSGZwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iU728gA+ZXThMxQb9mO2Gvjrh3cLiEzfEq7dauG5PQA=;
 b=m0UQsBmWjyR3F7YEdwIRLE2BO/FmWrNC6UJZinQjGOuEU0E+99IkhwBJ/m10OmS/9YQ4FyE1yxV9neWsZ7tTLmfPTauE6KoM+TVTLb0XloXa/x+6wwT7yNEKR1LEYIzA+SSCdx7HVi2oLaKuRZeL9P1vWWXnBBYv0ySa41xN8Bk8jMX/lFiKohfq8FkaYhMB3zjKo9q2RyJ/KUhsVm4q/CvAeNwUNereYpCUcygrbXdDPw1CH26J57vfyJMCZcheJymz6dB41/9sfQ3C4076lO8FQpeWQhJLoXBg6N54arwmiAXlzSQ7pDLlQoLotK51rNc/5BpcTJQITx/RBQt4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU728gA+ZXThMxQb9mO2Gvjrh3cLiEzfEq7dauG5PQA=;
 b=qgN+wkHvfPznuiCc4bGiMuKB78Npkez1iiuDF9cKBQ/r9XGo9nm1+OJmBnteyiPtn13y7K5sWn8JWVWOeZV8gnhYhVVFKEBUFJrI6nd/og8CJpgW5HUgy2qbN43vMYdXDmra0yPrYfrWI0gcVQd5Dw7F3KcNVbM9Cr80V+Dc8QM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 May 2023 11:12:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Message-ID: <ZHW+Fu99ZGHPgMj+@Air-de-Roger>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4zx+TvUWTCEMh3@Air-de-Roger>
 <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
 <ZG94c9y4j4udFmsy@Air-de-Roger>
 <cedbc257-9ad9-56f1-5060-eaf173d45760@suse.com>
 <ZHRdjCKSVtWVkX96@Air-de-Roger>
 <25663dac-6023-a9a7-a495-c995762191d8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25663dac-6023-a9a7-a495-c995762191d8@suse.com>
X-ClientProxiedBy: LO2P265CA0466.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 1578ef06-6bd4-40e4-5b5a-08db60ee1090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cy7W8Xu6ZPW4MSc3V2bQWGAbknU04aNIfJYbM9rqNAu/LHLgE86NTUqfY8Btp+lpHyu2fhTWFslj9vT1/Qbi0/tNu9tyB7n4E0EO1wolat/MxhiGX0PSoZjTSch31nZlqSJMV/uosrY4gIcKKgsdjoqMlpIT2sYlcTIW84YaEY5FsBIRa/mtpuwjQz9FX+Q0W2uTD9VRpKWb/cplKC2efdv2ynYZ97nOXHu5gNykSk9w+KmpLifW8QJ7luXvDSU63IFmskMptfYrP9xKhF79D6M4DWFusFNJGBGHF8DFWKxQ6ZPW2I568Y3xcGe/QAW3BPmp+NH9dU8nB9/XvNVXiPgWVRH7kBGQVzNI3wOykl6L/poakKlBi5vYMARAerWhLfHj/YOkWqRWyHz9t33rc0j4k1JpGAb0UET8uj8NiHN2TtnphTKJYFPnQpou1W3A4YTR11BiRA/j5PUUai70nfC/4hLV1eLkTouJoVCdFkkkXSO3bObYGIzl7NOchoczOlekOMDUjvQHHWtK4OEjaM1nCJM7DVm0D6bfdZiuOJLZPsbSk655uCOO/eBnbl2f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199021)(82960400001)(54906003)(478600001)(38100700002)(66946007)(66556008)(66476007)(6486002)(41300700001)(85182001)(8676002)(8936002)(5660300002)(86362001)(26005)(2906002)(53546011)(33716001)(186003)(6506007)(6512007)(9686003)(15650500001)(83380400001)(6916009)(4326008)(316002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUxvYm9MWVZRM2JRTk9uR1hEWjlrdzhxeFFBSFltekVzeTR2Wk9sc2U2Yzd3?=
 =?utf-8?B?SFovc3FraVdCaEdZSkcvTGtrbjYvd1pSM1Y2WkUvODVLV2l0U2lVNmRWSnlw?=
 =?utf-8?B?a0FuaFBrWS9xU0tsVTdsU0RtRTd4NG1jSFZBYzMwS3BOSWNQeE1HM0ovcklw?=
 =?utf-8?B?T05EVGV2TFFteXExcFp6Q0Q2VUo2TTNkTUFENlN0Y3pZeWdOV1lERzFXU1Ra?=
 =?utf-8?B?Yy9YR2xVbGVsaWJkQUoyTFNLZHc0ckdFRVFJNjFLL1RUQ2tDeUUrMFgwMlh5?=
 =?utf-8?B?UlIrNTNxZDR4dlNlRkVGeHpTejk3Rk8yWk9aTzZPTHJiMys5enRZaHAzTFh4?=
 =?utf-8?B?bDJvcUxpK093QWQwSHExRkppMmxIUHd2QjFhTVgvTHJwWmlWdjZqcVJKUzgy?=
 =?utf-8?B?T2ZtSEp6WGdXOGp3Mzh5ajlBMThFNFNGZEhEUC8vKytuM1haK2pFRFRLeEsv?=
 =?utf-8?B?cHhtNit6MHMrWG5sZUR2ODhNTno3azlmS1MySGZRQytnSklSaGt4K2Z3b0gz?=
 =?utf-8?B?WTVZaWVSOEtkUWVoV0NiOTZ3OHdQbyt3SjNxL3RZOERZYWc4bkg3dTZHL1hx?=
 =?utf-8?B?Q2k4WnBmOTl6OEFnZTZrRUxnZ2Q3VzVRWjh3MGhwbWVUSCs1TnN3UnhtbHBw?=
 =?utf-8?B?Y2hSNkNzRy9MUjlvR0hVQXdxR29INDRQQVJTUmpJMmhMZzkvVVBKbVg5ZEVX?=
 =?utf-8?B?YWFIWDM2ZWRyVE8wdWFqZ2o3cHIySklncnZSUld0bUtZOGg4M3VGRU12c1dJ?=
 =?utf-8?B?ZWI3TjhQenV1NnZvL3NsZ1k1YW1FelZjTzRGZGhUL1VydVhkMDhYdThaa1d6?=
 =?utf-8?B?M1FEaERVTTRkeTFmMGQzdG1Gd01heXNmS1NXdzlsVFRNNXRQWENyc1AxYVlC?=
 =?utf-8?B?VmNvYUJVUnlUdE9MN3BZdVl5OWJiVmN3K1pmTU1pd2FLcnordEdWY1lPR1lP?=
 =?utf-8?B?NmdGQXplZVZlaXZhSDM0OEptRDJyLzNkdk12bHMrOW43Lzlubmt3RTREZFZt?=
 =?utf-8?B?NmJDZG54WEFyWHgrWFJxeFdGUWZEbENlOGRpcVVMTG1yUWcxeDgzWmNxUzdT?=
 =?utf-8?B?L3pRdi9DcDN0ajdFT1QxaDFnbnhrSHVDL2tuZUtEK2RNeklpRDNxRXpSVDJD?=
 =?utf-8?B?bU5KTy83eW1aTVJIcFg2TlFOcDhYdGMrYmIwK2JZTytxYm00bG5tK3NtdTBu?=
 =?utf-8?B?cEJTa2JCRTQ3NGVkTjdNUHU1bUFoOTBRUHd5TWJObzBEd0E3aFNWd1hicjhZ?=
 =?utf-8?B?MGxFbFdwZ05QUnhNSXB4MEJsb3dEREZ3cHNoQWtKZU84NC8yb3JNMWEzYTMy?=
 =?utf-8?B?N0k3VlZRY25UOFhkbldrWTB2K2hSYldKeTBodkZ0MmFZbWoxNDg4MVA4N01N?=
 =?utf-8?B?dnZKN0NKNE9Gc3o2bFFuQ0hPRXorSjRlTVhkc2NGQVhYQ1JOS0NmZUd3WXNC?=
 =?utf-8?B?dHlUMTQwNDl2Sk11MVlSYlJ3WDY0ZWN0ZEJOdjRyeFlXS2dYWWMxTnBDZ04z?=
 =?utf-8?B?Y0RIRmdHUmp0d2lKb3pjRFpqbHM3RThudmZZQy85M3NONUNUR1RLMENTaUM3?=
 =?utf-8?B?alJTZ0lJUVVBN2twSGJ2QXJ4UkNyRWhsY2l2eW82U244am1DdTZJQUU3RWps?=
 =?utf-8?B?enN6RGNTUFgzdVdRcTVHakpvVktSWTcrRGpqakpYTXpqd0ZMZGdwZEkwNEVv?=
 =?utf-8?B?YkhVTmFYZkJDKzAxK3YrbXNzSGhDbktyUmlwZjRKOVpqcTBLNTBGcmRoc0VX?=
 =?utf-8?B?YkVKQTFmNEdXWG55T0w0SWJ1T083NFM2dzMvL3pIeEZOczRZOVVJTHUzK3JK?=
 =?utf-8?B?elFEWVVwY3BCaW5BRkNZcFlrYkV4TXpuY2xDMDdDTTlMK2Q0M2xjY2RkaDg0?=
 =?utf-8?B?cmxFUjNpaEx6UThXVXBZeUFMK2xONTltMnpHeUdHc0NCdTdyMEpKekQ5aGxh?=
 =?utf-8?B?bFY2b1NOdzhCVmUrN2FlYXN0QWVBYkNHRmgzZkNrUFMwQ3Frb3hPcmNMbEt5?=
 =?utf-8?B?dkNVbDlIRU9lYTBGN0hpc3JxcTg1MEtLT0VGVGlIMXVWNWFGSEQyRU8vUHEw?=
 =?utf-8?B?eXFYVEh3QW1KU0dFT2ppeHBFZlBHZUhJbDNwM1V2TEJMekg4UWpTLzZTeWZy?=
 =?utf-8?B?VWUyU2hIN3JYM1BVU2xKRE9maC9HekpSMm15bExsQ0pXUUhBVUpHMHpoaW9l?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1gj1tVpdRSeOMIBEQ/9vk5/DMXV7i/NUVRegbOHJrWDvPY9Q5S/GEG3Giiz9B3DJdNr6PHNBiz0EmxlmjU2a/TJy303pUCGfcafAvCUzYsh1dwqDPQOTssiWSYIgnzPxVtym0OvUGrA3UkR4CBLY7yahmT0yl6mrqFjPtTIbAOa+TMfZMlXW3XQF7uCzmHTlwSbXwroCbeOY8xm5Wv5OsLnc+xLI3HjJW+sW/MzPzXZCEjbihGluDbVF9m+KGmfjbiSGRodZxIZiStJ+BuhGV8Wgx0Dd3ROnsba/2ZkIUnO7a0HX2kK7VfgEvtkPAN2xyoxmguS0d+JZ+GyH+y5TbWoe9t4uJX2GlBNiwlv7pNK8dkJjv3riEswmX+kfq8mMzyQnGVVJ+hG7y53SCQ0bCHYXM/Ad/1Gv4F9Mrl3ZJMgpku6YOnW4tHoDpeaCaKq1DUzbBfZIG9Pdgw2FCv/c5UK+QMfI1IHWaVPQOqkiO6eA8FymARcVbPCcGcHKlDPsTLFCOW79rgnBirAUWiOhYsQAFJbrXbeT3zoKLHJMKW4pJaixUa5bN7ptAQbkDLhWiWDXcoXN1e3rspfbhBRdB7iktrbcSjQ1tUbTZkBQsH0swvmcAoJnRGh0eIIyjbUt22Z0pY39C3FbtyVj5cTTHIOD5nK5evNI0ROnY+8Lp3NKUOBa/rbQa/2goMS5AaIkqmJoM5M4CKgosyMtIpVqS9Zs54rkSUMixsrrOVt+NV2cq8EToVjcSfZCpThe36OzhgMVtdWCEEJ0VPf98WKjxA8nUdVWY0oHH/D2ufvxVGTtvcEVoq0wWDAs3mCcE4Li0b2x/07w5c/1E9A4csatQQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1578ef06-6bd4-40e4-5b5a-08db60ee1090
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:13:00.2097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfWP83/qkaIsQELQvHrNFQaGZAkCX/n5TrluicEeRyt5vzoJHahZ9zH9AgonM6NdoCOybQoEq5twNPkHHaPZPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6208

On Tue, May 30, 2023 at 10:45:09AM +0200, Jan Beulich wrote:
> On 29.05.2023 10:08, Roger Pau Monné wrote:
> > On Thu, May 25, 2023 at 05:30:54PM +0200, Jan Beulich wrote:
> >> On 25.05.2023 17:02, Roger Pau Monné wrote:
> >>> On Thu, May 25, 2023 at 04:39:51PM +0200, Jan Beulich wrote:
> >>>> On 24.05.2023 17:56, Roger Pau Monné wrote:
> >>>>> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
> >>>>>> --- a/xen/drivers/vpci/header.c
> >>>>>> +++ b/xen/drivers/vpci/header.c
> >>>>>> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
> >>>>>>      struct vpci_header *header = &pdev->vpci->header;
> >>>>>>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
> >>>>>>      struct pci_dev *tmp, *dev = NULL;
> >>>>>> +    const struct domain *d;
> >>>>>>      const struct vpci_msix *msix = pdev->vpci->msix;
> >>>>>>      unsigned int i;
> >>>>>>      int rc;
> >>>>>> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
> >>>>>>  
> >>>>>>      /*
> >>>>>>       * Check for overlaps with other BARs. Note that only BARs that are
> >>>>>> -     * currently mapped (enabled) are checked for overlaps.
> >>>>>> +     * currently mapped (enabled) are checked for overlaps. Note also that
> >>>>>> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
> >>>>>>       */
> >>>>>> -    for_each_pdev ( pdev->domain, tmp )
> >>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
> >>>>>
> >>>>> Looking at this again, I think this is slightly more complex, as during
> >>>>> runtime dom0 will get here with pdev->domain == hardware_domain OR
> >>>>> dom_xen, and hence you also need to account that devices that have
> >>>>> pdev->domain == dom_xen need to iterate over devices that belong to
> >>>>> the hardware_domain, ie:
> >>>>>
> >>>>> for ( d = pdev->domain; ;
> >>>>>       d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )
> >>>>
> >>>> Right, something along these lines. To keep loop continuation expression
> >>>> and exit condition simple, I'll probably prefer
> >>>>
> >>>> for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
> >>>>       ; d = dom_xen )
> >>>
> >>> LGTM.  I would add parentheses around the pdev->domain != dom_xen
> >>> condition, but that's just my personal taste.
> >>>
> >>> We might want to add an
> >>>
> >>> ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_xen);
> >>>
> >>> here, just to remind that this chunk must be revisited when adding
> >>> domU support (but you can also argue we haven't done this elsewhere),
> >>> I just feel here it's not so obvious we don't want do to this for
> >>> domUs.
> >>
> >> I could add such an assertion, if only ...
> >>
> >>>>> And we likely want to limit this to devices that belong to the
> >>>>> hardware_domain or to dom_xen (in preparation for vPCI being used for
> >>>>> domUs).
> >>>>
> >>>> I'm afraid I don't understand this remark, though.
> >>>
> >>> This was looking forward to domU support, so that you already cater
> >>> for pdev->domain not being hardware_domain or dom_xen, but we might
> >>> want to leave that for later, when domU support is actually
> >>> introduced.
> >>
> >> ... I understood why this checking doesn't apply to DomU-s as well,
> >> in your opinion.
> > 
> > It's my understanding that domUs can never get hidden or read-only
> > devices assigned, and hence there no need to check for overlap with
> > devices assigned to dom_xen, as those cannot have any BARs mapped in
> > a domU physmap.
> > 
> > So for domUs the overlap check only needs to be performed against
> > devices assigned to pdev->domain.
> 
> I fully agree, but the assertion you suggested doesn't express that. Or
> maybe I'm misunderstanding what you did suggest, and there was an
> implication of some further if() around it.

Maybe I'm getting myself confused, but if you add something like:

for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
      ; d = dom_xen )

Such loop would need to be avoided for domUs, so my suggestion was to
add the assert in order to remind us that the loop would need
adjusting if we ever add domU support.  But maybe you had already
plans to restrict the loop to dom0 only.

Thanks, Roger.

