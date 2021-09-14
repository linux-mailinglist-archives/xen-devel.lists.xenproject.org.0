Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B10040AE0C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 14:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186576.335331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7kU-0002gS-D7; Tue, 14 Sep 2021 12:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186576.335331; Tue, 14 Sep 2021 12:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7kU-0002dx-9a; Tue, 14 Sep 2021 12:41:18 +0000
Received: by outflank-mailman (input) for mailman id 186576;
 Tue, 14 Sep 2021 12:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ7kT-0002dr-36
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 12:41:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6724807b-f095-49b9-8634-29d647b03a77;
 Tue, 14 Sep 2021 12:41:15 +0000 (UTC)
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
X-Inumbo-ID: 6724807b-f095-49b9-8634-29d647b03a77
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631623275;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SUrijeXNVLZ7C/wfJwbta0cDiWslSHEV8cFFg/6P7wI=;
  b=ZJv2Smd1IwQPuThOG/aqRkkKZhf4Mt9HruoTj0KeWceR5suTTWINQ4Rm
   piIM9nXlW2bzxUbo2vAfvnOm6Tlei3LMSDwfBuhh7moSRGSYRt6GKzywW
   1SZo1HbBAr4eDhKgTMOF3oLBB3+THPE+xBuSqTxth6Q3lBozdQtAmAr7G
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QTZxJnGufd4l0xrPjj0NRz41Wgfh6cBGcMdq2xC+ZU25WCKXrJNeW1Pxyh6IJPtkl4RBtDwU9F
 DT5bFgbBRvECF2RKOX989Ptm2pGfLQ9Fzewhp2Ox3x53Fp1COM8LepRFk5hd7EqwEgPNMbK/TN
 psgmWz/PCUwT4ME6u/afh4tBpZ/oJzNYQP7XAESOuR6iwx/umt46IGuv+zM1QhVTzX7Hj1A0PW
 giyRU6/S/W1K0OsaqaRkRMtKfFfiYR1KY9xX0nRkR6b88Y6ERPz/lnHH6vMqk2cYEFYmPlT7bg
 3klFld9A9om1RDN/WLho5+48
X-SBRS: 5.1
X-MesageID: 52661756
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GZ/FLqoWHKaT7yZjuo5a4P5nLOleBmKPYhIvgKrLsJaIsI4StFCzt
 garIBmPM6mCZjDxfthxPo7n/RgG7ZTcnYMwTQBkrSs0EigS8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncw0IHlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbKLVxlqOvCUobQAcytlS31BJ6sBqaCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0UQ6iHO
 JdHAdZpRE7RaiBsAkg4M79g2/2ulHavWiBjh03A8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt9nOqm/+Kni7hXo8WPKO3++Qsg1CJwGEXThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsTDFbb8c9nNQrXjFs3
 ViM9/vjAiZuq/uSUm6H8amPriKaPjIcJmsPIyQDSGM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6ighMgmfYX0JYyh7ibz22f3w22oN+YUVtgjunIZV5J/j+Vdab8OdfxtAmEsqgZRGqKZgLe5
 ylfwqBy+MhLVMvUxXLXGI3hCZn0v67tDdHKvbJ483DNHRyW8ni/dMh75DhkLS+F2e5VJGe0P
 Cc/Ve5XjaK/3UdGj4csOOpd6OxwlMAM8OgJsNiOMLKihbArKGe6ENlGPxL44owUuBFEfVsD1
 XKnnSCEVydy5UNPl2Heegvg+eVzmnBWKZ37HMimp/hY7VZuTCHMEupUWLd/Rss48LmFsG3oH
 yV3bpDRoyizpNbWO3GNmaZKdAhiBSFiWfje9pwGHsbec1EOMDxwVJfsLUYJJtUNc1J9zbyTo
 BlQmyZwlTLCuJEwAV7WMysyNOy2Bs8XQLBSFXVEAGtEEkMLOO6HxKwea4E2bf8g8ulixuRzV
 P4LZ4OLBfEnd9gN0211gUDVoNMweRK1qxiJOib5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzLxyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPtntdX1prJcwgB1J1nxbgymWuF6P32L/chTrakRlLVXjhS7B
 xCU8d5ANLTXZM68SAwNJBAoZ/io3O0PnmWA9uw8JUj36XMl/LeDVkkObRCAhDYEcelwOYIhh
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gd7mEtfZZH8CzPt5MDdYtpBBUAmP
 zuIifeQnL9b3EfDLyI+GHWlMTCxXnjSVMSmFGM/Gmk=
IronPort-HdrOrdr: A9a23:5Hwc6aB271b39C/lHejesseALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPEfP+UossHFJo6HlBEDyewKiyXcV2/heAV7GZmOGhILGFvAb0WKP+UyDJ8S6zJ8h6U
 4CSdk+NDSTNykAsS+S2mDReLtBsbq6GeKT9J3jJhxWPGZXgtRbnn5E43GgYytLrWd9dP8EPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+zg+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRiOerRfb8z/T9GA+czTpAV74RHYFqewpF+d1H3Wxa1O
 UkZS1QZ/ibpUmhJV1d6iGdpTUImAxemkMKj2XowUfLkIjBXzQ9BNNGhYVFNjXky2dIhqAg7I
 t7m1uDsZxZFBXBmzm4wePpeVVFqmqYyEBSy9L6qRRkINQjgXtq3NAiFQpuYec9NTO/54Y9HO
 Z0CsbAoP5QbFOBdnjc+nJi2dq2Qx0Ib1q7q2U5y4eoOgJt7TpEJoojtbsit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJaQupUBvaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CEVF9Dr2Y9d0/nFMXL1pxW9RLGRnm7QF3Wu41jzok8vqe5SKvgMCWFRlxrm8y8o+8HCsmeQP
 q3MII+OY6qEYIvI/cB4+TaYegnFZAzarxmhj8LYSP5niuQEPyYigXySoenGIbQ
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52661756"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuztZ2yH4zUyAlzu1dNi2duolQlh4BUaatOU9bN6YYBcVUFhuguKN/quekcL+ASke0GN8LxLG3qYdOVmARMstGfAERTAxC5RtasTK+uz8A/6lYLAKats6fVCzO8VmAC62zeqbMWA3xoRsCd6U/xf4vHp0AHGUqLUUyB1L6nTHEyhAIcBifQnwtddAY08MvYcnETXQSj2/qPIv5lZH3jY8piG1jyVHRtPAjupLBrJVf1RvMcciPTQEn6TWpJe0L5lv2niJCmeYwYwPt+wtyRvSKDF5SC6T0wRbX6WIVgiRFZ9S/9IoXB7AdbZ1nA/e0qBf6c+MxYUBNxyp6pdvODeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nmoya7Wy3/dlPb46qHqs9Pc/h7Q4JGS/lDNSIMdu+4o=;
 b=EYtE/PyPNi4PWDX7UgwMePtzJyealh66xG21V/8teMH6x8h7xzIGSfgvbbe9S9nwHckGvKbV70do5J0iaJxgzQLpIegQbVveAx1dpwKP/LWoe/30PHdMB646Lg+H8Va+gNjTr5Qc0wwSFZOscDJ9ml7fYStgks9z7K51YoNl4hMA5gWwtEN4uzH5jiCCAiWgL8on+s69+AdvsEtiWcAO9sWLuTTTmkXjsoXU+TZ+qxyIRfaMta84BADMxF243skAx8XRw5aLRIZaTiwKfvelwUl0mlmdjbwJk8PcYpPqd5rnQH8gjXvQNBHrbasDBxPkHxQhqGdcNIDjbxvjjrkrKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmoya7Wy3/dlPb46qHqs9Pc/h7Q4JGS/lDNSIMdu+4o=;
 b=Cl1LhmoKMRsT9um/OY0/AUTnv3c6JLfcRw1G9Z04+69GDqxS06YhriREr1Gy84AxutA+9+Ay3H5VRU1Nbmt1HAXds7Q+x6XFBovyqc29QYl7olJycPqSwSTcwCK6SzV+46wogFm6cxtQpzHXVZktp6zOSskIL3ZXYdI052yi4s8=
Date: Tue, 14 Sep 2021 14:41:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
Message-ID: <YUCYYmqQMR5NCTyz@MacBook-Air-de-Roger.local>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <YUBeJLvWXukyGSFf@MacBook-Air-de-Roger.local>
 <050f71c8-227f-4f78-1ec5-394ba9fba9c1@suse.com>
 <YUCEQFpdc+3kUqQj@MacBook-Air-de-Roger.local>
 <40ea4ec8-483b-9191-a233-f2916f22c131@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40ea4ec8-483b-9191-a233-f2916f22c131@suse.com>
X-ClientProxiedBy: LO2P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b221a01-64f5-40ff-dec7-08d9777ceee4
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-Microsoft-Antispam-PRVS: <DM4PR03MB60008D71C1A46F423871DE398FDA9@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ryzELLkwsBhjXq6/R5rMlgU5BHm+AlbdfzcyBiHz5DvG2ev35vLTpxy9o1QfKpNpwrCiH9BTMb97SMbJ7bGdJVlX+M9kksDMp2uBy0LYnD4bjO+XDSfhbTN9UNUFShBu3V9zsrnVvao8R+/vELO/uqZ57zddxRTAbvtiXEU1zQui6BhgjqFg1JayprBlzrhfu2nE3AJBm7vZ2dncI8eu9n9htz+NOf/g/vDwOOwpXpKLQzjnKEtT5R5j5jZ8Cce0kF7qJniVWq7IjroM3iRO9DEg3eXO4XzgO662B8vrX6fyJ6QmU57W7EHdf0b5c7Wqsm0Oe87aVdQlvTf4IYm1bOd2ozGwQT33Tb1+5D6/DHejpW7PI5bemROZ5xKsFRQORz94AKGc5jfxGvPdMmkeyLza1xx/xtcNOJ1M/GP16++vNH5Ss2Aibf5w9c2K/Jo4zAfbzGGV/ZpfKYKlCznvRCwuex0wLhku2IQGTHo17NlrXYCBa8J4DpsE8GlyNePP9oddDUJj1L2wjtc/FziOGoM6iuATd/7cOIfOCcGe1gCqYg38P7qlcwwpDLfw8Vxwu5e/zw215F6o8iiGQZO79Fn9rjVua0p10kKVvaeM6fJkck3iWUFeEDbBFEK8Zm0iS3IN7LQTWgtG4fKdMwbmM3FFTozQstPC5LzWqcWTr6591vO05xy8jZUV9iIWyjoVNKg+lC77rZCkOMk0l9UvmUgOEEUi1HbBkqXOXP80tBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(85182001)(6496006)(6666004)(5660300002)(45080400002)(478600001)(6486002)(86362001)(9686003)(38100700002)(26005)(66946007)(966005)(6916009)(4326008)(2906002)(53546011)(186003)(8676002)(54906003)(66556008)(66476007)(8936002)(83380400001)(956004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b092cTdDR2pGR2NsbHpnMk5IdjR4RVRGUk1rdFhvSnNvSXJpQ0NBMzBrdE9u?=
 =?utf-8?B?Qk1naE9yUmF3UEdFN3QvdTlMMWNGTnRiVm5hTFBnNWl4UUM2SkV5UmNVcXZZ?=
 =?utf-8?B?OWg2dFd0V1VNbkZxRnhCcE9pK0tPeUF6ajBVY0FiRGczeE9vVnVrOG5GQVZr?=
 =?utf-8?B?aSsxVEJUYVVMY1FxUEdIeWZ4Vk5UZkxHTFFrbG84aFlSWkJEVzhCVFpjUUMy?=
 =?utf-8?B?Sm8vZDlSeER1WWwvZGE5MjVCUkowYTc3eVZ5RHVQbEF1aTNTd1ZQOWF4MWZz?=
 =?utf-8?B?eWdSeDYzQU9xcVlKSHM2NGhmZ1RRVDF5eGM2c2lidUloaHJ3cXYzRjFySHJX?=
 =?utf-8?B?bzNWejBmdHBLMWk4eFVDY1k2TFc2R3Y4Z2pCU2piZVd1NXlmRlpFaEtXNVkw?=
 =?utf-8?B?bndtazN3eStwVzdRZlE5U2RXRVh0R05wbkhKaHNHekd1Ym1rbnBpMGNSb294?=
 =?utf-8?B?RGxGOHFVMlp3WDZ4RnNIbUdaSXJHcjZwR1B1RWtPYkpLR0FWSUh2YUYxKzky?=
 =?utf-8?B?clVsWFBZQWUwQWMrSU9tRUNtYkFlWEpLZE0xakpJbmFibzRFS2pNNFMwQXlU?=
 =?utf-8?B?RCtOVHVLc1haSGhXL2NMdHpsbWxURXZ3aUdJQlNzMk1Ua0lDak9EUVNZZ0dt?=
 =?utf-8?B?S3h3eVpQSkFTNS9NcUF0WmprcFUyVk9vdTRhcXlXMTVkRXEySk9UbHBjT2VK?=
 =?utf-8?B?djBaVXJxa0MzbllBNjR2NGUwd2pLVWRsVDladWZOSFNDK3FpbXFSckhMQnRW?=
 =?utf-8?B?bGl0OFRMUW9FdmZ3elZZQzlQY1hqMjR0cVBOOVJFZGpGWm5zZFZlc2I3UXhy?=
 =?utf-8?B?V0k4Ui8xT0hwOGN0a1VtL29SVC93U0o4YUhDRmpiZTM5NHZYNFFIRVpsb2ZT?=
 =?utf-8?B?bGY2RmYzMlFxRFpWUjFTU3FEdWsvKzdIZDhhZkM2Rk9xZ1A0NlBKZG1FTGo3?=
 =?utf-8?B?OGg1NG1hZitLMFExWkxkTVRZbjFnekJEazRRK01WbElnYndjZkovaSs5YXZF?=
 =?utf-8?B?L08wY2NabTZEV1U0Z0ZzcS9CZmgyYm9teEcvVHlIaHVaL0pVVDVqS0VGelRT?=
 =?utf-8?B?YWVLaHZuWGRVWEtlSGh5WWtPWHdmSURPYlRJM3BuNVlIWnRwRlR6S21DQmI5?=
 =?utf-8?B?TG9XdW1tYXhLWVpibTVRVDhYMStJMFNhaGtMNkRDVHVKZm9ha1RMVmhMT1po?=
 =?utf-8?B?MGxUbEwzelNwelNCN3VwMVFwbzUxa3luUGw5cy82RE5CbnVidS9HUTVYNWRq?=
 =?utf-8?B?UmkwYnpzenkzYUVFbjJwdmM5UTIyejdhTnhUaXNqRU5RWlVFSklnTTRVZmVu?=
 =?utf-8?B?NUFraTRMenBoMFRjSUlJN296anRoL0w2WnhMSDF6NFFTV3E3K3M4K3hiY0I1?=
 =?utf-8?B?Tm9PYmg1aExFOGx1WW5Xc0UxbXM1Q08xUFZhbzV2TE92MXMwSGxGdkM5Z1pV?=
 =?utf-8?B?Unc5YlV0VW5GYXF4VGpqWnhuem4vS0RGWlFOeGwreGhkNmhmNWhCREVLMk1Y?=
 =?utf-8?B?bWdNemMzZjV4Z1pOVVZvaGlkcmkrN1ZoNm9meE5qMzlrbkU2N3lGUlJEbURi?=
 =?utf-8?B?Vk1wZnRoMjFJK0ZIc1hhZ1gwL1JlYUN6RFVVVm5rRURqQit3SjZwbjBpT0dP?=
 =?utf-8?B?NzRTKys1R1BMaVRHek5pZDNubnowV05sdzRaVksza0dBaFlmSFBBUC9ZOGF0?=
 =?utf-8?B?eGYxczlkVWZKZ1B5MzcvVTdZMExRQzgzWitjcUIrdmxVTWpxdmluajJXdVps?=
 =?utf-8?Q?haksXOl4/itSnkwJ4cvGvJvE1DeQ3bnD2N8pstf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b221a01-64f5-40ff-dec7-08d9777ceee4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:41:11.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODiZFPEydN3nmF4EwQ47Fn1ncR5FksUQH+HBV4LMgU+ySQcp9jji66WUdF8QAZQbS9J9G62bV982uAYhT2NaTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

On Tue, Sep 14, 2021 at 01:58:29PM +0200, Jan Beulich wrote:
> On 14.09.2021 13:15, Roger Pau Monné wrote:
> > On Tue, Sep 14, 2021 at 11:03:23AM +0200, Jan Beulich wrote:
> >> On 14.09.2021 10:32, Roger Pau Monné wrote:
> >>> On Tue, Sep 07, 2021 at 12:04:34PM +0200, Jan Beulich wrote:
> >>>> In order to try to debug hypervisor side breakage from XSA-378 I found
> >>>> myself urged to finally give PVH Dom0 a try. Sadly things didn't work
> >>>> quite as expected. In the course of investigating these issues I actually
> >>>> spotted one piece of PV Dom0 breakage as well, a fix for which is also
> >>>> included here.
> >>>>
> >>>> There are two immediate remaining issues (also mentioned in affected
> >>>> patches):
> >>>>
> >>>> 1) It is not clear to me how PCI device reporting is to work. PV Dom0
> >>>>    reports devices as they're discovered, including ones the hypervisor
> >>>>    may not have been able to discover itself (ones on segments other
> >>>>    than 0 or hotplugged ones). The respective hypercall, however, is
> >>>>    inaccessible to PVH Dom0. Depending on the answer to this, either
> >>>>    the hypervisor will need changing (to permit the call) or patch 2
> >>>>    here will need further refinement.
> >>>
> >>> I would rather prefer if we could limit the hypercall usage to only
> >>> report hotplugged segments to Xen. Then Xen would have to scan the
> >>> segment when reported and add any devices found.
> >>>
> >>> Such hypercall must be used before dom0 tries to access any device, as
> >>> otherwise the BARs won't be mapped in the second stage translation and
> >>> the traps for the MCFG area won't be setup either.
> >>
> >> This might work if hotplugging would only ever be of segments, and not
> >> of individual devices. Yet the latter is, I think, a common case (as
> >> far as hotplugging itself is "common").
> > 
> > Right, I agree to use hypercalls to report either hotplugged segments
> > or devices. However I would like to avoid mandating usage of the
> > hypercall for non-hotplug stuff, as then OSes not having hotplug
> > support don't really need to care about making use of those
> > hypercalls.
> > 
> >> Also don't forget about SR-IOV VFs - they would typically not be there
> >> when booting. They would materialize when the PF driver initializes
> >> the device. This is, I think, something that can be dealt with by
> >> intercepting writes to the SR-IOV capability.
> > 
> > My plan was to indeed trap SR-IOV capability accesses, see:
> > 
> > https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fxen-devel%2F20180717094830.54806-1-roger.pau%40citrix.com%2F&amp;data=04%7C01%7Croger.pau%40citrix.com%7C35d2502d0128484e229e08d97777087f%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637672175399546062%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=sSeE%2F4wEo5%2Fplkj2yH%2B1kpHi5c15lxJxeUxx6Cbyr4s%3D&amp;reserved=0
> > 
> > I just don't have time ATM to continue this work.
> > 
> >> But I wonder whether
> >> there might be other cases where devices become "visible" only while
> >> the Dom0 kernel is already running.
> > 
> > I would consider those kind of hotplug devices, and hence would
> > require the use of the hypercall in order to notify Xen about them.
> 
> So what does this mean for the one patch? Should drivers/xen/pci.c
> then be built for PVH (and then have logic added to filter boot
> time device discovery), or should I restrict this to be PV-only (and
> PVH would get some completely different logic added later)?

I think we can reuse the same hypercalls for PVH, and maybe the same
code in Linux. For PVH we just need to be careful to make the
hypercalls before attempting to access the BARs (or the PCI
configuration space for the device) since there won't be any traps
setup, and BARs won't be mapped on the p2m.

It might be easier for Linux to just report every device it finds to
Xen, like it's currently done for PV dom0, instead of filtering on
whether the device has been hotplugged.

> >>>> 2) Dom0, unlike in the PV case, cannot access the screen (to use as a
> >>>>    console) when in a non-default mode (i.e. not 80x25 text), as the
> >>>>    necessary information (in particular about VESA-bases LFB modes) is
> >>>>    not communicated. On the hypervisor side this looks like deliberate
> >>>>    behavior, but it is unclear to me what the intentions were towards
> >>>>    an alternative model. (X may be able to access the screen depending
> >>>>    on whether it has a suitable driver besides the presently unusable
> >>>>    /dev/fb<N> based one.)
> >>>
> >>> I had to admit most of my boxes are headless servers, albeit I have
> >>> one NUC I can use to test gfx stuff, so I don't really use gfx output
> >>> with Xen.
> >>>
> >>> As I understand such information is fetched from the BIOS and passed
> >>> into Xen, which should then hand it over to the dom0 kernel?
> >>
> >> That's how PV Dom0 learns of the information, yes. See
> >> fill_console_start_info(). (I'm in the process of eliminating the
> >> need for some of the "fetch from BIOS" in Xen right now, but that's
> >> not going to get us as far as being able to delete that code, no
> >> matter how much in particular Andrew would like that to happen.)
> >>
> >>> I guess the only way for Linux dom0 kernel to fetch that information
> >>> would be to emulate the BIOS or drop into realmode and issue the BIOS
> >>> calls?
> >>
> >> Native Linux gets this information passed from the boot loader, I think
> >> (except in the EFI case, as per below).
> >>
> >>> Is that an issue on UEFI also, or there dom0 can fetch the framebuffer
> >>> info using the PV EFI interface?
> >>
> >> There it's EFI boot services functions which can be invoked before
> >> leaving boot services (in the native case). Aiui the PVH entry point
> >> lives logically past any EFI boot services interaction, and hence
> >> using them is not an option (if there was EFI firmware present in Dom0
> >> in the first place, which I consider difficult all by itself - this
> >> can't be the physical system's firmware, but I also don't see where
> >> virtual firmware would be taken from).
> >>
> >> There is no PV EFI interface to obtain video information. With the
> >> needed information getting passed via start_info, PV has no need for
> >> such, and I would be hesitant to add a fundamentally redundant
> >> interface for PVH. The more that the information needed isn't EFI-
> >> specific at all.
> > 
> > I think our only option is to expand the HVM start info information to
> > convey that data from Xen into dom0.
> 
> PHV doesn't use the ordinary start_info, does it?

No, it's HVM start info as described in:

xen/include/public/arch-x86/hvm/start_info.h

We have already extended it once to add a memory map, we could extend
it another time to add the video information.

Roger.

