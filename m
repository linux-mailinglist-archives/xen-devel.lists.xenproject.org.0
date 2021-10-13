Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B35742B9D6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 10:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208054.364074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZEA-0005c6-O6; Wed, 13 Oct 2021 08:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208054.364074; Wed, 13 Oct 2021 08:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZEA-0005a3-KF; Wed, 13 Oct 2021 08:03:06 +0000
Received: by outflank-mailman (input) for mailman id 208054;
 Wed, 13 Oct 2021 08:03:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1maZE9-0005Zx-Gp
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 08:03:05 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed4b5c4e-63c4-4b98-979c-6bd8a53790f9;
 Wed, 13 Oct 2021 08:03:04 +0000 (UTC)
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
X-Inumbo-ID: ed4b5c4e-63c4-4b98-979c-6bd8a53790f9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634112183;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zqvRV5kQKDaBPi6oqAtCKIfidDg8nH+0iqL5oatu+T8=;
  b=P6MWkUpWQgBcjWOzprX1156SbkyrpKPFiCVyO4NpQY85aFxYXxvIcFMc
   gGmO1b4cONAieJsRby/b4iMiziI9ryJtFvp92WlNIpwl1X8caBzRMk8Jm
   XbW5AHno2AHGSY7cZYJ4Hps9JEDyCSaW1QmGPNeSDFZC2YulQP1Hnj117
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gjfcgcDmispWOpgaQAJndpeUhXIVy7SXaKZlxk+rWsurBee6+uqFcIXXkvRqbl53RALRL50y9J
 GLM5q91j96QQ5vGe1HnNHVI9EXuE/9orzq79tlBSmyHf2Y9U9eZCCzu/2auyD3eaauKaQ4TIOX
 MxkljK08owTi5Ir1ZBVW3TWsyXQ78hVZems7J6ePJuwQRSHa4LYKUMecLt8lBSdrFRQO+uvYx4
 pE2Bh0vPKFlS6VlMSdX+qLGgyAKgzIMkx8LH3lRzY6VJV3sBdBmMgluC41WW8lDQuz0d320/q7
 zy9+8foOPpl31H1qedy74Ivl
X-SBRS: 5.1
X-MesageID: 56941193
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d+5ALqAAOwkIOhVW/yjlw5YqxClBgxIJ4kV8jS/XYbTApDglhDxRm
 2QXXWmAafjeZWf2eIh2ao60ox8OsMPUxt8wQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX550Ek7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/2jOgsM984
 ul0v5GqGCwYDojFxOUzXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvubuYYBjWxYasZmG+T8N
 5QeQzdVSwXbQgxDEFhOVo8dg7L97pX4W2IB8w/EzUYt2ED6ygBr3f7VKsjEZdWQTO1chEPer
 WXDl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77nMXIA0bUx28u/bRolWlR9tVJ
 kgQ+ywvhas/7kqmSp/6RRLQiHyLpBkHQPJLDvY3rgqKz8L84hmbLngJSCZbb94rv9NwQiYlv
 nejksn1HzVpvPuwQGiE67aPhTqoPG4eKmpqTS0OQBYB4tLjiJoulR+JRdFmeIaPh93oHXfLw
 jaFrAA3nbBVhskOv42c+V3EmDuqqoL+Zwg5/BjMXmml4wV6Y6aof4Wtr1Pc6J59wJ2xFwfb+
 iJewo7Hsb5IXcrleDGxrPslTbeAyOmIGgHli1N1TrIQxxGkp3+NctUFiN1hH3tBPsEBcD7vR
 UbcvwJN+ZNeVEeXgb9Lj5GZUJtyk/CxfTjxfrWNNIAWO8kuHOOS1Hg2PRb44oz7rKQ7fUjT0
 7+gesGwEW1SN61jyDenLwv2+e52nn5grY8/qJaS8vhG7VZ8TCLLIVvmGAHXBgzc0E9iiF6Km
 zq4H5HboyizqMWkPkHqHXc7dDjm10QTC5HssNBwfeWeOAdgE2xJI6aPmu95JdA/x/4JzbugE
 pSBtqlwkwWXaZrvc1TiV5yeQOm3AcYXQYwTbETAwmpEK1B8ON3yvc/zhrM8fKU99fwL8BKHZ
 6JtRil0OdwWEm6v021ENfHV9dU+HDz21VPmF3f0O1AXIs8/LzElD/e5J2MDAgFVVXHp3Sb/y
 pX9vj7mrW0rHlw4UpmNMq7zljtcfxE1wYpPYqcBGfEKEG3E+4l2MS3hyPgxJsAHMxLYwTWGk
 Q2RBH8lSSPl+ufZKfHF2vKJqZmHCex7EhYIFmXX9+/uZyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64csQax2ya8e5sf0o+MIxApTA3iWPU+gDaltIyfa0JAX5LFN3LJQpSC/R
 lmLpotBIbyMNc68SAwRKQMpY/6tz/YRnjWOv/05LF+jvH18/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L13kG+X6NI3oMV7QcmqsbWIK72BA2zlxiYIDHDnOk6p+4dNgRYFIhJ
 SWZhfSeiu0ElFbCaXc6CVPEwfFZ2cYVoBlPwVIPewaJl97CiqNl1RFd621qHAFczxEB2ONvI
 Gl7cUZyIPzWrTtvgcFCWUGqGh1AW0LFqhCglQNRmT2LVVSsW0zMMHY5aLSE800u+m5BeiRWo
 eODw2H/XDe2JMz800Peg6K+RyAPmTCpyjD/pQ==
IronPort-HdrOrdr: A9a23:seXg9a7yes6KY2hYhQPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="56941193"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5CnKF1hhW21quagJEfmpcRabOLHhjVWuEFXSLHtHmTeDl7ppbik39qSPCpf5y2VPNkySMdzfbVYbdZI8GnyYmvXBuGmZRmImMpvdT7pW6zFEsCc/eRYS/PAHZ6m6EauSzQpeYfSA+/pz6QB2wppFidW9r3oxdNuuFjEGzj3l94BlCCnR/WXwdqkLy4GzGsiuSQQMdzKYPzi7vxtW04f0BgRQtCHnE2agKBOBAuM9bYetXlpe+P1vq3h/TRLAgytyKgozrcHuHwsMAHcwFFEt2137APK8n3Ltxi9xkdlIdrsprVH4IXUl2mun24/fbJFYC04ocb/CAMd4P0IID1Gnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2SCPJSS9nMQfiNegwvoJ6bjoxoDS441F4wEAIsJ/2A=;
 b=BZOQVvk4mT0xvOhedT66NUaYHD59ttAijLyzOurC9ePV0vuuuQFa+hoM7QK+oamC5AsGsjdic9OjSTKQWQUtsG6D6+ubx/9yaow10oYyawk39NUdyCGuo0rM6CE9GGVOYbh7DTO8ecL89b1vXdWC5OEwfJbrGpqTVZH6U1v0hSvuvNEoETGz3eiFBBis0N0AZPwfiWWAWdNTnVRgQoj9gzyeolxg4FizSwG94H8znPZqjqEDMhiVJTyU3K+5v1uTyKE8vdDaw1hsIPFHcMkBFl689pC5dEk+UXtAW1NBxzqmxVSXbhbgvm7/BMF2zNM9ePRUO0QD/ONS7scUedpISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2SCPJSS9nMQfiNegwvoJ6bjoxoDS441F4wEAIsJ/2A=;
 b=LIAJBofZ6DTAc+nidJFeGLbjt1N2OEPGVexoq9SQA/1v6fQKJ3fe0tlOEYsDVp3D/6D64I6uICOtUeiuSUVf5ZRmV0F14q4Wfo7laBsQCMu0X0RhEdy+SBSbAB0GA3BekEL1rroIcJV/SLLUesMzK2VXZeirWgQasnuO3TsDQzk=
Date: Wed, 13 Oct 2021 10:02:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Message-ID: <YWaSkrqzXoysQkCz@MacBook-Air-de-Roger.local>
References: <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
 <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
 <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
 <c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
 <09656882-b297-7144-c291-1ee997edb119@suse.com>
 <69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
 <24933.41349.893363.203683@mariner.uk.xensource.com>
 <AB6D62B6-2ED2-4957-A933-08EC77A4DFD6@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AB6D62B6-2ED2-4957-A933-08EC77A4DFD6@arm.com>
X-ClientProxiedBy: LNXP265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57226bc9-281e-4506-13d6-08d98e1fcecd
X-MS-TrafficTypeDiagnostic: DM6PR03MB4474:
X-Microsoft-Antispam-PRVS: <DM6PR03MB447405AC54113294C8EDD1698FB79@DM6PR03MB4474.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Geq27QIDYOz+S1Q5Gun/iDhXO/vDV5oFdKw1ZquJXozqz0lXGp7uzGbozXMjIZctp+5QPH0EnZmIWRnNRdpuAFbesgp6crk5mzvs86QiCVCxkTYwx82QhD2U0p/C9Yw5Mgzyi2Iibpc4a9SlhRMGduhOkQGZtAz0pnVrdII3krPUuoAFCfPs5MYszZYprP1vdZ6UqGXe0KcuNN37xD0LlTtdMNxZEXpVNbMDkIe67K2RlFipEA9HxBJM6iWCzPxqZvZ9zxq2xMDwImJh49stgGzOkxsArVqD7IsQ3iOHM+2c4VG6fh40Qs+XiLGYYaoKmdabuuvQPybhKWSY/lvHTnZMqEyR18J/UA3y5CT/PAz3JXCF8e0drcuf0xDmkPlGWYNdsIuNbbNBoJOVH/OFxDPX5U1bUfbpDU18KgM61/eMKrZGXqnyxMDGu+Rd1Wh1Ic3xvBEqfEauwWX3xVu/NA7bvldFobJPDop623qKE6Ofd7vORbOJAg//vPS8OMO2RrdgLvp0D1UETUczFxFjtGsbgf5A716l9DYKdchG9IlFbx8sfafU2wnQYeJSfT+xGQ3hDuDaRH6qGUV4In+XptrkWbPP2WNEE9wBRi8bE/zMZwogreSMJGJNS7a25bO0ZE/bj5TJaaDAI/rOxhfYxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6496006)(8936002)(66946007)(6486002)(7416002)(53546011)(508600001)(38100700002)(66476007)(9686003)(54906003)(316002)(66556008)(186003)(8676002)(5660300002)(6666004)(956004)(2906002)(6916009)(86362001)(85182001)(26005)(82960400001)(4326008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0MzdlBiWUpXZmxybytzZXF0T0ZneEhhelJFWE9QZkhYT2hOYjVqYVpKVUt0?=
 =?utf-8?B?OGpyN0QxUTRwbHdsYlNkNHRCU3ZGajlBUVB1YlBSQmd0ZVMwa0M5b2RaTWIx?=
 =?utf-8?B?UU9XUVRXeVFEYzJLRVpEcVFCZFpyTEJvWlFvemZScFB3YmJNd29yNzVxaGtm?=
 =?utf-8?B?djhlZ1FnaTZiWk56cFBWem5rejJ3eURtaUJlNGRKSVVUdUViM3BxdHpiNFJJ?=
 =?utf-8?B?aUFmbVJHL1h2aitRUEY1bWpSdDczZjFYZWEzWXZxT2NFUlUzU3llV0VDdS9C?=
 =?utf-8?B?MFA1NXF6enBrT0dsSVFTNUY1RE80cjgyb1JWNmYvYzlHOWQ4OThBai8wVndR?=
 =?utf-8?B?bVBob0NGemlPekZ0czBXSUU1UVlpNjg1TS9SYkszYjgrVGVWNDZ1eVJZR291?=
 =?utf-8?B?NEdwWUNSS042bkR3T0s0RHFESFlvVmdCUmhEcVFySC9MNTdsc0VqNDNvTytk?=
 =?utf-8?B?cFJJbm1oT0FaWE5QWDZMa3NTMjJ4T0h2NzFDMnF1djU0NkxITDhZZzIrajhQ?=
 =?utf-8?B?K0VTZmhrcDk4Ni9FRUpRVFBud3NjS3ltZUNpT1ZYSWZOVHdKM0JCQlJrckRN?=
 =?utf-8?B?aERIeUxtcVNjVSswQ29TN0VxUmFBbmczVjQ5TkxRaTNkQzE5THE4cjdBTGxw?=
 =?utf-8?B?OUdXSTZqSjBhdzFmc0VHYW02NWJFSXdmamIzdDFEOHU0eDBaR00rQ0Ruek1X?=
 =?utf-8?B?Rk5NRUQrU3NyWWZEQ0RSWVJVc2szaHJoOERFd09RL09QcXRUQVFKT0dia0dR?=
 =?utf-8?B?YVViMjZVcnpUTXB3em0vSHh3YnVNU3FUZVFLNVhOTEdzbTcwam1GY1NDT09S?=
 =?utf-8?B?YmhqencvMUQ5bmIxMUF6WjYweFYrSUdpN0NVTXZvaFkzbnBEcjdxTFRyV1ps?=
 =?utf-8?B?eVhRRFNBenNqdHNMTCtWNHA4QTdyZUQ0bSt6RXlrbEQzR0tReWRRTmdlRCtD?=
 =?utf-8?B?UjdHL0xDdnY1YUJ4Ym93N2lwS0ZOZStvb1RRZ2phalVOZmlRcTRCQmRrQm1W?=
 =?utf-8?B?eUw0U2k1OFhwNE5kZnltdnRCZ3NUZnRFQ0YrMHlDZVhZbVVuQlZZQ2hBNTQr?=
 =?utf-8?B?SkdhU3d2NGoyVUFvTzB5NEwyaEVkL2VoYWg1bUJOeC9sTG9lL2xucmZSSlhK?=
 =?utf-8?B?NktOeEM0cFVRUkJ0QXBiUjAyWlR0eXk5eUE5V0ZHelE1ZWFEdlgvRS8yR3Q5?=
 =?utf-8?B?SVZNTDJjSFNMK3F4WjBOcjdWdXNIUmRMOTNsbGtFRG9JcDNZTGxoQStxN0g3?=
 =?utf-8?B?dlY2M3ZmWWVCNEVncFJYZy9MUnNrYXU2T0FLdCtaMHV1VXo5Y01zUGhUM013?=
 =?utf-8?B?ZlZ0dDJKMllZaEkydlhWNGIrSldFT3VxMm5kVWp0ZkRUeVlaWnUrejFQd0Vy?=
 =?utf-8?B?MzdJYzg5Tkh6U2Z2dC9BZEZFZjdOK3ZHTDNiYXR6eG1URjRLczVvdjg2Q0p5?=
 =?utf-8?B?dkJVNTlCVmNoa2hydlBja3Y5NWlYeHBHdCthbTBwYnV3a1B5R0pDZDFZWWVt?=
 =?utf-8?B?cjVMSXlBamU1blFzMHlrUFFXb2JEMlFoYWVkVGFOYSsyVVNCZldBZEZ5WEJI?=
 =?utf-8?B?ZFJBK3A1Ti8xV3ZscmF6L2JjRWFRbmhoT0dnNkdyYjJyNkNxVXJMbWFjaTVw?=
 =?utf-8?B?VnpuTHVLYzZ5d0RjZWV5OVpjVWdpZlNyMHZSN2h1MFpOVUU2eElTSjBNa243?=
 =?utf-8?B?cUdWN0VhYTBLM2Uwb1pZUWpCK1BSNzhaMHpLbmN4WkMxRFpWU3R3cWd2V0Fx?=
 =?utf-8?Q?OyyfdUSzbvldBJxwksdH7Y/g9eiOUqFMi1VzJnP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57226bc9-281e-4506-13d6-08d98e1fcecd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:02:31.6791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2PhHOxui/X/a8Z8t7XbxX3Quxeedes4r9OR9rDYc8MZCk71cXCoMeOtl2xO9p8fXrSAjUHwv8Q83v5sxpVRbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4474
X-OriginatorOrg: citrix.com

On Tue, Oct 12, 2021 at 04:15:20PM +0000, Bertrand Marquis wrote:
> Hi Ian,
> 
> > On 12 Oct 2021, at 15:53, Ian Jackson <iwj@xenproject.org> wrote:
> > 
> > Bertrand Marquis writes ("Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not supported on ARM."):
> >> So there is no comment remaining on this patch ?
> > 
> > I have been following this thread.  I think I have a notion of why
> > this is needed but I'm not 100% clear on it.  The commit message says
> > this:
> > 
> >> ARM architecture does not implement I/O ports. Ignore this call on ARM
> >> to avoid the overhead of making a hypercall just for Xen to return
> >> -ENOSYS.
> > 
> > which implies it's a performance improvement.  But the change also
> > suppresses an error return, so this commit message is false.  I think
> > that the thread has concluded something different, but it should be
> > explained in the commit message.  The purpose of a commit message is
> > precisely to capture the kind of considerations and discussion that
> > occurred in this thread.
> 
> I can add something in the commit message about the fact that we improve
> performance and prevent to do a call that is and will not be supported in Xen.

IMO it would be good to modify the commit message so it covers the
fact that the emulated host bridge on Arm does not advertise IO port
support, so the guest is capable of realizing IO BARs are not
supported.

Otherwise it seems like the toolstack is ignoring a failure which
could cause a device to malfunction when passed though (which is still
the case, but the guest will be able to notice).

Thanks, Roger.

