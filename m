Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C43430209
	for <lists+xen-devel@lfdr.de>; Sat, 16 Oct 2021 12:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211301.368514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbgw3-0003ww-47; Sat, 16 Oct 2021 10:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211301.368514; Sat, 16 Oct 2021 10:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbgw3-0003uR-0m; Sat, 16 Oct 2021 10:29:03 +0000
Received: by outflank-mailman (input) for mailman id 211301;
 Sat, 16 Oct 2021 10:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UqKg=PE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbgw1-0003uL-RT
 for xen-devel@lists.xenproject.org; Sat, 16 Oct 2021 10:29:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfde1ad6-2e6b-11ec-8283-12813bfff9fa;
 Sat, 16 Oct 2021 10:29:00 +0000 (UTC)
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
X-Inumbo-ID: dfde1ad6-2e6b-11ec-8283-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634380140;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fpe4aNTRTnT6DLHDykLk8hQaQ+coKxhrPSvOpE4LRAk=;
  b=YDaBGae3fSnCbKwc5r3FgJxciBBbun7/B1EzkQWKmWbGbCAGANqCjNkh
   cLSedFKWOejtq88TQQWoCEqdprvCa6o9O1GWJYbqHpq38fpui+aI+Lu6H
   pj++kFMcrRFXShMe1JkM4zozSZU/KfUrF8ICen9dQnZPm2rxB+gvBq0L6
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: J1kIkuNJsRnnUny4HsVWM82M78HiHz2UygNudRPBFU6qz44t9mv+Uk7uSVLT7kJBZr15huERjE
 u/BLiKyAJGlLL5Z5yGRAZGWN3s44NE6o54TFhhjGdcR+xVI3z0WTIptfHStxZQkI6KDzSc9eVi
 387OvdkZLamlhSTyhpaByDI9BcT0bt1i4IxJdKCFsi0aG6NTgixiA2BBCwkUhf0DYLMdXQXq6h
 mXlvtDsCruGX/yfEC9hpccY9xEl0gkd2RzzQORSy4+srBUpqncEQzz9tpczH7ro3zNDRqd9u1Z
 3/nZDnQrXseyD747y8DkTEOw
X-SBRS: 5.1
X-MesageID: 55377331
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fMEjkK8b8KFaTAy6ViMoDrUD93iTJUtcMsCJ2f8bNWPcYEJGY0x3y
 2dLDzuAPfrcZTPweYp2a42y805TsJHVzdcxHQs//ik8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhs0
 PlptrLgeD4DO/adgNgYehJoFgxxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgWxv2ZsVRJ4yY
 eIycyhxNxj4ZyRfP0olGrA5tr/4v0jwJmgwRFW9+vNsvjm7IBZK+IbqNN3Za9mbX/J/l0yTp
 n/F12nhCxRcP9uaoRK/+3Kxgqn0nCX0WKobDrj+/flv6HWRzGEODBwdVXOgvOK0zEW5Xrp3M
 0UJ/gI+oK5081akJvHiWzWorXjCuQQTM/JSDuk75Qel2qfSpQGDCQAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9W9Y3+H6q2dqz/0HCEPNHIDfgcNVw5D6N7myKkykRDnXttlCLSyjND+BXf32
 T/ihDgzgfAfgNAG042//EvbmHS8q57RVAk36w7LGGW/4WtEiJWNPtLyrwKBtLAZcdjfHgLpU
 GU4d9a28fgiKZKjxB20auBWTamV4t+OADjxjgs6d3U+zAiF93mmdIFWxThxIkZ1L8oJEQPUj
 F/vVRB5v8ALYiP7BUNjS8foUZ5ylPm/fTjwfqmMNoImX3RnSOOQEMiCj2ar1GfxjFNkr6g7P
 ZqKGSpHJSdHUfo5pNZaquF07FPK+szc7T+MLXwY507+uVZ7WJJzYe1UWLdpRrthhJ5oWC2Pr
 75i2zKikn2zqtHWbCjN6pI0JlsXN3U9Dp2eg5UJLbLYeFE6QDtxU6W5LVYdl2pNxfU9egDgp
 SnVZ6Ol4ACn2S2vxfuiOxiPl48Drb4g9ClmbETAzH6j2mQ5YJbH0UvsX8BfQFXTz8Q6laQcZ
 6BcI62oW60TIhyaq2V1RcSs9+RKKUX07T9iygL4OVDTibY7HFeXkjIlFyOynBQz4t2f65Vh+
 uP6ilKKKXfBLiw7ZPvrhDuU5wrZlVAWmf5oXluOJd9WeU7295NtJTC3hfgyS/zg4z2artdD/
 wrJUxoeu8fXpIo5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtFLuC
 EKC89VXI5uTP8bhHAJDLQYpdL3bh/oVhiPT/bI+J0CjvH17+7+OUENzORiQiXMCcOspYd19m
 ep44ZwY8Q2yjBYuI+2qtCEM+jTeNGEEXoUmqooeXN3hhD00xwwQepfbECL3vs2CMo0eLkkwL
 zaIr6PenLAAlFHaen8+GHWRj+pQgZMC5EJDwFMYfgnbn9PEgrk83QFL8CRxRQNQl00V3+V2M
 2ltFkt0OaTRoGs42JkdBzihS1NbGRmU2k3t0F9YxmTWQn6hWnHJMGBga/2G+1oU8j4EczVWl
 F1CJL0Jjdo+kBnN4xYP
IronPort-HdrOrdr: A9a23:QHUb2KjtwtIpvKH2sgDTfQjcg3BQX0d13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykKsS+Z2njBLz9I+rDum8rE9ISurQYccegpUdAa0+4QMHfkLqQcfng+OXNWLu
 v62iIRzADQBkj/I/7LS0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13DDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3O
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0ITEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fy1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspcq+SWnqLUwxg1MfheBFBh8Ib1O7qwk5y4KoOgFt7TNEJxBy/r1Zop8CnKhNAqWsqd
 60dJiBOdl1P7srhJlGdZU8qP2MexrwqCL3QRGvyGvcZdQ60lL22tXKCeYOlauXkKJh9upEpH
 2GaiIAiVIP
X-IronPort-AV: E=Sophos;i="5.85,378,1624334400"; 
   d="scan'208";a="55377331"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUwNBL3JyckKk3quoDmvVM3Vw8aHXWONytzuJEBRDTFGjkEFz2mE3NUgGJ3yB97y6fHla40uE2lE/Bw6IqET4SUyF+fnS32lHKUyANeV9Pbg+BicZcT/D9e3hsO2y+LRsmOv+HUM0XGA8zlSRoTGOnRbP1MI9Rzn2mvMhmRjaq16Kw6esQINNGdPALjPq1Ri6/MZwW6sGJmBEDi3tukk3ueLWhmhDdNVJRbm22Nk5lgLHANg5v8zxgThf8rRXewZF0Dm9MP0rplNc/zisaPz4u2SUOjEs0w6vUBVA1xyg7UZKOuRdNDDWPatVMZ7r+xpSmj2FjETl6WR0YmUF4ZXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dcrc6y8tGnkbkpUojhCEgZSqBl91j1MTHBx0ByDrd4g=;
 b=XYh1MrWdtCqR8HTJKdFXt1z1zrmc89DZ2pIdUX/0lXiKEXQ8Q5NJ9yith312XmOxHYi0Zrypk7KQcfhxN57eQYJtTdYOoI9MDMlly5RqffTmjHCarGEmtb7Qv9tnB+QDhGzT+GhLuDpKYhdjIPeCAfBXyM2vflht3EW5M+MJ0mZkM6VM9oqZ91Q7/XqxHX/8XzC4wv25m0cnYO1FwTGq2x6HPGZ4qFSz8SYXN0uUMrGFyTT23E9Ya0L75S2nBuDDoni5TRL2rzVN1eTPMeRRT5gLZpEgQkYUUq+e1N79i/Vato3RSNj9KneObbRkSRjlOesrTkPzHoiPkuwavatrBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dcrc6y8tGnkbkpUojhCEgZSqBl91j1MTHBx0ByDrd4g=;
 b=a25LXpzHUco9oLXzFKjTOcPq5q6EC2mCWgodqX/rQ+x03mNjTBj2gNx0ztWz5vP5GOS7FLWYinbxY3toUr15WoZfwC5t4yLvKqs5UUR7ih6blsjyLIfujf+aU0igmL/mSYy1H8EcD6LCBzu03E7vgfT1poXKhn5FudW5E+RZNdA=
Date: Sat, 16 Oct 2021 12:28:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	"iwj@xenproject.org" <iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Message-ID: <YWqpQyKvNzE8GYda@MacBook-Air-de-Roger.local>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
 <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
 <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
 <alpine.DEB.2.21.2110151235100.31303@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110151235100.31303@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: LO4P123CA0234.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20749868-7408-4067-6eaa-08d9908faf15
X-MS-TrafficTypeDiagnostic: DM4PR03MB5966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59663DFA041BF1D328B284728FBA9@DM4PR03MB5966.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwUud9v0naAnUZvMx1vk5uGrSMG5zaryU6Gi2qdktChIth2YD18hF1J/TnDVwtnPNg6f4+4cH+ngiZDpch1yXzxWYKJ1pEoDZbzyP6eLgAIqRKdPWn7/l4N7i7dlacQBBz/ovAG8nkKhKF6XQWAod+e5Z6zOzPNJ0N3vxCts9MShniOos5uNuAeqxL/oiN9+Ut0sUGxR5tRcthJPYyAEVoP+EZKMeSPsjPsBs27T/JyKz0JFxY4g3oFCSEJ+49zsomPFGk8fMD2d3MC95FGE8KBnfGTvOf8YJ3sAn6sV1vHJ0nyhtuhBO9o9bR+PEek5Xhy/o88JKvHTa9RbWIE1KCSYmijuzGDRd+GBjp4RNkkQnTsDVzqhi38Ly0PgV/B0KkL/Uc/jZmrz7/VNSqZxXi3Hycn1PNWjYoChBTqbFQY7Z2F63s4EmjCJ4UdWnipFYaRnrAxbzW6FYRwaXDI71YAxE+77oWf34BwV4cwIQghlebffFOLL5hjCD9dUAGJkyd9WFL7FIfSzUFyKWVC+Z5gxBdSqN7SmA24uof/R2DZ+V76dfyhaXbmtU3KIMMOBbXyJgdcHJq+F7e6pyz/C8K7/awmDRCwmIoi5k1YCst2J30td1vv4CrAiLQ02i9VLwABeI7Wax9oP96mHpfC2Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66946007)(38100700002)(8936002)(66476007)(186003)(7416002)(85182001)(53546011)(26005)(66556008)(316002)(83380400001)(8676002)(82960400001)(6666004)(54906003)(6486002)(956004)(6916009)(4326008)(6496006)(2906002)(86362001)(508600001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWl2NHZNSGE3WWxKUFlEQXhRUGFpbWpOQkpQeW94YnlsYURhdTJoWDhDY3RM?=
 =?utf-8?B?MlAvOWJTdWpGY1gxaS9PQmY3N2QzT2xSdm1udDN1MVNBUkZQZkg2dHBjZFo2?=
 =?utf-8?B?WXJ5SElpemdYVFhFOVZrQUZmU0wrakNzdVdLWVRRN3BRaGZqdVYycUZra2d6?=
 =?utf-8?B?a2xFcnVFaXphRDBXV2hqY0kyWDZLcGZwb2pzSlpGcTJCcDZMdkdDd1hXY3RU?=
 =?utf-8?B?ZzdEamdndHNFNWhEZ0FuZXN0RjRiQ3JIOWJoOWRNaEpubU9PVzdIWjhqa0JX?=
 =?utf-8?B?K3VOOThlYWNYamc3Q3NuQldBNGtscW51K1ZTSmdNc3JUV1M2UmJILzVGNHlw?=
 =?utf-8?B?V0x2MnhqczdkSWJIMTdJOXdDLzZnZmRQaEYzbUVrQjdRcllzL21tZ3NOSWI1?=
 =?utf-8?B?aHJ6ZlB0M21ySjlweVhIaXFFRVY3RnNrbEgzMlI1eVRITkRKOHdWUHlyQ0gx?=
 =?utf-8?B?d1cxV2JQb1VQSTZWK3JhbGlmdVh1NjYxSm54S2J0dkI3Wm1nbnFBYThwSk9r?=
 =?utf-8?B?cWpUMHowckRiYjdYVDFETXI2NlBKYWQwOW4xQTExWWMxaE5oejdjayt0eWh3?=
 =?utf-8?B?WU1YQWJzZjI1a0pEVFVXa2xydElFSzcxM1VDQ3duZHdMeUFGVEZUenJsWEVF?=
 =?utf-8?B?VjBNOFpGZ1dBRytab1M3a2p6N1NJMWw2eDJWWEg4ZDJsbVVMcHE3eVNDOEtL?=
 =?utf-8?B?aWZETGJENC9OU1NqT3VNV01hNmJ2NldhZ1ZoeEhqemhkeElUMmpZNEJzVmtN?=
 =?utf-8?B?WHlXTUtCN2wxSytDSHVFTWlXUTF0bFdyNUc0ZGNaV0xEdTBJaFVaWnZpcDUr?=
 =?utf-8?B?NEp2bm1KRWx6Z0tQUnlPSkJjYnNVRVNNZ2NaRmJTUTNqRFcxKzJ5SUJIVjFN?=
 =?utf-8?B?eXk0WTIzOEx6TnBDZXF4Z2xocDhzMloyaXlXc096WWxvakFFSzdIY3ZJVjZU?=
 =?utf-8?B?ZXZMOUVSbGhreVRLeTExSUFEcDdzZmVsRmgxWm40VnJZdzJZM0syNGk2dmlN?=
 =?utf-8?B?NDJrODk2OEpsWUFJNEYxYWhZOTA1elc2dVpCM1FGWjd2QzhzcXdpM1lXdGhT?=
 =?utf-8?B?anVsOTNGTCtTWTF5RXZtUkZsdmRTbmxhb0NicnJrQlRaalQvVkY1azVRbDQy?=
 =?utf-8?B?Y0dBZXRlZXFkakNqSnJkdHVsdlliWG4reVhVK3FpbkpyNHVVTU9nd1JmZmZn?=
 =?utf-8?B?TzhrL1IzOHRmKzZaZnUrVVpNLzZMWFVuNVJITzBTRnlhdm5tVVhJSjFkWklx?=
 =?utf-8?B?emcwSEUvM3pVRE5GT25HSlB0bVp5cjdkTldpVU9PQ1NFSVI2MUJVRGh0b3pL?=
 =?utf-8?B?M0hYS0hIQzRmb202MFYvbXZIR2gza1RSYXhsVU10bGFCT0tnTnFmM1Rvb1ZN?=
 =?utf-8?B?Vnl6Y25ZUmhXSG0vOEFIVnhTcG1CdDRmZUcxQTZ1c2VJOFpITU5NeHRuQUhU?=
 =?utf-8?B?ZFUvWXFRUDlzMmxLRmd2RWJGMmsxa1l3a2JJcktXc3BKZWZiTytMNHJzYml4?=
 =?utf-8?B?Yy94Vjc2azJLTi94SHovVHQ3ZWJZem9ibzVPV2VJSDZGQjBZUGZGd0JXQmFR?=
 =?utf-8?B?a1BKUnlVZDJsRzNUNGk3Ri9OaVFVK2tPelRtLy9ZOHdMY0FVdFdXY3VLeXFu?=
 =?utf-8?B?akRpdjBDQ0hjQlVzSUVDMk1NYUplMnBQaUxVelhDYXQ5NUF4SnNha3N6VVdu?=
 =?utf-8?B?RXUwMUJ4SVpOUWwreEtCenR1eUFpT2MvcGpRRnhPNUtGUDlrdlRPelJBVlVF?=
 =?utf-8?Q?1V0XxwPGzdr6DzdTlpnliv6w3UCV9BmorzoUddW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20749868-7408-4067-6eaa-08d9908faf15
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 10:28:24.4962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+bNRzsidxF6CFaRYnpN+sEOUyk3un3T3DJB3MCLU+PgQboYeXQNc1U0etpRcGPYU8wPc+3qUv8/VXDm3L/yuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5966
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 12:47:17PM -0700, Stefano Stabellini wrote:
> On Fri, 15 Oct 2021, Julien Grall wrote:
> > On 15/10/2021 18:33, Bertrand Marquis wrote:
> > > > On 15 Oct 2021, at 18:25, Julien Grall <julien@xen.org> wrote:
> > > > 
> > > > Hi Bertrand,
> > > > 
> > > > On 15/10/2021 17:51, Bertrand Marquis wrote:
> > > > > diff --git a/xen/drivers/passthrough/pci.c
> > > > > b/xen/drivers/passthrough/pci.c
> > > > > index 3aa8c3175f..35e0190796 100644
> > > > > --- a/xen/drivers/passthrough/pci.c
> > > > > +++ b/xen/drivers/passthrough/pci.c
> > > > > @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> > > > >       if ( !pdev->domain )
> > > > >       {
> > > > >           pdev->domain = hardware_domain;
> > > > > +#ifdef CONFIG_ARM
> > > > > +        /*
> > > > > +         * On ARM PCI devices discovery will be done by Dom0. Add vpci
> > > > > handler
> > > > > +         * when Dom0 inform XEN to add the PCI devices in XEN.
> > > > > +         */
> > > > > +        ret = vpci_add_handlers(pdev);
> > > > 
> > > > I don't seem to find the code to remove __init_hwdom in this series. Are
> > > > you intending to fix it separately?
> > > 
> > > Yes I think it is better to fix that in a new patch as it will require some
> > > discussion as it will impact the x86 code if I just remove the flag now.
> > For the future patch series, may I ask to keep track of outstanding issues in
> > the commit message (if you don't plan to address them before commiting) or
> > after --- (if they are meant to be addressed before commiting)?
> > 
> > In this case, the impact on Arm is this would result to an hypervisor crash if
> > called. If we drop __init_hwdom, the impact on x86 is Xen text will slightly
> > be bigger after the boot time.
> > 
> > AFAICT, the code is not reachable on Arm (?). Therefore, one could argue we
> > this can wait after the week-end as this is a latent bug. Yet, I am not really
> > comfortable to see knowningly buggy code merged.
> > 
> > Stefano, would you be willing to remove __init_hwdom while committing it? If
> > not, can you update the commit message and mention this patch doesn't work as
> > intended?
> 
> I prefer not to do a change like this on commit as it affects x86.
> 
> I added a note in the commit message about it. I also added Roger's ack
> that was given to the previous version. FYI this is the only outstanding
> TODO as far as I am aware (there are other pending patch series of
> course).
> 
> After reviewing the whole series again, checking it against all the
> reviewers comments, and making it go through gitlab-ci, I committed the
> series.

Hello,

Maybe I'm being pedantic, or there was some communication outside the
mailing list, but I think strictly speaking you are missing an Ack
from either Jan or Paul for the xen/drivers/passthrough/pci.c change.

IMHO seeing how that chunk moved from 3 different places in just one
afternoon also doesn't give me a lot of confidence. It's Arm only code
at the end, so it's not going to effect the existing x86 support and
I'm not specially worried, but I would like to avoid having to move it
again.

Regards, Roger.

