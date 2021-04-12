Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5AB35C571
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 13:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109032.208117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuwV-0006Yj-TK; Mon, 12 Apr 2021 11:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109032.208117; Mon, 12 Apr 2021 11:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuwV-0006YK-PY; Mon, 12 Apr 2021 11:41:23 +0000
Received: by outflank-mailman (input) for mailman id 109032;
 Mon, 12 Apr 2021 11:41:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7uB=JJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lVuwT-0006YD-T6
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:41:21 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f519dfc8-d4a0-4fb9-aed7-331b4d6ed998;
 Mon, 12 Apr 2021 11:41:21 +0000 (UTC)
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
X-Inumbo-ID: f519dfc8-d4a0-4fb9-aed7-331b4d6ed998
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618227681;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gdric4SQ4mSdKV+aMMvntU/uOgB0zsoh+hgcxwoj8Pw=;
  b=C2boPbn5T6ytwZ32lNzOWIPRrLrghcYFDRa52TdS7V8nsXpBR04CoW+y
   4YCabseEryA+i/VUsdLeUULMs+Y8MgdGvd6nm4FK2s4l/sS9HNNbqlNc2
   RqmWh05HeyR9kmydrlWkgnCRsS4zTMUk2JuqMqWxCC+pRNIn/V3e+Apy/
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: erUaP7NU2kZmuB6RdNye9NRKCQeaFh7R7pUUW6F27Zo1ji0KsVwT5BTdvg0pnPkUe+M7Rtr1jr
 vkTTH3ti+oBWJ1OgrB0CXbtoYCmhNictmQN+vgpPMdGDbZ78an43NWoIrsP5Gi6m8nlsy1mGyF
 sXmlY7xz7yh8EW/qbllbiJQD281+q3TuPB1zVHLsRRFIF0gJjCQXB5ntoz8oaoPOZthRT/I54M
 5ik/T+uafIWxSwX6MDeCgORJrw7yzSy4OVwsFuh72fLXK0D//2KMEfcwb4RAoDUI3oz+xzljJK
 47w=
X-SBRS: 5.1
X-MesageID: 41374038
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SG3sBqgfbcdvdNglr51TJUw5zHBQX35w3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyywe3cGIzVuL5w/CZ
 aa+45rpyC4f24Wc8S8ARA+LpL+jvfMk4/rZgNDOgUu7xOAgSjtxLnxFRWZ2Rl2aUIz/Z4J92
 /Znwvlopiyqv3T8G6m60b/zbRz3OHgxNxKGdCWhqEuRAnEpw60aO1aKt+/lR8vpuXH0idOrP
 DtpFMaM913+zfteAiO0GfQ8i3B9Bpr1HP401+fhhLY0LzEbRY3EdBIi44cUjax0TtYgPhG3K
 hG332UuvNsZHuq9kSNhKm7azhQmkW5unYkm+II5kYvKbc2U7NNsZcZuHpcDZZoJlOK1KkcDO
 JsAMvAjcwmF2+yUnaxhBgK/PWcGl43HhuAX3EYvN2U3zV8jBlCvjUl7f1asXEa+J0nTZ5Yo8
 zCL6RzjblLCvQbdKRnGY46MISKI12IZD+JCXmVK1j8Dq0LUki93aLf0fEQ3qWHaZYIxJw9lN
 DoV05Zj3c7fwbLBdeV1JNG3xjRSAyGLHrQ4/Abw6I8lqz3RbLtPyHGYkspidGcr/IWBdCec+
 qvObpNasWTblfGKMJs5UnTSpNSIX4RXIk+odAgQW+DpcrNN8nDqvHbSvDOP7DgeAxUGl/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZeC67f0+8PyJUcF4FFvwQP4G7Jo/2jGHlniOgbbU
 F+KLTonueQvm+t51vF6G1vJ158Ay9ukfHdekIPgTVPH1L/cL4FtdnaU3tVxmG7Khh2SN6TNA
 Zeol9w6J+mNpD4/1FkN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIt8CBvMDB4wvQpxsm
 9MZEslSybkZ3LToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqYGAaUT6oWcu+mh0vWDJQu1
 10/8Yk8fi9sAfqDVF6rPUzMVVKZmjSKqlBFh65aIJdna2uRBt9Vl6QhTuRiwg6f03j80l6vB
 2mEQSkPdXwRnZNsHFR1ajntHd5bH+UcU5LZndmioFlDmjdtnFv0eiEW7qr3wKqGyg/69BYFA
 uATSoZIwtoydzy7hKTlTqYPVgNx5klPIXmff4eWoCW/knoBJyDlKkAEfMRwY1sM8r2tPQXFc
 iFfRWOET/+A+Q1+gCcq3o/IhNooH08nf6A4my90EGImFoERdbCKlVvQL8WZ+yG52//XvCSzd
 FXi8k2sebYCBS5Vve2jYXsKxhNJRPYrTToE6UGqZVIsbkzs7U2NZ/BSjfM3GxG2hJ7DMqcrj
 JrfI1LpJT6fqlodIguXggc2HwDvtGGNlEqvQz7GfVWRyBns1bre/eyp4PVor8uCHCbrAT+OV
 Oj4zRQls21Kher5Po/MeYMOmxYZ0g31WR68M6Df4PWDh+2d+srxivMDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec0PDqU3tlAo+BqJF6GC8R8yuRCqKBO5T6tS/fXCBmLGj7sL2rDD5T1KAGgglrL
 wAUUwbdcJYjDY+yKUxzyipU6Ty5nsfrGE220Auqnfdnq684GnaGklaMQrWxrVuNAMjTUSgvI
 Di6uiX1HP0/T5f/4LMfX0gJu1zJw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41374038"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZj/tJwaEi1++O2X3V/H3CO4do5gZ4Qx2ktl0rpRqbi9XIZ2GTj4GcsQLFEDLuVcM46de5+IUmeRIZbc6CerY5BldqLin7sCHgzJTjW5f0W03q2Rntn5p+otp7bviHCEq1D01WfIgdxTpsBX/EX8NYAkfuV59L3JvNhqARa0g6n2IQrYKdtfQUOQwZEObItW8QH4swFOA2cUEZp/c8ZekJ5zoknS7CUHK52QdY3dVELyWFGTNHvHo+tjFQ5yq8iB/H68yHVNfWaHj5zRsANmkVEuYmEbmt/INTvpdMsMjb87iEZhyCWheKwIhCevALKzM/4h5QauQMcGIAqwsaR9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQCvGcHVwliWN4BVaZE2w+OZGcyrze/VPI3RozXauEk=;
 b=WlDd5kGhc+H56gk7s/LMuH1AI73joG238z+cT8z785+9Ct1arcwtoh5/0a/ZvnrUFERTg8X/6bcdFaoGTOtBLR+jw2dn6XcFgHcqAk6a31pUnSu/2gc1g/igpPBft0iBJKdFL5zscYgK5PV/qO2KmlKNcKuicC9cGQrlZr/PVL3DEKhDxdIqfFVafPTvbZE0/IxIETb1EXIjv6YgoCqrdxxYmaXp6+CjNY/PLMGOpDJyvP+LVkzn/wN1ZRxBWWGnnlIYmOgLcJT4jLxPn9/O8f5R24kmAwVA81q/lnPrFJn4T7UEf2nB+Ow+VaJirby9eIm4ePUtGibuL6CR8PM0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQCvGcHVwliWN4BVaZE2w+OZGcyrze/VPI3RozXauEk=;
 b=KKb7WMBrIT+YKvZOkMrTOce/mVCUtTL11vL+8WkxZrzODyeuL3dxhAo/xBJ7nQnpCkn4BjXiU6bAsdHmZDdKkdl8nbK4Tr6u4jscc7/XLODsoWAUiUFoj7O6BNzX1UtdluyT4EaWzHtIjjem/xsfOS/pcoqYiFJFrkFRnBvwEBY=
Date: Mon, 12 Apr 2021 13:41:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/EPT: minor local variable adjustment in
 ept_set_entry()
Message-ID: <YHQx14WjVOdrDXin@Air-de-Roger>
References: <c682ec9a-c339-a929-1c91-c20bf53d9722@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c682ec9a-c339-a929-1c91-c20bf53d9722@suse.com>
X-ClientProxiedBy: MR2P264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::34)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32e62d4c-e1b7-49a8-97e8-08d8fda7e221
X-MS-TrafficTypeDiagnostic: DM6PR03MB4761:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4761D9B06A10FF85A67085FD8F709@DM6PR03MB4761.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DjqzfbR+qY1BY4i5/DAWOGkU4yHmvrpsaTvGtp/JlfEYwaA2ANo8PzU/FUfrEuHOFRfb0hYXi38hBeZfJ2c37rywPi97WtimAqJ+uziWyvQ0sgzSudq9cypHGuu7Yqsaje9h8nOM1MHwJRFG6nb4los+hKb1nip2CbTSYIldBvddwt6VVIeoAdXXCR3CPcvM3wpjuMJ24WkH+DDGrPb/VkFKXbPlLzSLiL1ZOrpyMJAvTYqxvdlO1Rr7h0yU4igMHwdmzrgaVpk+2H7GXjspRsFEpZUadcbd4CcRkPbwl0whka4UCrGa9G5QgqM7tLn5ENFznDI7s+gs+y7H/l52tabwkQK5PpIWXRtjrjVnlwdtbd6t3ZsD5n0aPpXYokrupF/lXySc3nfEkJYqyXEPQi2g5PbE7zR6qArHqC5fc/LuvM8sfX3W5RIKxAN84ww6xRUWq+OpY/BBY0QVVdSLUPETtLqpz1Oh4ZnQ8mrOZGqhd6yMM/bYqm9i11bqzCFoxJQwTSuBjW4XJqAzbjN/coZoSEiFflO6Pk0g3o6xJkQlii62sJxIMxPK9ATbnTa5m7UnpJzIfJSb8xqpHWGZksRucPD4e8Vg67YwY4iOEWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(316002)(54906003)(33716001)(6496006)(66556008)(8676002)(66476007)(66946007)(8936002)(2906002)(9686003)(6486002)(6666004)(4744005)(4326008)(5660300002)(86362001)(85182001)(26005)(6916009)(38100700002)(478600001)(186003)(956004)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XZcKDt69Hne5N+TzpzPSc61BtnbGW1AZEtrjl+rv6RYcFWhbRbODAvNOqKexCYWnKYZIIaBVnpjym69CQZH0Sg0GtJphGrpY9ePUeJSk+lKhTGpAAAEOth+cCO9CchWyCpOoy0HDjbnsIrGg0Qi2eNWoFL7xwF225wJsIbhGDMRm01gxeJIAbzh1rjzY1d9AB8DAoKDQdQHbSFXzdkBbK0SvcKL7tjjkbkiUFW7k6G+YEdV2iiJP5mZmQZT+zm29W+p2nU6QPsQIQTxMD5WaNTDQQMfrLCEG3yHBnlmUMI6ke2qHPnxoVcY6c8Z2icJY+KiJe+HPgXR9nfxrCBxQbStZb112zotbpvWqS0wGThPaR57ZoLIo8AMm01mukZ+BZbWkLbfK6BDsV5mbucm/gWHFLw9v7DKNhM+FV0Y9AYIzgWDYOrUfhAozMozC0tGfwQLwAO3ThyUQIn9x7MzaD87LPFRC20AraPdF6mDpUnmkMK8cQn9Yuyjve6Vmqp1E0JhbEe5rc4o+xWUlW3f89hxRltvA4ltNvnDGIb4xWc53fnScBfNaNgYxMFddo6BShOcgdHICmEBsx0I9/U5IfRw2v6FwZad1LLVmErQFeTLtOXSfFm2wxPYXV1ZDs8edaiv4BXbq6+oCRr6+/OrCE71m0buwK0bG5t2h5QGGUgzYj0LOG3Z6pAP+aLICbklbF8Xo2iZl5Fa2P4Et0iwi9dGPrJk4F93VOr+L3dzDqjtzMf12Rsf+46sOM1HvpeCg
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e62d4c-e1b7-49a8-97e8-08d8fda7e221
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 11:41:16.8895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olqLc6qPLGWq63WeTeMjOAC+StHFvxIh1yIWAicILkgx8vVLc9fjXee3C6xNZQASJpCL6oYcFL0/oIkHWEcgnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4761
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 01:33:50PM +0200, Jan Beulich wrote:
> Not having direct_mmio (used only once anyway) as a local variable gets
> the epte_get_entry_emt() invocation here in better sync with the other
> ones. While at it also reduce ipat's scope.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

