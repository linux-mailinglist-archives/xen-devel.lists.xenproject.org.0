Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD74B4CAF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 11:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271415.465843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZ1A-0003tc-UF; Mon, 14 Feb 2022 10:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271415.465843; Mon, 14 Feb 2022 10:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZ1A-0003rQ-PA; Mon, 14 Feb 2022 10:55:40 +0000
Received: by outflank-mailman (input) for mailman id 271415;
 Mon, 14 Feb 2022 10:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jzps=S5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJZ19-0003rI-4y
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 10:55:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3589f9f-8d84-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 11:55:37 +0100 (CET)
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
X-Inumbo-ID: a3589f9f-8d84-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644836137;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=19S5wilP4hRGRchAvWwmZI1zlqFT0NvTbPr5WRsxhcE=;
  b=ic2YzDU6YNBfLhGDBWGmXoz7OHI0iQ0bf4ZFedafhisfU9O2jtP6oF/C
   7THF41VTFrRayZ72ajPUQllQ1LzF6NzYQsCSEOEFit4IRdUKc5FP0vFVT
   Q1yTHR72BgTvICZe+IWl+ZitwTTu29i/GKy1BtmJknyrMxttULN08GEyu
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aBqiKJzNAxDE7hAWtU7KuQyEtGLS3Gx2JpxUJaIFV+bfTcxvvqhGwfw9MufeBvlOwiRuWDUIDI
 Yfty8asJvYHGb03I64dfKAMINCUtgwHnR6eJkwPygWVWIP+jYTUQzC3x34U1m5ed2ODOiPbhLT
 2kwcX92zfXgVGcT0ru6iIKGxyBYFqQLOMuGV5bweu0P0hcuf3R//pn+jVmYASZykRdPlMm7Ard
 WnknG++x1t3mTaL2Rx+8aGqXWnyUpWfSa16thG8RD/UN/dxcglHFnCybov659N1r+Y16tCXCFg
 U0sjzy++C+7ykOAVRfXEBu2y
X-SBRS: 5.1
X-MesageID: 64142337
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/XvonaP2eAA8iU3vrR2fkMFynXyQoLVcMsEvi/4bfWQNrUon3jIAn
 2oZCmrVa/mCajajf4skYYqy9k4PuZXTnYNiTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2q1vsloy
 uhKjJHqZS0VF4/dmN4FChYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uWvIMCh2xv7ixINfLaY
 tdeTCFKV0rnbkNmJ0sSMIA6v/j90xETdBUH8QnI9MLb+VP73AF3lbTgLtfRUtiLXtlO2FaVo
 Hrc+Gb0CQ1cM8aQoRKH+H+xgu7EnQvgRZkfUra/85ZXbEa7nzJJTkdMDB3i/Kf/2hXWt89jx
 1I8pRYPtLEwyUuSQ4PRdSGRgm+EhAZFVI8FewEl0z2lxq3R6gefI2ELSD9dddAr3PMLqSwWO
 kyhxI2wW2E22FGBYTfEr+rP82vuUcQABTJaPUc5oR05D84PSW3ZpjbGVZ5dHaG8lbUZ8hmgk
 mnR/EDSa1j+5PPnNplXH3ia2VpARbCTF2bZAzk7uUr/sGtEiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUHrlRQ+H5uqvdaWaG6bKKI3XG327zk0NPgKgKuG0uTKuXGppslcDVj
 L/75loKuc470IqCZq5reYOhY/nGPoC7fekJosv8N4IUCrAoLVfv1Hg3OSa4gjC8+GBxwPpXE
 crKLq6R4YMyVP0PIMyeHLxGj9fGB0kWmAvueHwM50r7j+TOPiPJIVrHWXPXBt0EAGq/iFy92
 /5UNteQygUZV+v7YyLN9pUUI0xMJn8+ba0aYeQOHgJaCgY5SmwnFdHLxrYtJ95sk6hPz7+a9
 XChQE5IjlH4gCSfewmNb3libpLpXIp+8i1nbXB9Yw7w1ihxe5ur4Ycea4AzIest+tt8wKMmV
 PICYciBXKhCE2yV5zQHYJDhh4V+bxD31xmWNi+obWFnLZ5tTgDE4PH+eQ7r+HVcBya7r5Jm8
 bahyhnaUdwIQAE7VJTab/emzlWQu3kBmb0tAxuUc4cLIEi1qdpkMS38iPMzMvogExSby2vIz
 RuSDDcZufLJ/90//u7WiP3WtIyuCeZ/QBZXRjGJ8basOCDG1WO/2oscAv2QdDXQWW6oqqWvY
 eJZk6P1PPEdxQsYtoN9F/BgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU6VmsR
 0aC2thGIrHYasrqHWkYKBchcuneh+ofnSPf7KhtLUj3jMOtEGFrjamG08GwtRFg
IronPort-HdrOrdr: A9a23:+lxyvaGA/Ym5KijvpLqEyMeALOsnbusQ8zAXPiFKOHpom6Oj+f
 xG8M576fawskdyZJhCo6HmBEDjewK+yXcd2+B4Vt3PMzUO+lHYSb2KhrGSpwEIbheOjNK1op
 0QCJSWZueRMXFKye7/6Ba5CZIFxtSG/6CliI7lokuFNTsaE52IuD0JczqmLg==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64142337"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGTogouJcxImVNM9nlc4oAMmLDB0u/doRV+SyEXEwG8iktsKGDlWm1qs9rObbyPxDubDPOChFhdfb0xWmtXZTnr88+C3BnOS/buaJDMESuHC0pQ563/46iOAEighCAfGBhOiBsAvm9o/KCBIuOLl5DnbNqoDeonHyKXETYhPeCXTA/1mM2mwWu0D3Vc3J+soW3Yqp6In9yyS5/2Vo3lAGPZhPCh3hcYkpDwrYK4UGnQN/fysoi7XI+NyFe7coeQce3wf6MNcGWIl/3FS0IfnVa8fShBYadexZlS5NN2p96mgab5AfTt4M1MczpvgCCyHnH8HbxY1dD3yMI0ELN1yAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0MpsQB+2Ex1eUukD0jz2QOTmkFaZjvrGXMIzk8d//s=;
 b=fGyEImkPuTwTtTCZzpYpApZmFwhLghggmfbM9B4L9bEM5d3y7/OFFXCFhTefaEyMvCT/TFsoG05AlvW2eStzQ+aPbbJekEuxZ8S4KS1EUdlvobh13FbiQtuDeip6vQSkVuHFVSPtrsF4MVbO8jEPcfgzasdBuMn3Vt4fXPvk1a9FyUO6iqBOP/yMZdRq5RTrAFnkg008IyjQkeDSly1SXtUlFiy7OfgXYjQdkEiwVjEQQ1qzcR0SFLiHlt2hiGZDyE7l3svLbGgcY7rTinqgi/pLrRGySaApvUf0mcp23G7O9YgcIXNhhfH7o8yTDMZp0XUbkoLh5TQzXcPcx9EWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0MpsQB+2Ex1eUukD0jz2QOTmkFaZjvrGXMIzk8d//s=;
 b=CNZt7aC5qQVDBPg9c5Qnc8JRmKkK/lOIYailvthEF6qKCUZro19V0AnnxQBATHZswf+59UqO5QqGOZYBy+9xxtc3wzYa3FLu/EU6QFjH5LY93yGkg7Medb4qbXNaT3k42GlDLtLC4zCMnSctCZZsDc4q6tdOoCDt/S4/2PoKmzo=
Date: Mon, 14 Feb 2022 11:55:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: tools backports
Message-ID: <Ygo1Hh8RoZfmPOjo@Air-de-Roger>
References: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 072d5c70-1ecc-4ea5-d45a-08d9efa884f2
X-MS-TrafficTypeDiagnostic: DM6PR03MB3705:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB3705CA8BAE2501A85B1D37378F339@DM6PR03MB3705.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xE7mIluCOIXrnp2EjDPwR+mVqqPYHfXX1XxWN3pyRxh8cR41hTwDZblIdR8CCAenxsWvhgG3mWWwqWUl34DYnzoA9Pgnf1crhilxfPwcG5EiAhfLc4ktTI6vQE8uOSjxMkqBg0qrAmCIQJ1RzNVHYPlsE+i4HiJ+qrffjTDSXM/8G6arH/eh8lg/vLiH4j0ahfsnZvKv0lAZpkAHEUsv4m2vQlNt+KJs4ebkHHozfGrEimYsGolUy0EJRvmLnAP5l55Ehflz4e9LV+JaFs66FClXxWCofahB47Yk0xbH1zfmAqmQHd0h/u4TUxnAOuQjRZnriXY3ucUTv3NtiMCpP3fbZr6Dq37VzbsQKfpwcb4cv17LuxiQc3zJTpM3fagHAZd9jaNx6adb5i9trsjimjOQXB5KbeyW/CLUDuQ5N+l6jrz32mif5L8PeV8aRz+DinkPSl7xU6/7udRaECjYpR79PCYvx5m+ZHVIRG7R3h8e3EskV3hn6ddRizhZM7jB7JPco8GwUCFA1DaNehylq4gqV7NqlPZFRnVBX6KPuyw+9KgB5/lvFIgX7sRxIggfD45IF/zHZQIX7OTI7/VvdQnWVsgmFcdOUvEuSiJzDsYdzH7DUJRhBm6DhpvjJXFiUhAthIMx0DLtDAyVs7NAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(7116003)(6916009)(82960400001)(9686003)(316002)(86362001)(66946007)(66476007)(8676002)(4326008)(66556008)(26005)(6506007)(54906003)(186003)(6512007)(8936002)(38100700002)(33716001)(6486002)(508600001)(83380400001)(3480700007)(2906002)(85182001)(5660300002)(6666004)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmN3a2Q4NS9tWGtGN2p6R2gxRlVEMUxyZy9NYVdPZi96M0pMWDBFVm1obGps?=
 =?utf-8?B?UWw2ZmtWSE9EUUNqWmI3QnNFaVhRamJFdUl4SjFENU9oSUgyOFVZM0xxVkFW?=
 =?utf-8?B?Tk9RMFcvNXgxekdzamhZODZCREg2RWJ0dVBUd0h6aE1jcXArS1RDdEJwRkt3?=
 =?utf-8?B?L2dIQ04vRWN3TFlvWVpzaGlJRjZ2SC9tSWdYYi9lWjBERUVxNHRQYnJjME1a?=
 =?utf-8?B?WUJObUE4S3NMakVFVkxqdHdCUGloQXdUNTFSdVo3SzlGVS8xZ1lZSjZDb01v?=
 =?utf-8?B?bHJGTjhSQVNVM05KSWUzNXdBaDc1dUYrM0l6VDJjRU1CR2RZK1pUQ1dXaXNZ?=
 =?utf-8?B?TTBzVDllNWlwc09mbEtYZWh2YmpJUC9HKzZ3NGdWUkd5VXJnN1c4emsrenAy?=
 =?utf-8?B?SS82QXhweEdVajJaNTR5MDlpRVgvek9iNWVWcWMwakd2TXNmNCtmaTZMTEdS?=
 =?utf-8?B?Q3dadzlxL2xyU0hxOVVXR2hJYkpGaTlWK0dhc2oyL1VBeDJtZlNSWUdJVCt2?=
 =?utf-8?B?MGNTZit2eEJkdExrL3ZYTkN0UEYySUhEMlRhZ1BhS3ZOMW45TnBEUjhMbGls?=
 =?utf-8?B?WmJ1Njh3M3JLcHA1Rk1CdTZHVTFtK04wU1F5c1JrRkdtUUxUWXR0TUVNNHVE?=
 =?utf-8?B?ZjlBRGwvbjVvTlFVc3ZQV2pGNG5LN1lxVzVIMjBpOWEyUFJjUjRkNHBZKytl?=
 =?utf-8?B?SGhWUnc2NDVxclZUQk5Vakw5Tm9xS1U1UVFTMXhGeVlSY1MrU2p3Q3NIbDFK?=
 =?utf-8?B?cGk5N2xxbzJNNkhNajBIcCtmQitKWXpaNkVKNC9BaDlTcWMvc0xHZjh4Wmxv?=
 =?utf-8?B?blpqS2RDUld5QzZQQ2RkUmZQSGgzYitOY0FiT3AzQ3JuRXRBL3ZmVmFlamFH?=
 =?utf-8?B?VTFWRW1NODJkd1NhQmVTcTFLb1dWcFZZd01TOC9Vb2Q0OFpVb3d3R3c5N3Vo?=
 =?utf-8?B?MU10Y0VMYVpBaG1qd3RYSm5QVzU5NCs0UFRwNzhhaE5qN0RPNDNueXlkYVgw?=
 =?utf-8?B?ajQvdVl1eTgyQWU5cG5IdkdydThwbm5IeVZYTG5QanhsN05MQTQ3M3g4cjZ5?=
 =?utf-8?B?L3BTK2FDRG5FRGdzV3VSMVhXV3J0WFYwTmNtS3RNRFRWK2NzRDd2T3U0UzE0?=
 =?utf-8?B?cURadytQbTNVdWZkaTV0UHRPcGhnOCt3S3VWcWF3N09IQ3VsVDVZMjNqNmp2?=
 =?utf-8?B?dG5SVWJsWnhGQ2huOUVSdnR2TnY2d2NpZENlUUZ6NGQvMlE0ZFAyeHk3SzdD?=
 =?utf-8?B?TXpaMklJdEk1SzVuS3FIV3hiYm9WQ0d5bFZCbHlrODV5QUkrVm9WTlNyNkxj?=
 =?utf-8?B?Sm05bmZ5SFVodHRLeWpVRnNrS2ZoTy9PMitkc0w2ZFJPWXJzOHJ0eWtscEFE?=
 =?utf-8?B?R0xCT0x1SWRwbzJibFZSUHFzQUJBSzd1QktIY3EweHpkZDhVbVVzdDdMdE9Q?=
 =?utf-8?B?dkJPNjhNaDk2NlI0RGJCUnZGTVRPODZ3T3NkSi8wTFVTczJFM2lXOVdtWVJX?=
 =?utf-8?B?RFZJSlBxZ2JQaFd4OFhURFBOUzNDNlpHRGJPejIwZ2hwU0ZPb1lLNFE2eklH?=
 =?utf-8?B?UzJvMDNmaktuQmM5QndkU2ZUK3VORWNFSUtNWVByc2xqWnhQUjQrbzI2SjVH?=
 =?utf-8?B?NC9JMU9MSjVHMXd5dTdpVnUxdHFEL2JMakxIMHpOWGhaSTZkMFZpU1pPYmsv?=
 =?utf-8?B?SUZyOFlvNFVVNE9CZjJ2ZGg3SW13L3o5UFRKdUhFOWwvOGxqZndld1d0NFVn?=
 =?utf-8?B?Ym41VGdjK1VhMTVzNXpieXAvMFRVcVBVdWVQajhEUTJabk5ZSG5XTjVuV1FC?=
 =?utf-8?B?RytMa3FTMEE1VlZ2WjlERlYxOWd0UU9Bc2JVMTRHbmo5NUgvREdtbWJIa0k4?=
 =?utf-8?B?WU55NktSTElESUNoaU85cVJwSFFrb1JNUmY0ZHJyamdJZkIvUjdEN25rWFFq?=
 =?utf-8?B?QmlBRjRtMWVaaW44Qld1OEtNczBKYWZKUDI4ZStJZEVXWkl6VTMwdlBRZlJ1?=
 =?utf-8?B?VVBwZU16U0RWcTFReGt2SkpSSFI4QzliejNOYXg2aVUyYktaTGIvQUljQzZQ?=
 =?utf-8?B?SHg0QTlFSDVWSUplK2c2R1h4R1hHY0dCNWtyazV5QjJybGVGNERGVzlwaWQx?=
 =?utf-8?B?OEpDUlM0MnVtYXNqMzNkTVZheXVQUmg0M1BsL0xOYTN2YkRScXVnZ3BUaDlo?=
 =?utf-8?Q?uYDo9DfTarXYp7mXsl/o/lo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 072d5c70-1ecc-4ea5-d45a-08d9efa884f2
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 10:55:31.5092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ox7CkxJQSDgzfqrEYFJ/24DC1WiF0HKjGutBiRwK8eRxz85hE/cYx6/G1TJi+ETR/WkAF1yVG+xlgsDosK4+Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3705
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 11:18:44AM +0100, Jan Beulich wrote:
> Anthony,
> 
> I have a couple of simple tool stack backports queued, which - with your
> agreement - I would want to put onto the stable tree whenever I get
> around to applying the next batch of backports:
> 
> d9d3496e817a tools/libs/light: don't touch nr_vcpus_out if listing vcpus and returning NULL
> e62cc29f9b6c tools/libs: Fix build dependencies

I would also like to request:

0bdc43c8de libxl: force netback to wait for hotplug execution before connecting

Thanks, Roger.

