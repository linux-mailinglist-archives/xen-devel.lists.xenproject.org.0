Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF80434BC0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 15:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213905.372266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBDU-0007vZ-Ui; Wed, 20 Oct 2021 13:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213905.372266; Wed, 20 Oct 2021 13:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBDU-0007sg-QY; Wed, 20 Oct 2021 13:01:12 +0000
Received: by outflank-mailman (input) for mailman id 213905;
 Wed, 20 Oct 2021 13:01:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ou1c=PI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mdBDT-0007sa-1A
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 13:01:11 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c390bbd7-300a-42ee-924f-8af4b1494312;
 Wed, 20 Oct 2021 13:01:09 +0000 (UTC)
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
X-Inumbo-ID: c390bbd7-300a-42ee-924f-8af4b1494312
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634734868;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qqlWeo3wdUtdfSxGj9t1Lb1QjdDmBiVPrP9OPsAolxQ=;
  b=c6mCgy8CUCDbjGh/KLw9khKPDy5vFIQsAejWJwzKwnXr0aWx7FkQHT7Y
   qZ3b8zBkg3E+2KooEmBD4snc32AFrUk09kfAHDAFO9YR6WOUyxBRUXpW9
   ieJPmDJ7C9r8xPinoP6VGG+ryVzcplXLV2NIRcvC3sfjmcfgQj3o/NW26
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YuhvlQ/f7PaRtYvRpOqy5pbqyMtxVA4x2BSWlo8u2NSTM56kRj8RY+CggtPA3sb1Ua2HFrKrih
 FvIKNnubxMwR01FlJ69GbvouErmNx83P6F0LDEJufjAc5sSqfXJjbCaD2ACd6rNNd+UccL//eZ
 WaB69CII4D5EMsjWV0vK6uLyQ20tzStTTz8d5QEHygjSCJZEKT//cMAyQDPkKq2on/B9ewUtVu
 e4FiOLqIOE7cYutg9keMB+Luf4/psLdrlArbB35d/8xzD+hdNrLSRBkTwYKfgfxFaAXRxqGwTx
 ySeCxjifjmxSAJFy2/eTigxi
X-SBRS: 5.1
X-MesageID: 55661904
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cSFVRqDmU/ZdThVW/3Tlw5YqxClBgxIJ4kV8jS/XYbTApDhzhDAOy
 GpOCm2BPfqDNDOmfoggYY3jp0sG6p/TnNRnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5500o7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jW2Yuf9x7
 vx06oXzDggLO/bFv90dakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHviUu4YJhGtYasZmMqeGQ
 ZsDdRFUQzfCeTFXMGlHFIpltbL97pX4W2IB8w/EzUYt2EDfxRJ8+KLgO93UfpqNX8o9tkSXv
 GXd5EziHwoXcteYzFKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydGHjUq5V8NaO
 lYj0CMkpqgv92SmVtD4GRa/pRaspQUAUtBdF+k77gClyafO5QudQG8eQVZpacMknN87QyQw0
 V2ElM+vAiZg2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLOLGxps34H3f32
 T/ikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzgOPT0SK7iVQXdG8JMuny12A5NF5LL/MGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUwR8d5plxB71bmJNoKuGgvey+FJ+5dIWexC
 HI/rz+983O60JGCVqRwf56qQ/ojyaztBLwJvdiFM4IQPPCdmOKBlRyChHJ8PUixzyDAcollY
 P93lPpA615AVcyLKxLtH48gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/l6Jr
 YgOb5HWk0wGOAEbXsUx2dRPRbztBSNjba0aVuQNLrLTSuaYMDBJ5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGcTdlWcQThmnktLMeu1Nb4m9CpTFXV1YT6AhihyCa7yvfx3X8ZmItEaGBlLkKcco
 w8tIJ7bXJyii13vplwgUHUKhNY8JE/121/WY3DNjfpWV8cIejElM+TMJ2PH3CIPEjC2pY05p
 bih3RncWp0NW0JpC8O+VR5l5wjZUaE1lL0gUk3WDMNUfUmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8zvoO9p7JTwgl+Mm/MalCnVuFpLnWchJEdvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2CLv/ovIUj86Ctmx5a9UB1fb0uWlShQDLppK4d5k
 +0vj9Ebtl6kgR0wP9fY0i0NrzaQLmYNWrkMv40BBNO5kRIiz1xPbMCOCiLy553TOdxAPlNzf
 22RjavGwb9d2lDDYzw4En2UhbhRgpEHuRZryl4eJgvWxoqZ16FvhBABoy4qSgl1zwlc17MhM
 2dmAER5OKGS8mo6n8NERW2tR1lMCRDxFpYdELfVeLk1l3WVa1E=
IronPort-HdrOrdr: A9a23:BNlKhKzUo7s5reiJyJksKrPxtuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurAYccegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTEUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13zDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IXEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fi1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqsq+SWnqLEwxg1MfguBFBh8Ib1K7qwk5y4OoOgFt7TBEJxBy/r1aop8CnKhNPaWsqd
 60dZiAr4s+PPP+W5gNc9vpcfHHeVAlfii8RV56AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.87,166,1631592000"; 
   d="scan'208";a="55661904"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZxTUurpOWMw2fcbSY8VfcuWrdAmDPqdsw5YKcTlekbM5DA7ZglkizxGLqSQwMY2zmzAb+TdhhUwEhooq8bFtYNf2G76JWtNz9W3BrjZQ14XfQNHSk7g2qGRDr2ctzb6UupslxjfYCXUMK0fBmPnbyUi8ung44mVE5SPfA2UyuRixHQOYsjmdam4UWSlN8k8iglZE9dRPc5qd6Rdns4xPKGBdFPBbqUwD4BQawgSKw7BoJYj2OTScyTsSkSchMgfojG+AJGh4o+nI+GxqhUyvfblHdL/Nvx49fymtOY0JUb/mEPEdFFgCr8C7xF3KhYsgvD+Trv2b4kfwqpbYuB6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwkOrM3ew4Uag3S6vuK0AcPabEKLtKuRB2nINxKENyY=;
 b=X9iTmG2q2NGSunmI11tEzy7FItjAeILM/LyNBCvG+yi5RjDVwTrI8BBRlyh7Zk4wRQDfzBTIiINJapThTNc6+FB4cbT8AUOgfdryhM3ZsBp40BNnDhPBtdfazZe0ulpuUWdqM8KLQAFJpqHtjL49EykAwdlx5ImiaeTfpa5PJpy5WBVlaEJbDHIYSqBCYIDW35FmnyGMBFjcPTuMHH5EjQhhcO1SP+zCRloi2t9Rqd686zDZ+3EnG13EEyI80KJ9rivaz8v+Am9X5Pu5yZXKogsmL8UTH5WYqwefINJGMA7JHCgf7JEMIbCbE6+FjsfROcVy/lofyTX+IgQvlP7DCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwkOrM3ew4Uag3S6vuK0AcPabEKLtKuRB2nINxKENyY=;
 b=tBm2AgSvMYuEXwbL5B+hCyVnHbzHdydwgUakdSyEUi5XKu2OVaEZdhS1DfjOhVhRYx7vFWuZGeQgR4gkN/dlZWGRmM04XN4cjJr7Jt6HWgJO+uFnKNjKnonfDIaWQlICgEiuHa8SaX6JiHWNEnrpUEmuTlcwDpuKuzdOYdBDwQ0=
Date: Wed, 20 Oct 2021 15:00:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/6] gnttab: allow setting max version per-domain
Message-ID: <YXAS8egv+3Uzj3WZ@MacBook-Air-de-Roger.local>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-3-roger.pau@citrix.com>
 <f5564634-5f9e-0b94-f73a-d44ae65c30f4@suse.com>
 <0b58667f-b6bc-d5b5-2dd1-0c8996367319@suse.com>
 <YW/NipJMLH0Zz05s@MacBook-Air-de-Roger.local>
 <a3d9388a-e2f5-76aa-d51a-2d74afb92bbd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3d9388a-e2f5-76aa-d51a-2d74afb92bbd@suse.com>
X-ClientProxiedBy: LO4P123CA0124.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f66e7e51-ce78-4d0f-17c4-08d993c99d90
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463E957FA103D31067B0C718FBE9@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVt1Me/bNYMvWhZYp85e/iwIrMU1YxrPtTOTqZ0CFjfiI6Yk1poyy0rG3CuOb3L6cAoGS8Am8gHeRsIjwSvKH3j5p20fli/sS4PrHLZD/jWPgsDpTnL764Pq1h+T1p6dkxGssexvXaC0xsys4ZPWh3iqaBwKbrVj1OBZQWKBZm1qBcEEeCxVQDyC6uHAI+X/s1T1UeWHVWHDKN/1XIvvzySEpbLTd+K0Wabwe3x7/mXMvuJrLe0kWwKURw7LOkcUNjIW9+sE53JQ7yvJLP5RVck4Y2HbpmecqwXqsru3221HC0Sy6bRJBFc2foP7mvVWvIVlLfPi0frHlFuREk7wrRR9bSs8LYsiEosvHMhuEkKOagM+7Ew35jFCbxNA0D9Ad/HE0YSgrMin3xX4jF6hxidGnXGIDAMKf2bCCdonK4mJ1BNwtSaeMFtOT4SpND2QFvZrrqFpY+2e1lYbRiS1Pr2cGzMdHAsiK5uqbRMRisS3KwPTKVcSKPWjjxBwnXel2qQPCZdwPM/mgiiu3M6vosM7kppvi68RTHG49TSSvK3XNujvDBHQqwKicGX/nSJFj46E4fKCfnLbo6Nv8ynCVlcrjYVbKPWTj4PIkzDsXRIvnrY0ffAM4xdmXYFb0tQ91bJyuPos5B0QE2eSTGfT7RiwbVQR0hQmxhQpV2BKP7S12TvMPwV5PZRMoQv/vWIbvJhZB9BmsODIB4/WxK73Yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(6486002)(186003)(85182001)(2906002)(86362001)(316002)(5660300002)(54906003)(956004)(508600001)(82960400001)(66556008)(66946007)(26005)(6916009)(6496006)(4326008)(8936002)(9686003)(66476007)(8676002)(83380400001)(6666004)(53546011)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW5JR1Y0Q21lQjFHZVBRVHEwNHhPN0I2QjRxQnd3bTZYYzBJOTd4cmlxY0Nu?=
 =?utf-8?B?dm1yMUwwMVBUTUxQUlFEdXp2cGdCSW10SUd5SEdOU29PRnF0NXN6WU80cmtz?=
 =?utf-8?B?N2RDQW1GK3k4VEsrcVRNNHFjK0FLNENuRDlOb1FVSlJYdEFhR3NqV1JORlNZ?=
 =?utf-8?B?WW01NWNxTWFERlozcC9aK0NGL0wrTXNwNWZsY1M3dWloaVo2ekNGRklNVDBU?=
 =?utf-8?B?UmJCU05JUFB1akZJVm5FNUpuTTlUREN6RlJZNk83d3FiVUJrcmVEWWp5Tzk4?=
 =?utf-8?B?QWxlL3N5NEp5QnBXanlRZk5ESWpmQWhQTEhrbmt6VTFvUzU2QTFEdENRSllo?=
 =?utf-8?B?U3lZdXN0V3RtMkxWaGVSalRNNWJlSWRwUjMvdGQwZXczRFRYYTd1cS9YSS9r?=
 =?utf-8?B?SlpzOVh3UVkyUi9VUzF0UHJiV3l4ZHQ4MW8reXJscVNTdG9kMy9wcWpjWG9i?=
 =?utf-8?B?dnh0anBQU1JQRmhNb0RtSkpzK3BYOVN0c3ArU2VETlo2dHp2ZWQrbE5GQkl3?=
 =?utf-8?B?Ky9UbFdVRGFLems2a0hEd3BmcEM2a1pmWDZIMjB5N1lucEdTYXZOQzBaaldX?=
 =?utf-8?B?bHFDNG96cGxoOW8xU2VWQkZCV2Z4cHUranlGQmlzSXZ5MVEzbFRacGMxc20y?=
 =?utf-8?B?ZjNMOGc5SjRacWd0U3hPMlhhYVAyYWo5RnMvMnpXVmVrekFCVm1oWDZsdm9U?=
 =?utf-8?B?dmZ4QXRTR3lnTnVwbTUwbW1ENDNuSVJ6MDFmVWNjNEJMbUpVYXU2Z2VhK0lW?=
 =?utf-8?B?Q1JVSWxpOHBSWkR3alpxL1k1blU2Q0paai92cE5ocitVMW9BM1J3V3BRV3E0?=
 =?utf-8?B?amVSaUxlNG9XREl3VHNkZnhvRERsWnV0S1VWMDJzeDdFa1hBbEwwTDN4R2Fi?=
 =?utf-8?B?ZERIQlFMRmczMHRwNEU5RTlXek9DaitmS1FYeHluQlZlQy9UNGZZNU9PSmhz?=
 =?utf-8?B?dXRvMzk5TnZaK3YwWEM3a3FwK0ljRXEycWthNFA4dzEzaHZ6NVBib25hL0Uz?=
 =?utf-8?B?MmRJaG1nemV5S2FIYUkvcXE4ZlNhYkZiUHl1VGMxOHpFa1lQSjUweXhoS01K?=
 =?utf-8?B?Q2REQWJaMEpvL3ZGc01Mbno5d3dzZzh4bFdkMVVNcjB2dzFiaHlWZStiMnZn?=
 =?utf-8?B?ZDhMZnBGcUp0NzN2U2I1Wk9WUVBaMHBYdk1FendZY0xORXNoVXN3OGwxVnND?=
 =?utf-8?B?Z0t6anJzaU9IcThQUmhVbkN0TVRaTE9XU0RuekV5bnZsblE3dFJHRGsyK1lM?=
 =?utf-8?B?SGRlMCs1eUp1NERseGp4clRIcVdGb0tLV3VrRmQzVnlSY1YrS0pFbmRlcEc2?=
 =?utf-8?B?RVZDdkNLdFl2b2Z5WTJKd2xwVlNvNVZlMlFXWVhlL1Z1QnB4dDZvdHZQSEJn?=
 =?utf-8?B?eUFtOGw2TDFJNkFzbVFNbGhGUzM1M0VXSUxJTUtOTWFsNzEyeS9ILysyVHNs?=
 =?utf-8?B?bkFxelBtYnFJWVlsMU1GNXI2bWpEN2xyMnRRY3YrOXBMMmxnVVlqZ1U2UUVN?=
 =?utf-8?B?eVpNV2F2WGRPK0E1UzRiam15dHoycmdDTEgwQldVOEJyaks1dXRFNm9aT3dU?=
 =?utf-8?B?UXNZdFgvTlNQNG83Tlhoc1VRenRnRXpOMG5hRWRRVStGdVV0cCt1a1JOZG9B?=
 =?utf-8?B?TkloN25JNVNzVENMeXFUTCtuRG5yUlhQQk5HYUZQS3ZTb0EzMmJDL3owZ1hm?=
 =?utf-8?B?V0ZmTUJEVUxQMUVPVTU2ci9WcWQ4NUMxNzF5NnRIY2lQRWxBWk1Ud3F1SFRL?=
 =?utf-8?B?L0p1d1B0VjZBdEtUUGg0R0NuUklkNmx6a1ZreXlWbkZhckJJT29TV3ZkWkdw?=
 =?utf-8?B?Z3FyN3lHWlRMNGFhT0JoNEN5V3Q5RGp3djl5eU10bGRkYkhEbnhvcFRQOGdv?=
 =?utf-8?B?MkV2bVprZmZ1LzdCQ092WXpQU3pjYmx0YjUzT0RLTzFwclJXenltNzV0KzVo?=
 =?utf-8?Q?21mL4oGW1YOTC03jXTrDHbnslgVFY3sO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f66e7e51-ce78-4d0f-17c4-08d993c99d90
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 13:00:39.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Wed, Oct 20, 2021 at 12:57:11PM +0200, Jan Beulich wrote:
> On 20.10.2021 10:04, Roger Pau Monné wrote:
> > On Fri, Oct 15, 2021 at 11:48:33AM +0200, Jan Beulich wrote:
> >> On 15.10.2021 11:39, Jan Beulich wrote:
> >>> On 22.09.2021 10:21, Roger Pau Monne wrote:
> >>>> --- a/xen/include/public/domctl.h
> >>>> +++ b/xen/include/public/domctl.h
> >>>> @@ -87,14 +87,22 @@ struct xen_domctl_createdomain {
> >>>>      /*
> >>>>       * Various domain limits, which impact the quantity of resources
> >>>>       * (global mapping space, xenheap, etc) a guest may consume.  For
> >>>> -     * max_grant_frames and max_maptrack_frames, < 0 means "use the
> >>>> -     * default maximum value in the hypervisor".
> >>>> +     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
> >>>> +     * means "use the default maximum value in the hypervisor".
> >>>>       */
> >>>>      uint32_t max_vcpus;
> >>>>      uint32_t max_evtchn_port;
> >>>>      int32_t max_grant_frames;
> >>>>      int32_t max_maptrack_frames;
> >>>>  
> >>>> +/* Grant version, use low 4 bits. */
> >>>> +#define XEN_DOMCTL_GRANT_version_mask    0xf
> >>>> +#define XEN_DOMCTL_GRANT_version_default 0xf
> >>>> +
> >>>> +#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
> >>>> +
> >>>> +    uint32_t grant_opts;
> >>>
> >>> As it now seems unlikely that this will make 4.16, please don't forget
> >>> to bump the interface version for 4.17. With that and preferably with
> >>> the nit above addressed, hypervisor parts:
> >>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> Actually no, I'm afraid there is an issue with migration: If the tool
> >> stack remembers the "use default" setting and hands this to the new
> >> host, that host's default may be different from the source host's. It
> >> is the effective max-version that needs passing on in this case, which
> >> in turn requires a means to obtain the value.
> > 
> > Hm, my thinking was that the admin (or a higer level orchestration
> > tool) would already have performed the necessary adjustments to assert
> > the environments are compatible.
> 
> I don't think we can rely on this in the hypervisor. We may take this
> as a prereq for proper working, but I think we ought to detect
> violations and report errors in such a case.
> 
> > This problem already exist today where you can migrate a VM from a
> > host having the max default grant version to one having
> > gnttab=max-ver:1 without complains.
> 
> Are you sure about "without complaints"?

Without hypervisor complaining AFAICT, as the max grant version is
not migrated or checked in any way ATM.

> What would a guest do if it
> expects to be able to use v2, since it was able to on the prior host?

IMO any well behaved guest should be capable of handling both v1 and
v2, and lacking v2 a guest should fallback to v1 on resume, as the
grant table needs to be re-initialized anyway. I think it would be
wrong (ie: a bug) for guests to assume v2 to be present on resume
based on the fact it was present previously, as it would be wrong for
a block frontend to assume the same features to be present on resume
for example.

If a guest only supports grant v2 then I think it's up to the
administrator to set the max version explicitly in the config file and
that would be acknowledged on the destination end and migration
aborted if not supported. I think the behavior after this patch
is more user friendly that the current one, as no checks are
performed currently.

Thanks, Roger.

