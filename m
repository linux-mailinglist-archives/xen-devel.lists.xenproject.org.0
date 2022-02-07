Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D7C4AB7F5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 10:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266623.460316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0gM-0007xC-9Z; Mon, 07 Feb 2022 09:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266623.460316; Mon, 07 Feb 2022 09:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0gM-0007vM-5h; Mon, 07 Feb 2022 09:51:38 +0000
Received: by outflank-mailman (input) for mailman id 266623;
 Mon, 07 Feb 2022 09:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYSm=SW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nH0gJ-0007vB-NJ
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 09:51:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86c6fbae-87fb-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 10:51:33 +0100 (CET)
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
X-Inumbo-ID: 86c6fbae-87fb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644227493;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qrESZAZwNitO38rK1W33xK14LFSnyhyngExHlGoL6LY=;
  b=Y8w9ROszvyf6+/byzu4TvYeaop/Jhqz+1a4BUl6Ay5bsPpf+FxuL3lrB
   1tBVIKY1SaJPF/ITM4ga3EUWrX4tqQmq4qyFiRH/f8dzD/AdL4OzglCpC
   ieo3NtNG8b6h7UCpr3tbr05xPRDvJmu1LVeuZgj6HM5qVfcjZp6hr/iRI
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zt+8SZ0SQeDt8hbh1NPZZlrgaqKz4jLSI+CP31NNcvCMvV52gdQrfw7Cd5H1bcdk7V7j8UNyp8
 gWKr4sGl9oBD4P1mLZ/Y0BCIgNBvoUU8arx8MskVY5pzrHA0/dJEL0fX3RqsUBO22prCwoMFMr
 nVpRXqOL/9zGQ6yoNwSfpQD9RZlLtbzheBSn5X1smW9j6gjCq0gOTM5hUYN7KI4VaLW4cwPHUz
 MlX+7G67SIVs8/DtJJwIeGNpqlrHHMzD8AK8Mn/IM3Givop2R7xHgUAB1vhjru+LSwSD0pmgab
 sqV/+ZRrm9ILr73cZXGJphXG
X-SBRS: 5.1
X-MesageID: 63630354
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:01kKsaKqW/NRE0qTFE+RA5IlxSXFcZb7ZxGr2PjKsXjdYENS0zNTm
 mBJXGuHbPfcNmf3ctFxb4S/9kNV7cXRx4M2SQBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7xLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB22wM5fy
 /NctaeCE1YIYqvOh8U2cDNHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvoEDhGxt2qiiG978e
 cpCRAhpVi7NSARfOAgzGdFnseuR0yyXnzpw9wvO+PtfD3Lo5Bx81v3hPcTYfvSORN5JhQCIq
 2Te5WP7DxoGctuFxlKt7XaEluLJ2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdyLnvlCHmA8cYOgKQsxm7gOS64H3yRnMUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzjNAuBRPtfNi2mUBb/zt6coEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AAzQ8Bwrm3zqiT6Jui8BQ2Sw28zY645lcLBO
 heP6Wu9GrcPVJdVUUOHS93oUJl7pUQRPd/kSurVfrJzjmtZL2e6ENVVTRfIhQjFyRF0+YlmY
 MvzWZv8XB4yVPU8pBLrFrh1+eFwnEgWmziMLa0XOjz6iNJyklbOEuxbWLZPB8hkhJ65TPL9q
 YoGZ5DUmkkADIUToED/qOYuELzDFlBibbjeoM1LbO+TZA1gHWAqEfjKxr09PYdimsxoei3go
 hlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:X6wYTarDEaMX0XvyrnifED4aV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,349,1635220800"; 
   d="scan'208";a="63630354"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+PnEo3G0jvQVNklo6I4OUWkuHJRvy/xDW6jWrYD8McNcBDFe4/qE2aqjp2Y0AwirrJ9jnfkSJD+3Y9kfWRLrJQ3aapTsxMllaO1EFW/6anbsPiea4+hN3mfycfjQKCgQ8JZf6pQ82zMOpTNkJVHRJFa5s73iDV5EjzYITQ5PW1nVVKy/3C9AxUt/xFdf0IDGTIotS+n6hW3uvxlSEGeu0PJ/3ljWWIz+43VLyRWUynkki0siBUoyuUdirCEauhZaKziVN4WOZ+oDFiYAncfsvU/XPE3A/fM9Gmet0t6X9FtFCmV/XT9tZiw0mZsY2eBzB+U5I/ZkZClzx+2IvBFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiOfI3zwfLnqqgoXiik9Wlkdk/H7DaolRG8yaxJP5LM=;
 b=NdwCgppNJoTW1QsJEsOz62WFM+jBBIQh0i9Mv/roYbUAqW2/WYQqLkd2MbfFiKQT/FNQhEh0ba9g26mfh6+oHMJARuogEtGYrPAI8HFJOG98V7WUNvoX+0fsQ2zPF3hGHDGQR7L15Yf8WINppEzsMvnpmTZKexQc/AoQGZ6QzmiX+KZHqDdJNGb4oWUDSsXMEG454ZMxy7TCg0IanMtYZ/DQkSBDGhqhKeH/wAon4fAnK1LldWZoYboXkMyULuUmloq+lm35udg7zFgpwZkvNpuK1eHVNo4W+sP2udO3No83HNlLq9qL5p0UKCSbOF5XiOda3ghxsj2BmZpOdb+39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiOfI3zwfLnqqgoXiik9Wlkdk/H7DaolRG8yaxJP5LM=;
 b=LzDj+FoBkEZeaYiNqWbybm8BO2OH8FyNZEOzq2k1EiUm02AbmTZDegMHSOi4tdxaBPhDpUNhX/48mu8HxwEJQdJAv1Gtnqrf+N8VttYiKOd+Nx+ADKjXm0RwmXwbhWs5f5h7lPE2Ys469YeVWoeRTIwrps8jPFFDnPt2D4TfdCI=
Date: Mon, 7 Feb 2022 10:51:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] dom0/pvh: fix processing softirqs during memory map
 population
Message-ID: <YgDrhhiJsH3r1i5x@Air-de-Roger>
References: <20220205101806.35927-1-roger.pau@citrix.com>
 <10266b94-7399-2f76-24e8-57ac6a1ac258@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10266b94-7399-2f76-24e8-57ac6a1ac258@suse.com>
X-ClientProxiedBy: MR2P264CA0060.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0060474a-2598-4129-8937-08d9ea1f66b3
X-MS-TrafficTypeDiagnostic: BN6PR03MB2562:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2562AE1028F7861AED8CF3CF8F2C9@BN6PR03MB2562.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjtetQam1F+d/FgQVBTtlt06i7IoSMJzPrzIgDvCBC42rctuwhJQYjsdUn0obGmWAl6bqeGlmFkXwlHpKg4SCHjibZItY73+T3E1v5X42w9P/W/cQlD627omTwxMIlz/9f5JC6pRcBMGAWllDGNTLQXlkhQFWzr9diSMsoKADppgSUv2h/RL3EKyc/9sJZD7YNCq67UounWKJ6NXhOF9gdtNMQ/CNZ5l0I8H3JgGhCkcmz9GdAzsN4kJJ3dZ7/EZyRQqHfbVvGCQbtHx+Mhd1N6JAa9Urx+z3Zbx1qkL0j9eUcCKf6ZbRe5qk5XiWvwwcQLlFh81Qd0wlmL6cbYFqCsBmW47AYPjt71S5nzpu35rBGU8K1PYPsP/twoLFppllONYME4EtzhR4TfTvdOF8GOrTP47cDhj5sluW2fir9dn1jDESyX6MV7iQ/dQg6bxtRWdN1hSsBwm5+sat4klN1XW2EhsMWQ5zyvCq2gFxpU6aRsoPEaiVw8eLuK4n8qSImEvclsUIsqAhcM6HAwsAwQ3BUXT5oEqkw+VnpxjwJBXOOsiCSpiyrC9jYhy+0fMrDXdsh/IuRkP7vstJyDFo8pkOBXOLU6FQAO2tTAADgFJ0BecSBUJcwR9zDWrUsCyks1CZII/Fg0SQ3wCXkrinA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(83380400001)(33716001)(53546011)(6486002)(2906002)(6666004)(6512007)(85182001)(9686003)(26005)(186003)(6506007)(38100700002)(5660300002)(86362001)(66476007)(66946007)(66556008)(82960400001)(6916009)(316002)(54906003)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2dxZW9RdVVhZ1J3c3ptTXBEYjFHVlB6VStxWnVGK3g3c3BSQitPOWFwbEo4?=
 =?utf-8?B?VlhLNkhDQU9tK1lYR0RMeUVqN1lyTlkyUkJqMFJ3eHRRM0VvTGZLMktzdDlC?=
 =?utf-8?B?R0Jyc0FRM3ltQWNjMGNub2R4SzhQY1pKRnpFem9iQ2MwTjlGcXVmT3lwUFB5?=
 =?utf-8?B?QkFXLzMwSzdKSkFLbUVydWphU3U3NndmNWVIQ0xzNFExUXk3VUh6Mi9uTnBB?=
 =?utf-8?B?aStueithM3U0cFFFMEY4aXZRU3ZvYmNxS1gzZHNHWGY3VVlwWHZid2NFWGMr?=
 =?utf-8?B?WWIvTkhtMXhYSU92bTFLWnJDdTdvc1dZUnVDdzJPZU50RU40OEpzTnJIM2xn?=
 =?utf-8?B?UElLVWNLd1ZGK2RYaitVZDVvYlJhRGREQ1ZoUWtCSVFrS2djVXJLZ1lOTkJB?=
 =?utf-8?B?TUVUaUowbHMvUGwwK3UvZ3ZiQVFLejRDeVZlMjMvZEpkeFNHSXc3MUVacmpC?=
 =?utf-8?B?SHZGclpOZ0EvVnMwWmRXZnk0WVo2cXpFdDZHU2VjYmIvcFpvbGQxSXQrZVBx?=
 =?utf-8?B?aHFYNGhRM2lsTDN2YndkeWprcTExTVhRSG5OZFAwUWJvd1htdmUySmVPdDBQ?=
 =?utf-8?B?N3Z3a0R6NnB0Uk5WQkFoNTFWLzZSRTIzQjROMDEvMUlnRW1RYnZPaFVaajBX?=
 =?utf-8?B?ZnkrNXRYY0VQbWl2Ym5mMW1xYmU3VlNoNjN0U0JaeWx0SThOMFFpSEZNRjZi?=
 =?utf-8?B?dWE1djA5c3BGaGRHS3JxU0hOZnZyQy9kYy9mVG9aOTY5K0pnOFZ0dURnNHpE?=
 =?utf-8?B?TCtVcTVpMVg4VlBUZGo1L2FYWVZtY2lkV1dwSzQ4emRSbVozVG00eDBYYm51?=
 =?utf-8?B?M21iTDl3U0xZMnlkLzlhUXBFbkp6VTBBQUxuRW9vZTRSdFZOaXZQeldOY2dj?=
 =?utf-8?B?eGl2SUc1dHZ1RHdNbnNsN1g2Y0t4MEpqQ01GY0ExZUNnMC8zMWRLL1N5MFJx?=
 =?utf-8?B?a3BNYWxDRmlQZVh2WXBmQmdidDMzTXJhOUQxa2xUNHVBZmorbng1LzFDbkNZ?=
 =?utf-8?B?M1psN3I1L2Z0TU5tWVVwWExvL3U4ZURxMWlLaGpWNW9ua0l6akkrWlIwR3Jp?=
 =?utf-8?B?eFdRMjRxUVJBWGFKUDFBS0h5d1kzbitXbjR5UW9teGtVRTJtUFJKbkJpSXAw?=
 =?utf-8?B?ZVRjQ1duQ2JCZElOamZzNFNsUVEyVVRSQk9iYnNrT1lsN1pjSnhScFk1cG9v?=
 =?utf-8?B?MTY1RnJ4N0VQQlh6MWFKQnhQVVpqYWlEUVpLYjF2T3BOOUk3d3IwOWlYZU5T?=
 =?utf-8?B?UTdsNE42Y0w0cWttL3R6ampxaEYvMEt1NVFnZmwxeDlHamx5bit2U1o5QU50?=
 =?utf-8?B?aUp1c2J1RDVmQnVXdUJTblU1QUwrMGZoTFVOM3pnYjhaVmpxaVAzekQ4c3Ex?=
 =?utf-8?B?cXVxSUUvQnErUlBHTm1SbTgwL3FHZXRnM2p2QmZlMkhHSTdoRWd4UXNFR2hF?=
 =?utf-8?B?RVQ1UXZuMDd1cy83ditnakVTeUpOM1hQc0pObThkSUpMd0JBRGY5bno3YU5w?=
 =?utf-8?B?OXlKdkVUMjRxOHdXeG1wOEhSWDZjR2VxU1E1V2FKd05vVUtCcWs0K3lXTzVE?=
 =?utf-8?B?K1J1eUtIRDM3R1lrS09pd0UzdjNibGZqUzdqZzVDRG8zbStLOU1iN3NCd09I?=
 =?utf-8?B?RzNHOCt6Y29ZYjdzckc0SzZRTGc5emdQOHJvNUdXeHdmQWM0aW5FbzFjNmYv?=
 =?utf-8?B?QWUxTWRvNlIvQkpUSlpWYi95SXNoczh5eWh6cmcrblg1ajdJTFVlL3RLYmh0?=
 =?utf-8?B?MWJqUVdkSjExTnQzb1RmR1ZYQkpncEs4OUxiYzJodHI4ZFJTaFE2WHlnTDAw?=
 =?utf-8?B?Vy9UMW00UnRxdEh4LzBxU1IyNGliUElqYVFBbXNDUktobEl0N3R1aUFxb1ZG?=
 =?utf-8?B?RU5KcUhxU1lueGdKQk1SblRYYnBXeHQ2SmNkV0FsRkhvZFQ5VE1QekxabzN3?=
 =?utf-8?B?dGRIcVBpdEZ6T1BMZEpyblAxY2ljNkJ1OG5obnJOOUJIeTlsYXZzRGxKRTJO?=
 =?utf-8?B?VHBCeEVQVkJlQk1xa3E0cnlCd21Wc0ZpWDZvVXRnVE1Bby9VM2xVdGFrcE1y?=
 =?utf-8?B?RHNSRmV0YnVJZ05DVEorbFoyVDhSY1lYUmxFVzVkWEF2Wnp5NHJpNTAwVS9K?=
 =?utf-8?B?QlUxTnBESXlBblJDSUhGVk50T3FrVkdnVUVMcFBTclpVRGxXaG9ZVHNkQzB5?=
 =?utf-8?Q?XXOcclNa/jnqOb5upVnlbN8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0060474a-2598-4129-8937-08d9ea1f66b3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 09:51:23.9750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs1r2NHkSL3XGEaieCavxiIvvbMlao0y6mJUETqLPBPavoF++txoqyv2bbC5rLQq3S4jyRSzySCIGalZsu6DLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2562
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 09:21:11AM +0100, Jan Beulich wrote:
> On 05.02.2022 11:18, Roger Pau Monne wrote:
> > Make sure softirqs are processed at least once for every call to
> > pvh_populate_memory_range. It's likely that none of the calls to
> > pvh_populate_memory_range will perform 64 iterations, in which case
> > softirqs won't be processed for the whole duration of the p2m
> > population.
> > 
> > In order to force softirqs to be processed at least once for every
> > pvh_populate_memory_range call move the increasing of 'i' to be done
> > after evaluation, so on the first loop iteration softirqs will
> > unconditionally be processed.
> 
> Nit: The change still guarantees one invocation only for every
> iteration not encountering an error. That's fine from a functional
> pov, but doesn't fully match what you claim.

OK, will fix on next iteration.

> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -186,7 +186,7 @@ static int __init pvh_populate_memory_range(struct domain *d,
> >          start += 1UL << order;
> >          nr_pages -= 1UL << order;
> >          order_stats[order]++;
> > -        if ( (++i % MAP_MAX_ITER) == 0 )
> > +        if ( (i++ % MAP_MAX_ITER) == 0 )
> >              process_pending_softirqs();
> >      }
> 
> This way is perhaps easiest, so
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> but I'd like you to consider to avoid doing this on the first
> iteration. How about keeping the code here as is, but instead
> insert an invocation in the sole caller (and there unconditionally
> at the end of every successful loop iteration)?

In fact I was thinking that we should call process_pending_softirqs on
every iteration: the calls to guest_physmap_add_page could use a 1G
page order, so if not using sync-pt (at least until your series for
IOMMU super-page support is committed) mapping a whole 1G page using
4K chunks on the IOMMU page-tables could be quite time consuming, and
hence we would likely need to process softirqs on every iteration.

> 
> Furthermore, how about taking the opportunity and deleting the mis-
> named and single-use-only MAP_MAX_ITER define?

Right, let me know your opinion about the comment above.

Thanks, Roger.

