Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40794A9AD8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265627.459042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzQt-0000wi-Us; Fri, 04 Feb 2022 14:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265627.459042; Fri, 04 Feb 2022 14:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzQt-0000ut-Ri; Fri, 04 Feb 2022 14:19:27 +0000
Received: by outflank-mailman (input) for mailman id 265627;
 Fri, 04 Feb 2022 14:19:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ws=ST=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFzQs-0000un-J0
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:19:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72bf851f-85c5-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 15:19:24 +0100 (CET)
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
X-Inumbo-ID: 72bf851f-85c5-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643984364;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+mvk/5f3TYLE0J8IBUrwlOLYKW0t+D0F6uL7TQtujAU=;
  b=UMIlC2XnK6BDDzWM8AY2LjdZdO6GP8MtlVj9eICqvh1DvlobmKt2rtpT
   zrbLALABuStROSV7srMOuPT87MRS/FvdkS9HED90hHoj9Asnav9TRUcr2
   EDOY2zhCwb7OP8NfOnIfkSSuxSgi830yeCITNKqBIxQpsdgnLdJfscK7o
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: it6+N39jIf7n0C1I+1zEjZ7XzBp0Fo5+6Cf6daT+gzttYj+NfZ3TEsK92RWYPVDFx5KwS8avDO
 n7Et0uS2ExGbDt2RnaFqQaCYfbrirQWsKTiuL72RHDctfcAay1J3azAh0NjzYT6HlNRvoILpXD
 UzDftRvyuM0VQu7w3x7FDsUIrcRybhJBOKG/wJW83fT3si9Kc+QskLhzKGSRZM0wnuxGjvjHqA
 fkZXrNBQ3Gdm50DnDdvucy2xmYsDtp/RFDbXf1wBFfAkFIx7LAkrc9GAXGSVbVjNenVWFdkVlz
 ZQdeUbuahlopj8x6BoxJMr/Q
X-SBRS: 5.1
X-MesageID: 62964726
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZpjQ/KlVTWhxm5Fu7aQVis3o5gx+IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLDG6HO66MN2L0ctsjPo60ph8EvZLdn4BjTwNqry81EiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NY02YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MpvpKa3Qx44BaTRv8hMVhcINQRlEaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glq154SQqyAD
 yYfQT1VTSTvXRtGARAwNpNurLerl3r/MDIN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77nMXIA0bUx28u/bRoke7UIMBA
 1cO8SRoq6UunGSpRNTgWxyzoFafowURHdFXFoUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSICy
 X2YpdTjHC1UuaCyZSOY+OeyiCieNn1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G7T8nVn71kHpYtSjvjgowib6965jsWRFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTQGI3h/5nzvp5p1QEwZ3Y1RPHNEBz2oxaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZhxnfO9S4m0Da+PBjarXnSXXFXclM2JTRXIt10BbWB2yf1vU
 XtlWZrE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 oYOX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6SAnOp8K9E5xPk9eyWh1
 ijVZ3K0AWHX3BXvAQ6LdmpiePXoW5N+pmg8JisiIRCj3H1LXGplxP13m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:930SM6xVsIgFBbPCwDvsKrPxtOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="62964726"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyfbEr4/v93385gLdoviaur/J0ELbeNQJOJFmgwOzgbafVF5LSOySyuyGw62RbSugurFEK7vPLKGsHONHu+ip2/OnnFeSTwT5SWCwpEmww1sFyr+I/D2/xIQH0c50u5dhHXevtJGxp/MrHtofg4PE12SUA7zlN3MaEpRDQSFAmAAIHa0vWmP649WKxn1SHGRIXxzv+fV+dgAKIEqPaZPVTkqjrnXeuVB1pB0Du9bvNVCCa6pQAdLou82b+hyPRgAWFYF60d9tMrqL49OVsH4xmZghwRnO/W/MztxR5FLdyZQnw5yGNKCxCODaFQh4+ekmzvW+9UM9Mk+g38CW6YqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNtyWrjlNOFS1xI2PYkTtYJcph77hlzF9GI9yRvXujE=;
 b=gAeLlkpH3h7jD8RywDByidCrmP1y2oiB4HEJZal0zSotcEasadkHzd3k5j62ioGO0f8V1SVETKTlrnjWk5K/scMwOezv3QGCoJo9G+5VDLLU0PoXMXrOnlIrb/waQaDUpJ7zT8X0W+fkV+f6wMH/ODIoUsKLgddoUNgZVg8C4I/nSsii2A/DgChfm99Sojq68vABRx83P76qk2lJZUqQD6z9tLB4rsTuI9Z8Wgb4wQ/G3cFaaLjlmOfha/pxWhO/b7eXTqjuldjoC+ErwEWtjNxJ22ADjS7HYxzMgngjA1vRniturBi6UfD/VeGDn0/Dc5YTaZF2g80RZ9atH+Q17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNtyWrjlNOFS1xI2PYkTtYJcph77hlzF9GI9yRvXujE=;
 b=kP8gRNMRSYkZ2xoSYr3qcpDfqbuixLDF8XWE3NV1ITyxE4GswlgpoPJTIm4GQVdivr2IwaCE80+gFSToKyNED9vZKJ54BFN76oWW/uVJYykxL/cr60t+h4RX1Aolq976iv+dV+nI53mB61hL1GD1/Lvcuw5643wGF4Dx8R9cT3g=
Date: Fri, 4 Feb 2022 15:19:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
Message-ID: <Yf014MB3PvkQmVG1@Air-de-Roger>
References: <20220203181023.1554-1-andrew.cooper3@citrix.com>
 <53b98995-8cef-48b4-7728-3bfbc236af5f@suse.com>
 <f2ce80ee-f30c-dc6f-e4b7-5d8eddb5b3d5@citrix.com>
 <1333696d-d3c2-15a8-1dd5-7cb0a17ef023@suse.com>
 <a28ff9e8-c022-6384-ee04-c21b69a4fdd2@citrix.com>
 <eb818153-3ada-ac46-fb14-da975a61574f@suse.com>
 <1905e626-da65-0541-802e-34e5d06bc1dc@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1905e626-da65-0541-802e-34e5d06bc1dc@srcf.net>
X-ClientProxiedBy: LO2P265CA0045.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6944deba-5476-4a3f-fe7e-08d9e7e95549
X-MS-TrafficTypeDiagnostic: DM5PR03MB3290:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB3290B9F05553C2F465E31BFB8F299@DM5PR03MB3290.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LfvjzAh6j8BTOQ1hnb3yfK7LJusorcp7hFtypR8yzOJwZxNpyr8bLvQM1p7cAVRZAWHzY6XxoMqz4Aju0rvSkIB6O1ucD7pIkjcyVQKtb3hc+o+QiRSDOhUL8QV1+sg0e4mUW12CSncdXO8yTYJNim/IK5aS8EriulS0LQ0kw30eiFtMXNdcKQ+nxlWLuXApV5Jc8XK2CnE8TWdWXI47FesvIo8aL/GM4jcT+JEAzlr0QSGVN0B2M4xId3uaTgP3bk8TRZsZc9pON196k8ftaIZ4gaKUxldWwy0zoSRq3lNBOQFgTnQH6oNwqJF9AymBcZnLpdBilf/FRhDx+EGm9xNh3rwBqbn8ViZtCaUioVf8VmhzhMk9wCzB2GJTiOhfUmUmaw8SUWbE1A+l3vOwmldI5Jq2p6cVFL8orIqg0vHtdZqNrJSEA069cKBwKs4XrPcpHcy4jo24rsEPQf6RT905GpQTYqGfXUDfmkKq98dAh07JNHwsh2CbsGIUMkP5OXPmEFrWi75kDVPNcTf6/tW44Go+Ivhl1YwRh849wpaQeB/PrFLv6Wcw/IDUCdGhwY3msvRqpTHWSyyELepTwoNC2fkRxmZ4SlJHu6Pcc/yLgxS4Dg1OXmzSBOmRZj3lGRyK3kQdzXYxWt2uigxsaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(86362001)(83380400001)(33716001)(5660300002)(85182001)(82960400001)(6512007)(66556008)(8676002)(66476007)(186003)(66946007)(38100700002)(26005)(4326008)(6666004)(54906003)(6486002)(53546011)(2906002)(8936002)(316002)(9686003)(6506007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVpEUEJtUS9US01pdVpLOXRPYkNVNFNwVUZCVlFBdXExWXdjd2F5NHhwNGFO?=
 =?utf-8?B?WWxSdWM0bWtpVUtJQ3FjNzRITWg0dFhNRHU3aXBIeTZyRm5rbHpUc3YvTi9n?=
 =?utf-8?B?SmtEL2RpclZhbXUzYlBoQkxHVFpTN2tKUS9HdTRJQkpTeDd1Ym5VTW40YVNS?=
 =?utf-8?B?REdKNmQvd3ROOUNXTUNVMStlVWF0Mi95dm1EZzR1cFZuRVRWOEJ2bERtVzlo?=
 =?utf-8?B?ckpPcEE4TFprQ0J5UzJCWVE2RzRmTTNOOFdPaDM0ZkZKbXZ0SnBKRVNmWW5m?=
 =?utf-8?B?YlV1dXJKRlk4R21BaHJ2cmxmTGtlRk0wM3N2OU5xQkxCVDNsQ1l1ZVYvNHRp?=
 =?utf-8?B?WSsrU0VVbkx5cnhRYmZTQ2o5UUNjcTNuT1U3bXZKTFFQNWQ4L2pQNjNJQWtt?=
 =?utf-8?B?akJUVjlhT0h1bm1MUXBMOHFRZkJpdVhJOHVpQ3JtTmFYQThiRUFvSWJqSUNo?=
 =?utf-8?B?WEJvVFNOOHIwdUdFVG9hdUR1T0xwK0w0Mk90S1h3Z09HOUtDMHN3SGwzekdt?=
 =?utf-8?B?VzVQNHN5L1VHdmYwQWdhVWhOMjVSVkZUOFFxTzZoOUYwVGR1TmRDVWpOQVc2?=
 =?utf-8?B?cmhHRjA4WjlKN3VXTnBad1U0RDJ4dHNTeC9vdnp4bGZWb0xtSFRCTWxRWU9C?=
 =?utf-8?B?aEFsMWhZQmMrRHVRYThFM0lraDlxdEszSkl3Z1hDMEVpbjQ5WENZaW9ZTUNC?=
 =?utf-8?B?R2t3ZEE0emNGd09CbUNNYytuWHAzZXErV2JMYzZxanRkQ01QdnFmNnZDdW1F?=
 =?utf-8?B?NDZ6UWtmUUhONWRIYnJwdXQ5N2paakhMRHBpQ0F4ZUtjTjBLTDdyOUxDN1l5?=
 =?utf-8?B?MFBWMVZqRkk2OUU0QTFIK1RCVkc5a3hDZzlDeXVOYmp1cWVVb2hMbUhGa1FP?=
 =?utf-8?B?OTZKanljR1NoeHQxV3FXSXZ1WVIwSXBORUpjL3lSMG05UGtTMi94czJ4cEQy?=
 =?utf-8?B?Zm5Gd3c5MlpSR3gzRmRKRUZaemh3dVYyam92Z0k0ZEp6bUh2cU1iNk4yZmJN?=
 =?utf-8?B?Y0RMRW1DQWppV2c0OFl4anRYS2RQeGRrdWlPUUxuTEVPKytpYVVnM2VtK29z?=
 =?utf-8?B?MmQ1UXREZ0JDWTVmY2hqVnVzMGZkTnlMamU0bFVUWmxsR3BHL3Y1dkhwaXNp?=
 =?utf-8?B?U01NZHNaSXo1WnRBMCthTm8rRy9sc2pSS1NTdHZSbURmZjFmdEhQdW8yeGdQ?=
 =?utf-8?B?T3p2TlRtYXJseXVKUXFyTWJVUGhHQUQ5ejc1a0I4em5uVVowZGI1MElLbDlG?=
 =?utf-8?B?c0tFSE9HMTJyYi9EZVRYTHkwNjdtOEFxbjdCcnhmcUFSb3N3OTNOT1JsQlZQ?=
 =?utf-8?B?ZGFXTGZ4VTh0aVdQLzl6ZTNRVXZTVmF3d29GOFZadmNZanZIdlVHbXEzVVZq?=
 =?utf-8?B?RG1zUEFUbzFUZ0c2OTVGUUJWazgyaFA5NHNTa2kyck1hZzVuV2VOenlhQnRB?=
 =?utf-8?B?MGlCOUEzU0dEQklVKzNXWkJWTjlkc3ZYVDMwOGJJZm1VNjd6YTl3eGdFL1Bv?=
 =?utf-8?B?eGJqRmZJWGo4QzV6V1ljM1BFVFBjai9QUUxLdEkwYTdGdjJJUXhTS095ZnFs?=
 =?utf-8?B?UW1UU0d3WXlGdmZsZWthZEc4bW5xRlE2WnJPdi9PcXZqWlg1ZE1JYU45dUkr?=
 =?utf-8?B?MlYvWjhEd0pmcVRYNW5nNXpYVHdZemc4cTdTM3V6bmw1bGpob1R3dlk5a0RG?=
 =?utf-8?B?VSsxOTJVU0Y2QjBNTHFCaUM5TFBPRXNJOVAvMitUK1VyZDhHejNvYTBJN1FS?=
 =?utf-8?B?TUtPMmZlVGFEWGV3VFVGTWNxNEM2TTJEUUh6UE5LRTlKc3RMUnNpR3ZGVWVV?=
 =?utf-8?B?Wjd6K1AyOXYxVlg2YjdVc3Ira0cySjZTZTI5a3pIRzVobm9ZTzZ6TmlnZGo2?=
 =?utf-8?B?NmRsalJzVFluTHV3RTRkazRaQnVFNDZKeHF1NWlaMEhsWTZFcXJBS29hZ0tX?=
 =?utf-8?B?UWEzSmJQVTIraFUydFlzZnRzUWFuS0dVT0dLUFU1bmpyMGMzQ1pqQzBrRXNY?=
 =?utf-8?B?YjlCVUlqWE1yYi9kY095YmRiZ1pFQTlMLzR5L3lHUjZ1bzNCTUdqc1FBTmFL?=
 =?utf-8?B?bi9IbU9RSnZvUS84Q1NWYkhpOGswMjBLZ0wyQ1V1NDQrbWtYeVhYRmRrV3g5?=
 =?utf-8?B?RGFheHc5U1RXZmFmRjBlYnFZczVEZE4ySGs2VVJwbTlna08xVkk1MzE4S2Jp?=
 =?utf-8?Q?zDSx08YIjhusctBTo1Ag7cY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6944deba-5476-4a3f-fe7e-08d9e7e95549
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 14:19:19.6600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiIpQaP8XRhfj6H8nmCKIJcPBLHDh8vUCfQoJzt0eeYvuWaoPT4rxvajza9CQVpGTSoPGoHpefNZk1mSCyQeQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3290
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 02:10:03PM +0000, Andrew Cooper wrote:
> On 04/02/2022 13:46, Jan Beulich wrote:
> > On 04.02.2022 14:34, Andrew Cooper wrote:
> >> On 04/02/2022 13:09, Jan Beulich wrote:
> >>> On 04.02.2022 13:12, Andrew Cooper wrote:
> >>>> On 04/02/2022 08:31, Jan Beulich wrote:
> >>>>> On 03.02.2022 19:10, Andrew Cooper wrote:
> >>>>>> It was Xen 4.14 where CPUID data was added to the migration stream, and 4.13
> >>>>>> that we need to worry about with regards to compatibility.  Xen 4.12 isn't
> >>>>>> relevant.
> >>>>>>
> >>>>>> Expand and correct the commentary.
> >>>>>>
> >>>>>> Fixes: 111c8c33a8a1 ("x86/cpuid: do not expand max leaves on restore")
> >>>>> But doesn't this commit amend 685e922d6f30 ("tools/libxc: Rework
> >>>>> xc_cpuid_apply_policy() to use {get,set}_cpu_policy()"), which is
> >>>>> where DEF_MAX_* disappeared?
> >>>> No. All that happened in that change was that we switched to using
> >>>>
> >>>> cpuid.h:89:#define CPUID_GUEST_NR_EXTD_AMD
> >>>>
> >>>> instead, which remained the same size until Xen 4.15 when e9b4fe26364
> >>>> bumped it.
> >>> Oh, right. I did try to look for a replacement, but managed to miss
> >>> this. But then, as much as 4.12 isn't relevant, isn't it the case
> >>> that the fact that CPUID data was added to the stream in 4.14 isn't
> >>> relevant here either, and it's instead the bumping in 4.15 which is?
> >> The fact that the bump happened is relevant, by virtue of the fact there
> >> logic added to cope.  The fact it was in 4.15 is not relevant - this
> >> isn't a list of every ABI-relevant change.
> >>
> >> CPUID data being added to the stream is critically important, because
> >> that's the point after which we never enter this compatibility path.
> > If the bump happened before CPUID data was added to the stream, logic to
> > cope with migrating-in guests would have been required too, wouldn't it.
> 
> Yes, it would have been.
> 
> It wasn't an accident that none of the max leaves changed while doing
> the Xen CPUID work.
> 
> We're unfortunately a long way behind on Intel CPUID leaves, but all(?)
> of the new leaves need more complicated migration safely logic than the
> toolstack currently knows how to do.
> 
> > But anyway, just to be done with this:
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.

Will rebase my CPUID series on top of this, but I will wait for
further comments before sending a new version.

Roger.

