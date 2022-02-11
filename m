Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029CE4B2301
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 11:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270280.464514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIT4e-00061f-4J; Fri, 11 Feb 2022 10:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270280.464514; Fri, 11 Feb 2022 10:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIT4d-0005yM-WE; Fri, 11 Feb 2022 10:22:44 +0000
Received: by outflank-mailman (input) for mailman id 270280;
 Fri, 11 Feb 2022 10:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nIT4c-0005yG-LY
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 10:22:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 898ed3a0-8b24-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 11:22:41 +0100 (CET)
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
X-Inumbo-ID: 898ed3a0-8b24-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644574960;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vnBS9HMfLyvn7z1o/VlGLvpaq2zihXpPQgNgeqxoW5Q=;
  b=OfSJ+I1DZDrYVex6nQrUoHXWZA5qimYUpcAypxJUI8qlINhlmedPk9No
   oLTlt5NOum3R86Mk0FCnf+XfeF3LTlCzHxIVdE+MbzDffyxewDqoJt7fq
   EmEhRZmChWaNll5WsM4JP5yf9nuNpaK1zNb9Ifei67JmLtEMpD9/qPtRl
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qGpFwpJNQU4Puxje5MDNNlpCPqWM5dg4scYFXLQjOouX0RS+v93i0MFuelwixC3VoO/w/utrDf
 iF28v7ip5wRqR+1g1oIKpPQRJvWdpXLsyxiJYQxVXNMTAGKZNeDDFJHgGa5fKIHCR4gvFm8mGk
 KPxpYOW8tc53xhQnZ79VJShQsqZD6QDJvscFNyNCIQT5c3ydzG2f4kMPwEGlD5sj1kVICyoOrU
 4WGt/UyKCLNwkKm1yqp55acaTzS/+0Rfj5/ug7BTD0h6vHEBG3xjBrOBsqpEvmVixHutezaPts
 p2+HEHNQmpWFrX7oWywG02vr
X-SBRS: 5.1
X-MesageID: 63908875
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HSoFmaI+e518GLM3FE+RA5IlxSXFcZb7ZxGr2PjKsXjdYENShTQCx
 2FLUWrUP/yDNDD3f98gPY20o0IDuJ6Hm4dmTFBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB223PRek
 5Z9paaVclcKO7DyqbQkUklhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uvo4AjGdv26iiG97Dd
 eRDSQVASC3HOUxxYmcTCKh9msmB0yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdyL7hFHf/S4MYf9rQ84/9T+8mpPVsz/MUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb7zt6cowGGxFAfpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpyP5IN8PumwnfC+F1/ronxezM
 Sc/XisLuvdu0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ba5XUm08CDIUToED/qOYuELzDFlBibbjeoM1LbO+TZA1gHWAqEfjKxr09PYdimsxoei3gp
 xlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:mizs9q75Fl2mzmw1zQPXwPbXdLJyesId70hD6qkXc202TiX4rb
 HMoB1/73TJYVkqOU3I9eruBEDiex/hHPxOjLX5VI3KNDUO0FHYSb2KhrGD/9SPIUPDHkg279
 YFT4FOTPnLSXhgjdy/xAWkG/sp3dHvysqVuds=
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="63908875"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGAoW8aepAI8t45cibvzsVa4OB0EvZVUYWadpDkikcWPxsL/xkkGPWWNF1Wdu/Gu8C4vKbjJFVhjnfmcIWmjIPfa6zJ2q1f11QJ2RqIHUtwWiEXvBKTtAvCdwwvlR0+eKDURLNBu5QLlYys51NYccuGaTbt0Kd/UwHFNbwfMpJPHTtSFTcpdUaTHUUv2XmStn7JS3H759MzQdQMISI4PBdghy9nJF7ZnIQvtHOr1mnJE9Zj9g07ZGsZFYWWp3Wyt16AWS85VPHfdpH+TtW3E1nIi3OS5ujpqyPntjOTu02mwePWLVxTZ6mv6wLMazlXknxeGzL7CMXh/i/CdirPGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2z+UpBgPwg5bYg5mejRY+EeYHpt04WkYh5f3MMfUuo=;
 b=Y3XAtTu5NAQj7L4PveuChsY2d0RuIsKrS8WBa+H7dhXHES9qa65GRgOf3kiOQjCO3YtK8zemPIF+F2PjEGpfnWzH6/eNb1TT7ph+lAZsUftyB5dpr03F0c0jHT9LFT0EohZ0PSc3ix9PV86Rp0fX9v9kDwmT7Z23lE89XagNDhrc0rCeRgp4kd99XVJlIHfH8MPP1/sQKgw3CkUUx7Kpef+P4JEdEMnEMHxhOGpY85L9b9SMPxdOo9wA2hv8xhm6fpRGa+wIxocRPIn91essPx7Xk0ndItjdyB4Y+BhklLHUmPAaEGQP8bkDZkjyfC6qMoQCdc+I5a32aaggF3Zprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2z+UpBgPwg5bYg5mejRY+EeYHpt04WkYh5f3MMfUuo=;
 b=oSTMyjYz9lYtUcGVGULNDL1ooeBJuXKzb7Sr8G4ugfv2kM1irKX0e5ypZxr0KDZhAiFM1BdQuOkEb8HJNf6oGMTYNhDSHdAeP1DaL361aKRMlH+bTD8xkxon/b/1G1LcfVQ1nqySfIIdeWWDNMKFtN4AzSf+xXyfaboy8w/z4/g=
Date: Fri, 11 Feb 2022 11:22:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] x86/Intel: also display CPU freq for family 0xf
Message-ID: <YgY45kBkFFN7ZDHd@Air-de-Roger>
References: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
 <58f81931-cb7d-1710-4f52-380c8f880156@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58f81931-cb7d-1710-4f52-380c8f880156@suse.com>
X-ClientProxiedBy: LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b9e355b-934d-4d56-0cc5-08d9ed486b92
X-MS-TrafficTypeDiagnostic: BY5PR03MB5048:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB50488408F4929AA0221CB0D68F309@BY5PR03MB5048.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M8NjY91SOuFxvJJgOP3IEud1mkZk6Od+AE/ig8Sou9XVCcMVB+asp2xYmbSqaHS5EUzG8SCfFKJcYsFkojPu7NrvZHoxCPagy7+SWyKvNo5qZQSU5Bfh0y+ms/cK7r/frfUCO/jYM2g+SfYRVtugelIes88z1o5rRlSlfVIo2CpMYu+ar1fFbPAeu8rf9EHCthT8AxK6IhDys0IBVxOikXi4INYBEpoA5lLeOq6ZlooYTkZeteqkZErBCwW9ykqwMcbwe5kCB6XQhSJW2rRHf3rdQkLN/RoQdXlKkpwgHdyaDYQZafbIh/4XZ/p70pqKDFR2xsJFqnbBt/ruy3Cp8j3O4urqBiKn+URFmqfVjJXOmcUsnTXNqryEYdDjLOcsCMiV+FvoC+gHztr04maVpObhVm/CjsaP71aWd+ZAkFmDOweSr23KUwh7uVLW+T4x7DUAX0VbEFWeRTyu8iJY17jxMDhs/yD6n5cpb03lD5BXmlLgY9OJ5ZB1SwVBgi0FxrwVskhnROGJPeLL98FHMqjCmpqcuR7mAJKFgBRKiFyo4/JyEjm1cpzq7ScaBhjwH+XkcysyJSfG2lWdnkb/crmKbyv5hsJC8GIew1cbH3oF+G4p28jEwSGdt/zoOSJVMiplBfm/L1r31lsXLB9Afg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(2906002)(33716001)(83380400001)(26005)(6512007)(186003)(66556008)(316002)(54906003)(6486002)(8936002)(508600001)(9686003)(5660300002)(86362001)(6916009)(6506007)(38100700002)(66946007)(82960400001)(6666004)(66476007)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akFCYSt0ZXpoM0FlVGl4cVpmd2lxdGw3UXFPM1J5N2hYMy9Hb2xxNFA2d2xX?=
 =?utf-8?B?L0hRUW1VNW1PdFpaQllSVTV6UFJvSjh5VHRhbFZuQTQ2UWgyZ0FLRzZLODFF?=
 =?utf-8?B?WnBPbW5XNTcycEFQYmsrL0NIRkZEYW5ZaVZ3dVNDbHN3UmhwaTZXMlVKRVdF?=
 =?utf-8?B?MXFHNE9Nb2VDekNBRFlsWU1MUkNOV1I2Um8wcks0N1Rwb21YSHVOLzV6dzUz?=
 =?utf-8?B?RDZwQTRwc3dDdmVKYnlHZ0pvTVAyMlRZUkJ6RXZLQVhiYjJxcW1IVEZRZ2ty?=
 =?utf-8?B?bzhrUkl5Z0ErK21LeE1senZxbEZwQUtrSHZIYjM2N01aYXk3R1dCS0xMRlJL?=
 =?utf-8?B?QlVaV3l4Y3RhazlRU1Z3QlVYZjY3ZWcrQ1ZVZXlOdm9JSXc0L29VVHhOTFdt?=
 =?utf-8?B?a3l0clkxd3FTZzNvbG9NeE1PbGxnUm51bjg0Y1lNUG82RTEwTDNoNG9rOGFk?=
 =?utf-8?B?UWhiRXRKQTQxS0NBMGF0YW5CdGtUSkF4bXRsSlBqaVN1MFdCWVpkZ3dtZnlu?=
 =?utf-8?B?Z0pWWnNiT1BxRGhqZGpTRklENy92VmFiQitpUlBaMXR4Rmd5RW10SXdmWGty?=
 =?utf-8?B?SS9NSFlHbHp3eWppRzdzSWdpMHlzcnBjYnpoUnRTUWVGL2tUdDFrdzBqZmRi?=
 =?utf-8?B?SVdzTzJFZkpPek9sekdjeEZLZnhuSkZPL0pHWHYzWCs2S0d6aGt2UjQ5a3RC?=
 =?utf-8?B?MHkra3J5UHpVaTI0c21mSzJJVW9aQWdmaHpQMk1CQmJWVTZlWCtRL0R1WTl1?=
 =?utf-8?B?anpxTzFIdDI1YWtrM3VSODgreXpLRnI4REZIZVF0Q1JVYmNYZUxXZWtmc3N5?=
 =?utf-8?B?cFNvUDEwaE1BQWtDb05Oek5VTytVRXg1aWlDc0FLZkh0MCtNTUNaMHAxWlk4?=
 =?utf-8?B?YnBUT2xnZ1RpaVU5WnBqcG15UVlLaFBSZUY3eVBoN003T0I4VWJJVXdjM0pC?=
 =?utf-8?B?QjNVY1F4aVZ1UmRvaW5Hc0kxb204QS93emdTdDlhSU8xVi9RNjdaSVJRUXdr?=
 =?utf-8?B?WWpkNkQybFhxeTM0Yng4YTZ0Z2lWeExYNFJlU1lDSFpwUzY1ZHhMdDBFSURi?=
 =?utf-8?B?Zk9DeHMwOVFQUTdzNmpWNDVoR0VHSVk1ME1ZUWNpNllDKzAyOGQwTnZsVVJL?=
 =?utf-8?B?U3JudzVWRDdlSmZZaENoK3lyMWFoZ0pNVlhtTWpnaGR3d0g3ZTY5bENaRURZ?=
 =?utf-8?B?K3B0VlYvKzBrMU02VXlIeXZmZG9jOE5nbGxnUnFZWVlMSE9mOTR2WWZTWndC?=
 =?utf-8?B?VjVaNmlyTUtZS2szVzdOR2NXYmExTFkzeW45b3dHVVdmZ2NRVWp6U2lzU1BL?=
 =?utf-8?B?OERXRWxpRVNEU3VFM2FCVW9JNnk1NHoxalNMTytTMXJoYVdtK3I3RXRiMk8x?=
 =?utf-8?B?dDZhS05xSllzTFh4eTN3d1VzRUcweXdnYVNUOUdFTkEvR2dodnZXUE1NaFo2?=
 =?utf-8?B?Myt5Z0xKTGoyM2ZRdUcyc1BUTXpvTU9STFdWL2FTNTlCdTNwdW00Z2xxajR0?=
 =?utf-8?B?UzE3K0R5QkwxT05TbzBYOFhqL0dOd0ZTNkxGUFh6V0FaajZtZXY5alpCdmZR?=
 =?utf-8?B?cXlsNXBualdIUktTcXplSFB0UmVWWVdtTEJoeThkV2pqaDVKVUludHlUendh?=
 =?utf-8?B?Z0ovbGhTNHdFTHJBZjM4dEt4bHJhUGRPbFpXRzNCcnJ6SVA5cmpCM21hbVFW?=
 =?utf-8?B?ZUUzNnBVc3Q5dnBsSHZZREZRaTgvZWJ6Sll5ZnNsMU84OHlsNTNmUjhLWGxZ?=
 =?utf-8?B?RllFZHlrWjFXSG5TMFY0a2dSZnY2QUpGdmZHLzNQUXdRdEhrYkNtWDl1Y2Iw?=
 =?utf-8?B?L0ZLZ090dS9pN2ZEalVrWGpGenNjTkJtc0dsQXZuU3NBNERralVKVU1nUXp4?=
 =?utf-8?B?dkQyc2pHYnNMYlB2QWhOS09pYjZ1cFNYTW9GNTA4Smg2WEZJWmdEa0lXeER6?=
 =?utf-8?B?UThKNzVaVEx2UEd1aU9XS1pHTXZEN1JHVnNyaFlnc2FVRW01blFkL1BBMVBB?=
 =?utf-8?B?Zll1OXIwYUZxMm9uUEpRdEJVR3dxOFFzOXJCWHhWNTA2V2ZHOWViMjlUd1hK?=
 =?utf-8?B?NkNTcEd1cGUvUXY3TXA3UW1tcVZnVjA3a1c3alNBbCtCRC9vbEZzOW5scVFR?=
 =?utf-8?B?RGNSNzFWMXFjMDhzUFh2R3Qrb2FxVGFZL0ZjdGx6VzVyRU9PeW5rd3BsdmxL?=
 =?utf-8?Q?gMYitq9POOZP1k+GnqLip3Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9e355b-934d-4d56-0cc5-08d9ed486b92
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 10:22:35.0765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/p3cjkG1j0tFwIMXxdDkuo62fU8a5T1DzqyQ8VEzu6Be+XGFC6mxchc6pmcfhAPudysmsxwzm7liY4Va9IrVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048
X-OriginatorOrg: citrix.com

On Thu, Feb 10, 2022 at 03:56:48PM +0100, Jan Beulich wrote:
> Actually we can do better than simply bailing for there not being any
> PLATFORM_INFO MSR on these. The "max" part of the information is
> available in another MSR, alongside the scaling factor (which is
> encoded in similar ways to Core/Core2, and hence the decoding table can
> be shared).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> The inner switch() is left indented one level too much (and with an
> extra pair of braces) to limit the diff. I'd prefer to make a follow-up
> patch reducing the indentation, unless I'm told to do so right here.

I'm fine with a followup patch.

> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -412,9 +412,9 @@ static int num_cpu_cores(struct cpuinfo_
>  
>  static void intel_log_freq(const struct cpuinfo_x86 *c)
>  {
> -    unsigned int eax, ebx, ecx, edx;
> +    unsigned int eax, ebx, ecx, edx, factor;
>      uint64_t msrval;
> -    uint8_t max_ratio;
> +    uint8_t max_ratio, min_ratio;
>  
>      if ( c->cpuid_level >= 0x15 )
>      {
> @@ -455,21 +455,22 @@ static void intel_log_freq(const struct
>          }
>      }
>  
> -    if ( c->x86 == 0xf || rdmsr_safe(MSR_INTEL_PLATFORM_INFO, msrval) )
> -        return;
> -    max_ratio = msrval >> 8;
> -
> -    if ( max_ratio )
> +    switch ( c->x86 )
>      {
> -        unsigned int factor = 10000;
> -        uint8_t min_ratio = msrval >> 40;
> +        static const unsigned short core_factors[] =

This no longer applies to Core models only, so I wouldn't be opposed
to renaming to scaling_factors or similar.

Thanks, Roger.

