Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178704CBB9F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283080.481970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiwC-00015W-0D; Thu, 03 Mar 2022 10:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283080.481970; Thu, 03 Mar 2022 10:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiwB-00013c-TA; Thu, 03 Mar 2022 10:43:59 +0000
Received: by outflank-mailman (input) for mailman id 283080;
 Thu, 03 Mar 2022 10:43:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1S=TO=citrix.com=prvs=05474af58=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPiwA-0000UD-BH
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:43:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d308c918-9ade-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:43:57 +0100 (CET)
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
X-Inumbo-ID: d308c918-9ade-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646304236;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LA/++7o8fP9kUZr0VkOJ744dr9ThRKsw46rD6JONXoE=;
  b=RUE1auUqWCytuUSCjFDPgRwIY3rgKuS/dCPhxOjXSl/R/8OpLDChS8Q0
   BJCYSK5lXRnhDkmhpSIuNI0cF/sYfbjWXMtZ5iG/CyJ97uJcSqkzrCk/l
   8TFPK2YnNfd6HtaOorOk+3wfZm+8g5sM65dWksv217q+D3nsffNpSOTGp
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65299608
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g73L2a3p8j1Ea35AyvbD5dhxkn2cJEfYwER7XKvMYLTBsI5bpzRRx
 2FJDWiFMviKYWTyct4iadni8k9QsZfRxtZkQFZvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw2oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0VjrrvTg0WOpfN28FECD0HKiJvGYd/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u25ofTKiGN
 6L1bxJQZhnkQwJzKmwRGZElkM72mCLhYQBH/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfngSP6Q8QTD/uxrvpxh1u7yWkaCRlQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTXgm1jbuRQjX+BRUMhjsyXS86nFxyygUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb00qXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj/9hu+aTNT8D2BN1bQ9xawaRGp+ZgPc1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyD5Id4MsWoheR4B3iM4ldnBO
 hW7VeR5vsI7AZdXRfUvP9LZ5zoCl8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bJPbm00CC7SlOkE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVACe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:7qHh9q+Y8zXBUet8P3duk+E8db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICO4qTMuftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOd+EYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhVQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA9ciYnV9MPOA4/e7rDNoXse2OEDIvAGyWuKEk4U0i936Ifpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65299608"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uv0FF1bQ+r5wSa6hRtqO/wySPA6/aGvFPAItTrM1ORVYv47fz6uETFzmGd9dSgxvsApcCoiU8BMbTNqrVcNEOahMOpbvNXeRFWbF6DcjPee1Kgp80l6vRYe8mm1wDLTYeaRRUps0Zd4ba0TcthR7nPIJEtQ6IAHngi5CuIt+5VKSx1N7mF8CmJWL58LvrJpXhlgKqGnmiRT5638++ewLXXdTy/WafiGw5HeozVWb5AutU1xIaKckaql2vc1Z3hKQV4nK2+ETMUi8+Wo9BBV1up0r/A55RJ11airOzJ8SKltGo30TpSs/Zl98ySR2xFSSTvEIoibQa617UP1cVq+2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqWAYvfvGDjJAHRQH+uBn2KdGRf0bs5xU5VaKskiyI4=;
 b=Lbea8xShwn3Jo1lzi13vlPNe2XYMOXA/BJv3FrgoyOMkziFAZLAqBzwA271bq28hzS28/5IPi7NqoFH9B34oiHsGMf9z693Sm4HXxtlEaLiTShhpAi8s/927ZHifdF/j5lyzt8k9u02Ryu7C1Yldk7o7sS4uTTTN9rP4vAe+LuCOmD426/5YekT+8oTgIl9MiWj7i9ziGa0ljh0OAQ1asjxgrd5XalF01FHhHOOqPDYcXXtLFB62URuSKVwv2gx8IWhivi0fKwuj5boMzgiKqvetBG3Jz5wlMHLw8dZ2Z6iyFNjPzrnQ4t+cs25LH0eSwnPZWEl3oTxHqX8jv/Lnew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqWAYvfvGDjJAHRQH+uBn2KdGRf0bs5xU5VaKskiyI4=;
 b=vpcTcIFXrLtNfgcKTN2Ufg8j6a1dypn4Nkfac5eGhYRJec8O1AYd8y/YTo/LZedmbxocAGw+xx4joLlqgqzlPJdiT6LfOaUFZjNUVTv8RC3FE2aQ7L0zqtOAOiuxDQT4OOE6+i1Ht5Dhw8UeM8zBj5BWh1SSBhk+bz82EvroFYw=
Date: Thu, 3 Mar 2022 11:43:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: PIRQ handling and PVH dom0?
Message-ID: <YiCb2Tk+XxFnCIN5@Air-de-Roger>
References: <7c85d28831f3f30fb61bb359a23f570c34b4d31a.camel@gmail.com>
 <6ad3e3f9-0d3d-4223-0951-0f8ee7fa4b8b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ad3e3f9-0d3d-4223-0951-0f8ee7fa4b8b@citrix.com>
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a750087e-7c11-4617-995d-08d9fd02af5b
X-MS-TrafficTypeDiagnostic: CO1PR03MB5764:EE_
X-Microsoft-Antispam-PRVS: <CO1PR03MB57644CF05B5ADE9886C1350A8F049@CO1PR03MB5764.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0P14omyhnFwGolLP+U2kXOGFrvx7ymT6EoW6VL2ahjhYkfYlx1a++z/aBz5EKn/6xI8Us0BwOY36zG2Qu5zQ9GO1MY8EDxpzcHrqV5u7lhKwLGMiqU5ojV+lYRd83jfTCAsVhQ/oTVi6weWPuF3si+ZVlfbfT3govh3N3rdm5F6SUQXA3R14E0W4bwxuEpGVihPIDTlRTerkwpCv4mgZbyv5cGsIkDYbl7pclVkgqVGiR8LbEnXJ92PZ/P0vkEB2ISdTFYtEuCDUornvnDugwRDSmbZ2AZwP72DM+nq8PacEMb9NCWWhtc10R3LXeXCcy7EkN6D3XtQLP6sj3XHZ1ns54XzC75hlMegtvkNZb1Be0ikYwiqSuPrpyT3F58+VqdsbV8tM1Hi5ANcUNzXkig2oF9rj+zxDwvWJ1+ONHwp14s9ncVGo30XPff4nVOn35xSPqZ0qgnlY0YFSnxQsWaPYwnURciCocTqD5/nqFfwg41fBtSfbcgM6ca8LTIGSP0xXHBbj4D9+HYdtWOGQVu3TJTDO7tTj9g4JymCIrVCb/WnmqrclWpyRzuF61WxwJ1ruKOI6bvTV/cd5ybaF36daex7P8iwqIFEcnHhrsZwzWUXkcPSG+4/U+UtBtVi7V9kFL2I8o1H46jTESvlFhdZLiyQCUd1Mttpa97vzKlIWIgBl22xb9PrbjI8/mHgVSNPtH1+Q70tNkxsNVQfLlv8qFab0v6Tc9a40tfQWOXxboJGiBRla/EG9k5hzNXdzl9KpHrSuvPpmpp1AJFN+fntAZnqDI7nNWgzsbqyY5b8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(26005)(33716001)(966005)(6486002)(6636002)(316002)(82960400001)(53546011)(6506007)(2906002)(5660300002)(66556008)(66476007)(508600001)(85182001)(4326008)(54906003)(66946007)(6862004)(8676002)(38100700002)(86362001)(83380400001)(8936002)(9686003)(6666004)(6512007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3lMWmQ5ajBMQkxnSGJDSmZ3cHEvM0J4cU0xUWx2RCtQK2dieC9MMWlSK0lV?=
 =?utf-8?B?T2E1bnVMZ3ZDbnlhcWNNakhpWmpTWmdjUVI4eDRoeEUxemlaakN2eU1pUUNN?=
 =?utf-8?B?bnIvSWlRS0xwRU9MNW5RMFpaQWZaNDRUSzNHS0x0ZE9TM3B0b1phTVcyS2xG?=
 =?utf-8?B?YXpNTXR1SmtJeVRhVE9wczNTUnVGNHJueWVkTFdaRlR1NzBBeGY2SHhVNDJ5?=
 =?utf-8?B?cnBsY3o2czdGNWRhWWFWYk5EWUVZYkZKVFNzQkFmckVhNzZOK0MxazloSnpi?=
 =?utf-8?B?U3o0R2NUOGdOQ1cra2hGNDRQZHFVWnFMUWROemxqV09zWjN6V2w4ZFpWbXdX?=
 =?utf-8?B?dWZSZnBzVUFaTThzSDZVaG44bTBTdS8zNHV0RjlFVWo5aU5tYU9ZeGN2bUxy?=
 =?utf-8?B?cXlmd2dVaWdkL3RrdVdvL3lJdkZ3OU9NdEl6QkY2K1JnVEFVZkR1S3VPK0Rn?=
 =?utf-8?B?cmNPYU5haVV1ZHR2Y3Q3RlJyOExlM2dnS05VT3NuMFdVZ2lsdXRxYjc4c01Y?=
 =?utf-8?B?NUYwaW14M0RBaWxJVGRkSHVkQjdEeWc1bnI3cER6ZmgrMlhMU3JzaW53bTdu?=
 =?utf-8?B?ME9qQjZBcHFMZi9kdWQrNVRINGVla3I1c0EzRitxUkNGTGpPY1pYaDRuTG1D?=
 =?utf-8?B?cnoxWHdocW1LY2lDdFJmclZ1TUpMcXJ5aDFHdXd1YytmUEpSS2xCVWx2d0w3?=
 =?utf-8?B?U3NHWUFXLzYyRktMempaU3M4MTEvUlptYXBwZ2xqZ3QwTzFCWUF3ZHBZbGxn?=
 =?utf-8?B?aEZCZzNoR2xvcXdKQnY3bTNtU3VDNi9kbWY0bEdjQjRpL3BkbFdJQXdJZ0pt?=
 =?utf-8?B?ZEIyTFRZL3IrV1QyeGZGUUcyZDkyZEFKZlp3Ukw1djQxQWRySkQ5UTcrenY5?=
 =?utf-8?B?MlJkNUE3UlBvaUpBNzZ6Zk1jUUZZdFRERTlycFNVN2REejZxS0xyQzZiL0cw?=
 =?utf-8?B?R3ExdC95SUt6TFVLUnhuVWZVbDZjcmg3NDUzWnU4UDVjRWZLaHROa0JIMlJY?=
 =?utf-8?B?ZjhnSUoyVldoSHFXT3g1SDUxQndDbHJhcVRrbzh0WVJXZlBKS1Y2V3cxMmNl?=
 =?utf-8?B?TzZxYXpKS1hEZ0JzWStjQWRPcUhUNE9XalFDQ2JWMmVsYXpXUnlEMWZyNnJB?=
 =?utf-8?B?amdWcFhZWUNjQjQzRlBwSGZ0dE5kVWpCZ05SSXRhL1ZRWTZVbEJlbE44MXJ2?=
 =?utf-8?B?NytocWVkS1FQaW5mbmNIUE1obDhFekhVYWFwMG5SKzRVaUptUnVTNW9PeDdZ?=
 =?utf-8?B?OHc5NnIvR0Z2ajdvcDdwcHhBZnBrN21OalllNy9xcWd6VEtxM0Q1eSt0Skpi?=
 =?utf-8?B?Z0ZNV2oyWU5NcDBlWGJDRy9tdDNDeEVlWDU1c3RiM1JMTSt1REtPWWZkRE42?=
 =?utf-8?B?d1o0OStEVDM4dHExdC9qSGxHUlVNb3pWSEJZTURPb1Z3VW5nN0hHczhVbGFT?=
 =?utf-8?B?OUpsWUVJdmJHbVdyMEVzZWR1MGVudjlXalJhaTJCMFJBVEJKaklhWEFvUGYr?=
 =?utf-8?B?QmExQk5ReUdBdFpxTU0xMURBMHd1VWhEQXpzSnd2c1N6Qk5SZlhTVEdOSVFq?=
 =?utf-8?B?a09McWJiVXYwMUlEV241Rmh1b3gwdGxzdVBBTG9hU1J2K0g3Qm1waGptcU9K?=
 =?utf-8?B?RTl4bHNabTRWSjY5emdCMjV1ekE0U3FDUVdPTXhoVjNPKzdqUitvWEFCdjR3?=
 =?utf-8?B?S3ZIb3VOSzZ2RldTMEdhSDA5czVRUG5ERFR4MGdBVHlwbEhtTHBFNEw0aWVh?=
 =?utf-8?B?Q3duVjlZcnN3bTBMSHdCRE1manlvZzhoakhoTitnaG5JdnFpRFRTTk1iMU83?=
 =?utf-8?B?ZisrOU4yQW4vRXEzWlpTbVNmVnVWWG5ybGErWVdQZEJuQ21oWVJkWEtubzE2?=
 =?utf-8?B?Y1E5dFoxSTFrTzBEemhLamdNdlQvK2tmc3hJNkQ1UTNCVzBwZURxT2E5UVk5?=
 =?utf-8?B?RExjTEpKaTgwZXpLNUQzbUNEVkgwcDlEcStHbXVQYWVJR25vdVRCU0xqMFZW?=
 =?utf-8?B?Ynh2c1Z5bVNvU3JWK1h3Y0t2OVJaSkk1VENtMDRILy92RUYvQW50cnl5ZG9E?=
 =?utf-8?B?eTVySkFkRlI1WjJsRFluaVkySGNOMjNEYTBVZ1RkVThGU3NyZFBxTUQ0OW9N?=
 =?utf-8?B?OWlKWlNDRkl4cHBGY21EcmZYSkl4c2pwODFVRVNtMzZ3YncrTkIvMEFhYmlr?=
 =?utf-8?Q?+CEEq2vcShdqrInHjmEy70Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a750087e-7c11-4617-995d-08d9fd02af5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:43:42.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gkjRnsogESoMyOv0jQhfQSJoABgfXZTmcPsHcLtvChDqp5Xpj64kgY2si065V3kyPZloC+RG3ga62/Yzn/uhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5764
X-OriginatorOrg: citrix.com

On Wed, Mar 02, 2022 at 05:49:14PM +0000, Andrew Cooper wrote:
> On 02/03/2022 17:27, Alex Olson wrote:
> > I further attempted to see how far PVH dom0 can get but had a general question regarding what is not yet implemented... 
> >
> > With an initial version of Roger's recent "vpci/msix: fix PBA access" patches and after refreshing his earlier 2018 patchset "vpci: add support for SR-IOV capability" regarding SR-IOV support for PVH dom0, I was able to get both physical functions and virtual functions of an SR-IOV network card to operate correctly in PVH dom0.
> >
> > However, it looks like any PCI-passthrough for HVM domUs with PVH dom0 is not yet implemented. I see the "PHYSDEVOP_map_pirq" call fails since the "emulation_flags" for dom0 do not include "XEN_X86_EMU_USE_PIRQ"...
> >
> > 	libxl: error: libxl_pci.c:1461:pci_add_dm_done: Domain 1:xc_physdev_map_pirq irq=17 (error=-1): Function not implemented                                                                                                                                                                                                                                                                                                         
> > 	libxl: error: libxl_pci.c:1781:device_pci_add_done: Domain 1:libxl__device_pci_add failed for PCI device 0:5:0.1 (rc -3)                                                                                                                                                                                                                                                                                                         
> > 	libxl: error: libxl_create.c:1895:domcreate_attach_devices: Domain 1:unable to add pci devices                                              
> >
> >
> > What is PVH dom0 missing at a conceptual level for PCI passthrough to domUs?  I naively assumed that an HVM domU guest wouldn't care much whether dom0 was PV or PVH in terms of passthrough device IRQ handling...
> >
> > Thanks
> 
> Hmm.  xen/arch/x86/hvm/hypercall.c hvm_physdev_op() filters map/unmap
> pirq based on currd.
> 
> But this is buggy.  It should read the physdev_map_pirq_t parameter and
> look at the domid parameter.  What qemu here is doing is trying to map a
> pirq on behalf of the target domain, not on behalf of dom0.

Even doing the filtering based on the domid parameter would be wrong
given the current logic. PHYSDEVOP_{un,}map_pirq are used by both
domains that have physical interrupts routed over even channels and
domains that have interrupts delivered using the emulated interrupt
controllers.

I've posted a fix that should allow you to make further progress:

https://lore.kernel.org/xen-devel/20220303103057.49181-4-roger.pau@citrix.com/

It's likely more work will be needed, and it's unsafe to use until we
sort out the issue around locking for PCI devices when used by vPCI.

Thanks, Roger.

