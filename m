Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065DC36D617
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 13:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119230.225649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbi1a-0002Qx-K7; Wed, 28 Apr 2021 11:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119230.225649; Wed, 28 Apr 2021 11:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbi1a-0002QY-Gi; Wed, 28 Apr 2021 11:06:34 +0000
Received: by outflank-mailman (input) for mailman id 119230;
 Wed, 28 Apr 2021 11:06:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SCdR=JZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbi1Y-0002QS-UJ
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 11:06:32 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a13cb6ce-6c81-47f5-aa74-1577f614331a;
 Wed, 28 Apr 2021 11:06:31 +0000 (UTC)
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
X-Inumbo-ID: a13cb6ce-6c81-47f5-aa74-1577f614331a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619607991;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+8qCObxRB8JssHPAPVXli65FHYrSPDhjLFOe6o/JdWs=;
  b=PEZ9boZfhG3Tjymren/KWKE0LjzDdYVdcz2S6wYeBZp3AbQE6Y9PiTHU
   JxXJr0SDFliBuLGJxk6GebBK2cSiEloukOooaA+89R/SC7dHYb3DL0QIL
   K/bQPeFnSwnMN9MdJjTFUrBAzRfV8IIXYBZ8V3KbZKEb8aqG1Rm6rVMh6
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WgASG3NqSUC6CIZoLqE21aEE3+3k2QgspxjPPbvlkZ/02o3lVH68S6BYGosEqdQNIkyepy15Ut
 feAMpngzq/VCgCjCRx0dHkcRKdrXMX8qMInhwDrRa1MpErpQSOM6PeXPF4F3f8DXxapLjLFFAL
 dzxcncBFxJL7Yy4ZJvR25pFJKYpOOiLa2J7qhDrntuOwv9FrlhKbzmzdxTUpVEAcpAVSfDp2gm
 2AgtE3hRpGTaCJu0MiTf5eE7u36uUPRSCzxnKWb/VpYY+rasN6KjiQ28wrDtf4CQLT5sUmbn5s
 IcE=
X-SBRS: 5.1
X-MesageID: 42712285
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:b9yFG6wip6jTjUdzJ5dVKrPxnu4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnm6JdybI6eZOvRhPvtmftFoFt6oP+3ybtcheQysd07o
 0lSaR3DbTLYWRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRC51IxS0RMHf8LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7Le0Utde7FutHNidbaehYAHREq802jijmv5b78HXGjr2sjehlIxqov9n
 WArhzh6syYwouG4zL/90uW1ZRZn9P91sBObfbstuE5Iijh4zzYAbhJdKaFuFkO0YWSwXYs1O
 LBuhIxe/l0gkmhAV2dhTvI903e3C0163nkoGXo8kfLhcDiXjo1B45gqOtiA2PkwnEttt19z6
 5Htljx3/E8YGKi7UaNkuTgbB1kmlG5pnAvi4co/gdieLATdaNLqsgn9F5Vea1wbB7S0pwtE+
 VlEajnlY9rWG6dBkqp2VVH8ZiHW3Q+GQq+WU4SusCZ+Cg+pgEJ82IogOMYhXsO75Q7Vt1t4P
 nFKL1hkPV0QtYRdr8VPpZPfeKHTkj2BT7cOmObJlrqUIkBJnL2spbypJE4/vujdpAkxIY78a
 6xHm9whCoXQQbDGMeO1JpE/lTmW2OmRwngzclY+txQpqD8bKCDC1zBdHke1++b59kPCMzSXP
 i+fLhMBeX4EGfoEYFVmyXjRphpL2UEWsF9gKd6Z3u+5ubwbqH6vO3Sd/jeYJD3Fyw/Z2/5Cn
 wfGBfpIsFt6V2qR2/YjBDdV2iFQD27wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9ow6FX
 EOZI/Po+eeny2b7GzI52JmNl52FUBO+ojtVHtMuEsvO0PwerAThsWHdQlprTy6Dy46a/mTPB
 9Uplxx967yBYeX3zoeB9WuNX/fqHcPunSQTdM5lreY7cnoPrM0Z6xWGZBZJEHuLVhYiAxqoG
 BMZEsvXUnEDA7jjq2jkdgzH+HQd951hS+xOs5KoXfjtUGRzPtfBEczbnqLa4q6kAwuTz1bih
 la6KkEmoeNnj6pNC8CmugiCUZNb26WGbpCKwyAaOxv6/bWUTA1aV3PqS2Rihk1dGav00kJnG
 TuIReZfuzxDkNHtmpV1bvr911IZnyQFngAGExSgMlYLyDrq3xz2eiEau6I32ydZkAr78sdPD
 vGCAFiaD9G9pSS7lq4iTyCHXIpytESJeTbFq0kaKyW8GiqMpe0maYPGOJ08J5pOMv1iPICVf
 uSdmauXWrFItJs/zbQimcuOSFypnVhrOjh3wf96nOkmFE4GvjfLT1dNvgmCuDZy1KhYfmG0J
 90141o+cSxN3j8cd6Ax+X8aSVZJhbavG6xSKUJpPlvzNUPnYo2O6Oedz3CkExj9lEZCuzfkU
 sFWqR14LzbIOZUDocvUhMc2mBsrciFKUsgjxf/DeA/d2w8lnOzBaL835P47Z4URnCbrAT+OV
 Oj4zRQ0vfMUSyEz6MbAcsLUBJrQXl5zHRp5+WZcYLMTC2sauFY5VK/W0XNPYN1eeygGb8KqA
 x97MzNt+iLdzDg0ASVmTdgOKpB/yKGRsy1aTj8VdJgwpifOV6WhLGt79P2pDDrSSGjY0BdvL
 Z7TyUrH4x+owhnqpY23Ci0QrH2pUxgs2I220AYqnfdnq684GnaGklaNxb+mZs+Z0gKDkS1
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="42712285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToX4TrWcP1uqBKGzFkNmwGlsEHkPV/9hf0AauPSpvP1bGT7Jdb5M96Hh/GPzcC8BMYgdiCqS77LliGKxVOFRsoiq7uTR0xzaXBjw0pTrjVtx2peM7YjT1c1/diCmszFphen49kUIEkoEA4rh2MFWCTXZOv59oD7h7sJlU0Ikaigrc9Aoe8bMo0J2Ewg8UhoVPCVnJEJPoFhj6rFd6guYODL2ioo2h/4vlKinOUAxhXFFmQ6QKG7+yfh4ymwdBDO93eNV5bk/bVwDiyEFOClEwCrIlWmJK4RlpgjKSCT3Z76lWIM8uGSpjwBTMRJpsqkVtCjkTpc0NNpVYiCJGEx2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkHRjpcmHEhszRzziguO/Z26ZAnZT1U3ct/YJ0mTU3Q=;
 b=BABmtcxtDN0r56VszU5gHsFlbCH8XisqrsQXnYQ/GwO4rTwygjbWRQ0lLdnOd5SPOkd+kglga3b8TnV8Ym45x/AND8VBy0sBFtrPvJeTHz3RPXph4cq+9ubmzS8UOMuK4SLY0EYmsGF67ztCekldO3cpjiz1dfbYOfxbSz7c5NuRG5DKe+UqA/5TMMuCA9eYrjUlZnRBzlRzlSmMYxGX9ju+xv/aHoQufmuZk76pV7c3A2pdLn/scY5Qm8DtZPeGNFDSmnqMzcnjoYHvRArZg9lwR1pPyopabStUEnjeay6buVJ/XR3UMNEL2S9weuCEumhyKp1kWJf5nkZwsl/Dzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkHRjpcmHEhszRzziguO/Z26ZAnZT1U3ct/YJ0mTU3Q=;
 b=ELg9QEmOMIGtEk8/d8JSsX11G5m7FG0ylc9CCbrBWaud38jERA3sCMeb6jNebME0Ru2FOtd8UuWOBaJuLU3Vs7htunAe96316N1MLNgh2lYuPt21PU/IkNfIikG6Xi1qwTfSFouJyftZ/prkgcDhXoLOOekii6PVlwJrxxTPEMk=
Date: Wed, 28 Apr 2021 13:06:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/3] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Message-ID: <YIlBnQO+iuFFx2XO@Air-de-Roger>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <7b6651f10922571a10685dc7652fbce03b6b6e51.1619453100.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b6651f10922571a10685dc7652fbce03b6b6e51.1619453100.git.rahul.singh@arm.com>
X-ClientProxiedBy: MR2P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2577591-a4a4-463f-20b0-08d90a35a1e9
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB532398EFA6ABA3A2B579054E8F409@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhBlnDjSCk5MzE43rF4yUwzror7C8wGxw6XLvdtNIsH60WwQNuiwrc+w1/zO6PBmsgogTW3Mf+szpIrbrNaTcBI27Z+hqI5m4OMmZZ7iMnIVtP/cwoAsmtMExoK5+ce4KhbfakVJ4qoYRn0u5Yks+cqrW4yCgKglXKD8UE8MR+t7CmNTw8JwdxYtuwi3UcPXYrWSX+w7uaoF0lhGZyHZpPGgdtKUVpZsE17imAFqexDaeXtsr2WtKwGtOU6GhmMrKWRwEtDh6SQGJfFdYySRzoIBM+1geCe9iS/zkjoKTPNI4iwPQtTlAtut4Hd8Tc2KY6+yhkWl92pqoAcod0Savwz8qCiaFBDOXGRZJkyqFs9BgkyodNS74MblIq3ow9hmoL8NozQ+7tg1/qvazLDXqIpj0FQfsjmSFcffmVT/v7vZ8khTipXR2agz/kYG4pbUToqKWkDtY6CuMXbgyMdF5e/2pK1E3n9PePW/ngWDQRpq9MteM46KgigHPo0/9DNsU1Q3mof58eUCSXC4X+G5nUhSoM+Ac+WIaSDu/UvtKIQAD/J7vzRr1UT87Tr2hVL1ql0RwynsFGXC6uGj6+0BIdyKKVLPtH0YqNu6DI8Z8ADsrHdkhFo2Mu5SLJtibNq7RkuQZndAPbevh1jlb2piTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(478600001)(4326008)(2906002)(6916009)(8936002)(6496006)(33716001)(8676002)(38100700002)(6486002)(54906003)(6666004)(316002)(16526019)(26005)(186003)(85182001)(66946007)(66556008)(66476007)(956004)(9686003)(83380400001)(86362001)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z2hUZ3UyNTgwY1IvdWJuWG5PZFNocG4xQ01xL3BRRzBBb0IvVEQzdkZqWmRY?=
 =?utf-8?B?N0NBSUZSb2REenpTa20wUk0wUlpyeFZQVnA4UDRuZ0NKbXpmazA4b05OS1hH?=
 =?utf-8?B?SkwwUDBYdVNRRjJkeFRnY3lqUWZWbjgwZElQZjUxaDVNeHA4U3dvR05DTm9R?=
 =?utf-8?B?WHkralh6QjdQNmh2c1NKTTVZZGpUMTNWU2hnakJnNGVJS2dtOVRuVjVBbGFs?=
 =?utf-8?B?bDhzeXVjOFVoaDFzL0lodEZ6ZjNVYUE5Vm5aWXlIcThQMm92MUY2ZGdieXVu?=
 =?utf-8?B?dSt6ZW5UK040Ynd0VnBOOUoxU0pQM1ZKaGNoMVhFbXA2S05aS0xhaWh6VUpx?=
 =?utf-8?B?V2FKNGQ0R001UStBeFBjMWFZK2piTzZuYVArQlNTM2lYME9DMm1wQ0NNRjN4?=
 =?utf-8?B?R0lKRFFOaFhySDlRWUVYR2g1bUZRTmVFblR0Q1pxcEJxT1VJVTJDdFpzRGlW?=
 =?utf-8?B?c3RuZGRQZHc1eFpQZmFvbmNPanNWYkkrV2J6Z0FyZnA5ekJVUG9MblRMN2ZI?=
 =?utf-8?B?NXQvSkNWYWs4cmY1cy81UlUxZXVxTzA4MklBMXIreTJETWRDNkZ3UWdXdWp1?=
 =?utf-8?B?bitLYWtzZGIzRWNMcUhJbFIrcG1jQy9FNEFlc0hYMWRyV2o4YXJnZlB0UGFV?=
 =?utf-8?B?a294b0E4dmpiSE14MFpjVmJYZlM3SWJFbkJ0UTZ0a1N3VExWdnVuOHhPRUNC?=
 =?utf-8?B?alB0eGdmOUlycldRaEpVNHNuU1RxcDIvYURxei8wNkRpUEJRVTUyNE1kVFJL?=
 =?utf-8?B?WFJxdkNNWXplcXVIbHZ5TDYvUmVjZ1ltUkMxQ1hKR3VxWVE2SWdMUk1PZTZL?=
 =?utf-8?B?WlF5aTNBZkVmbFYreWl1ckZZNHpZTnA2VFZxaFBVTXU2aElJcUV5ajZleGZY?=
 =?utf-8?B?VXR6bHFKNEV0NU1rUWQ3cGlpMWE3VEt3TzhEYm4vd3ZpYmUrd1lDRFRiRkpi?=
 =?utf-8?B?RjJLQkM3ZHJKczJBcDhoSURlYmI4OVBveStkTEdWczB3MlFrcVNON3JBaldt?=
 =?utf-8?B?TjRyUUMvT0EzTlZXWHJITkVYWXVkYTZwMFpGRm50eGM0OUdWRXg3Rnh1YUVY?=
 =?utf-8?B?MkhsM3VYZGxDdmw0dkRhTGRJaXQ5K2J0VEhWM2hCWHFuY3habmVtdlJsQVJo?=
 =?utf-8?B?S3RLMk9GWGhMaDltQjg4Rnh1aFhJdWhUTTlZN2F4NHFiaUxOVEk0OXVxN0lo?=
 =?utf-8?B?SkMwK3ppL3QwY3F1elFwRVBzNXR2YjdOd2NzUUlaTkF0WThCUVpHQzRZMEJ2?=
 =?utf-8?B?L1U1RE5pbmI1Nk13d1Aya29SQzU4ek95QncxbS9ZUExLcG5DejZ4RkNwNGJE?=
 =?utf-8?B?dWhvRnAzclJydkZmMklDeDRYcnE1VHM3NlFsNmVvazRmU3h0bjhXQSs0YmRN?=
 =?utf-8?B?NDNzVG56bVdMSXJkY2xHVjBRVThiZ05ETUVSdDVrT0diOHRzTUdHNkkybko2?=
 =?utf-8?B?Z2wwdkU3a0p0RFBEU3BVdDBUeGZIUlVXeUZRRmhuTHoyL25EeTIyU2tiSFBk?=
 =?utf-8?B?UUFhY1J6dzhPakhCZU4xNERLbFhDdGE3K3JDTHN6ZnFqc0diOGtEV2VrM044?=
 =?utf-8?B?QmZmN3RyOHNuQ05zLytpdWNOTm51OVc5QjhneUdneHllMVd5b2Y2dDJmb3dt?=
 =?utf-8?B?SjJKUlUvak5GYWZOaXdXWURqbVc3RWViVHVOYmFDcm5yVTdSSEp3SGlUYzBJ?=
 =?utf-8?B?bmk2UDIwdk5MT0pNVG5mRXRWcWtMaktCbGZnVnFUOXNHbkxaRitiaDljUXEx?=
 =?utf-8?Q?mTgMG/H9zSquo1JCf35CqxZQDHawnj5d3j6Zl1G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2577591-a4a4-463f-20b0-08d90a35a1e9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 11:06:11.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: safv87N3NCM2gGNWvYPT5xqlsYNATr4b8aoWP8XoAV5LD6fMW8CeFo7w1g5r2bjNWYoDAQaPctya9xqudVr0Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

On Mon, Apr 26, 2021 at 05:21:27PM +0100, Rahul Singh wrote:
> MSI code that implements MSI functionality to support MSI within XEN is
> not usable on ARM. Move the code under CONFIG_PCI_MSI_INTERCEPT flag to
> gate the code for ARM.
> 
> Currently, we have no idea how MSI functionality will be supported for
> other architecture therefore we have decided to move the code under
> CONFIG_PCI_MSI_INTERCEPT. We know this is not the right flag to gate the
> code but to avoid an extra flag we decided to use this.
> 
> No functional change intended.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

I think this is fine, as we don't really want to add another Kconfig
option (ie: CONFIG_PCI_MSI) for just the non explicitly intercept MSI
code.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Some nits below...

> ---
> Changes since v2:
>  - This patch is added in this version.
> ---
>  xen/drivers/passthrough/msi-intercept.c | 41 +++++++++++++++++++++++++
>  xen/drivers/passthrough/pci.c           | 34 ++++----------------
>  xen/include/xen/msi-intercept.h         |  7 +++++
>  xen/include/xen/pci.h                   | 11 ++++---
>  4 files changed, 61 insertions(+), 32 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/msi-intercept.c b/xen/drivers/passthrough/msi-intercept.c
> index 1edae6d4e8..33ab71514d 100644
> --- a/xen/drivers/passthrough/msi-intercept.c
> +++ b/xen/drivers/passthrough/msi-intercept.c
> @@ -19,6 +19,47 @@
>  #include <asm/msi.h>
>  #include <asm/hvm/io.h>
>  
> +int pdev_msi_init(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    INIT_LIST_HEAD(&pdev->msi_list);
> +
> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSI);
> +    if ( pos )
> +    {
> +        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
> +
> +        pdev->msi_maxvec = multi_msi_capable(ctrl);
> +    }
> +
> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSIX);
> +    if ( pos )
> +    {
> +        struct arch_msix *msix = xzalloc(struct arch_msix);
> +        uint16_t ctrl;
> +
> +        if ( !msix )
> +            return -ENOMEM;
> +
> +        spin_lock_init(&msix->table_lock);
> +
> +        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> +        msix->nr_entries = msix_table_size(ctrl);
> +
> +        pdev->msix = msix;
> +    }
> +
> +    return 0;
> +}
> +
> +void pdev_msi_deinit(struct pci_dev *pdev)
> +{
> +    XFREE(pdev->msix);
> +}
> +
>  int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
>  {
>      int rc;
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 298be21b5b..b1e3c711ad 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -314,6 +314,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>  {
>      struct pci_dev *pdev;
>      unsigned int pos;
> +    int rc;
>  
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
> @@ -327,35 +328,12 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      *((u8*) &pdev->bus) = bus;
>      *((u8*) &pdev->devfn) = devfn;
>      pdev->domain = NULL;
> -    INIT_LIST_HEAD(&pdev->msi_list);
> -
> -    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> -                              PCI_CAP_ID_MSI);
> -    if ( pos )
> -    {
> -        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
>  
> -        pdev->msi_maxvec = multi_msi_capable(ctrl);
> -    }
> -
> -    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> -                              PCI_CAP_ID_MSIX);
> -    if ( pos )
> +    rc = pdev_msi_init(pdev);
> +    if ( rc )
>      {
> -        struct arch_msix *msix = xzalloc(struct arch_msix);
> -        uint16_t ctrl;
> -
> -        if ( !msix )
> -        {
> -            xfree(pdev);
> -            return NULL;
> -        }
> -        spin_lock_init(&msix->table_lock);
> -
> -        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> -        msix->nr_entries = msix_table_size(ctrl);
> -
> -        pdev->msix = msix;
> +        XFREE(pdev);

There's no need to use XFREE here, plain xfree is fine since pdev is a
local variable so makes no sense to assign to NULL before returning.

> +        return NULL;
>      }
>  
>      list_add(&pdev->alldevs_list, &pseg->alldevs_list);
> @@ -449,7 +427,7 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>      }
>  
>      list_del(&pdev->alldevs_list);
> -    xfree(pdev->msix);
> +    pdev_msi_deinit(pdev);
>      xfree(pdev);
>  }
>  
> diff --git a/xen/include/xen/msi-intercept.h b/xen/include/xen/msi-intercept.h
> index 77c105e286..38ff7a09e1 100644
> --- a/xen/include/xen/msi-intercept.h
> +++ b/xen/include/xen/msi-intercept.h
> @@ -21,16 +21,23 @@
>  
>  #include <asm/msi.h>
>  
> +int pdev_msi_init(struct pci_dev *pdev);
> +void pdev_msi_deinit(struct pci_dev *pdev);
>  int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
>  void pdev_dump_msi(const struct pci_dev *pdev);
>  
>  #else /* !CONFIG_PCI_MSI_INTERCEPT */
> +static inline int pdev_msi_init(struct pci_dev *pdev)
> +{
> +    return 0;
> +}
>  
>  static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
>  {
>      return 0;
>  }
>  
> +static inline void pdev_msi_deinit(struct pci_dev *pdev) {}
>  static inline void pdev_dump_msi(const struct pci_dev *pdev) {}
>  static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
>  
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 8e3d4d9454..f5b57270be 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -79,10 +79,6 @@ struct pci_dev {
>      struct list_head alldevs_list;
>      struct list_head domain_list;
>  
> -    struct list_head msi_list;
> -
> -    struct arch_msix *msix;
> -
>      struct domain *domain;
>  
>      const union {
> @@ -94,7 +90,14 @@ struct pci_dev {
>          pci_sbdf_t sbdf;
>      };
>  
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
> +    struct list_head msi_list;
> +
> +    struct arch_msix *msix;
> +
>      uint8_t msi_maxvec;
> +#endif

This seems to introduce some padding between the sbdf and the msi_list
field. I guess that's better than having two different
CONFIG_PCI_MSI_INTERCEPT guarded regions?

Thanks, Roger.

