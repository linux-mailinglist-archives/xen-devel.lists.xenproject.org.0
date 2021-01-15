Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BB2F7F95
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68345.122368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0R4I-00036P-2l; Fri, 15 Jan 2021 15:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68345.122368; Fri, 15 Jan 2021 15:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0R4H-000360-Vj; Fri, 15 Jan 2021 15:31:17 +0000
Received: by outflank-mailman (input) for mailman id 68345;
 Fri, 15 Jan 2021 15:31:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0R4G-00035l-H3
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:31:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26e85cd3-8cb2-4e80-9af7-924e654279b8;
 Fri, 15 Jan 2021 15:31:15 +0000 (UTC)
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
X-Inumbo-ID: 26e85cd3-8cb2-4e80-9af7-924e654279b8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610724675;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fm8IXTC510ZXLiRlo759ZIOOLAfU7w/lim1UBHa8BL4=;
  b=aM/ETCenSpPP4uh6P6riLdItq5KBehuTY0Hb6jMK04gFvlCe6QIvk5Sp
   OQVE1XrYi3Z2+Wuy/96KNtjVhT6nFYIfgwgd79LHkhyWFH5hbtpDJvweK
   FKRkyqtPrf6KJ8cIN0GlDVAtTOHhC8mcXNm0L3mpKscc1apFmyYcJW5Y3
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: E2/2bRBzbNeXEEakv6Rk/8iHul1iGJ1BCAwgcWSEuPO8dQ9u3LA9x+VXiYfCgRjQZYTVIl6bmp
 nnsX1a1jc/FL9qdF3tSKKU9n3jhXuZQOB3YibS7rcefQtP1d4r/Z+/YeC5U5rK00rqIz/rawlK
 a2J/zuzGGB7HIgv/Ivjxp5MroSOM/c2CbJATi8CXCmtEzIEILfaV+DXOJLKso4mNPSdX5V+qK9
 8F3M6v1nCEs9dr/kSfk150EzW5oGvalIPtHfT25WQbIcWd4OWSaBuoWwHT0xxsgpPAsRIivICM
 dZw=
X-SBRS: 5.2
X-MesageID: 35226881
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35226881"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMDhG9njnyfqekUC7DNbkb27mJ2afWMYAe2j+6lgSOqPSTmXucsO7DFETS+YYCYWyMds4Syw9oyzqLLPYapkg2oOPR//wAAQIpwJbK+ETovm+xEobV1ztQtcB/QclF9raMtL+DRoxs1F+yeFjbwiS1f8pFkTzWr8Z6kgQZeCN/K5DRnVFzRbx4W6O2Pi/zYr475G8xo8w3seUGpyIo4VPHdWv6cR4DMnqfoIGpQLTYYmpWBtVa97JkGkp8KpT82kBz/CHRaNbrsBKlCpFPoF/aiLnb+9PTtTrADC/KL1Xgr/lvbBmWp1+MarH0/zHZJbKf67HhZHdgG4jXyS84n2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=349bIKAKiKDbP+D/TkBubb7YAMccPIsquDH/M9ZVHzI=;
 b=ZzUJngPhYs5+/Xy67QljtjzchmYEGt7QUNNjp5AQjiy1EXrfe7OK27tk+9oy9vrbKq0dawEQTX+i+QEA80iZtaejaHIjip56sUp+aHULIKwDysejPOoT0eqrIl0OQroNbs221ZMjJwD+xFc3X85qoTfMPuFGLmHj7ES2qqggjXm2ldtjw/xaMA0DEt4FVKzvxf4Of9psQOtydFLoOV0Ndl76G8J9GKt/wyzWlUfzNyucekZ5AIH4oK91UQ26ZKMxRQGW3QchcVHwGP2csd7ek9hvixe3lcbf2zkWhTDbEkeqx9nMOYEh4tyiWsZC1H6WnIH8kTL1LnF67+TE1EVN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=349bIKAKiKDbP+D/TkBubb7YAMccPIsquDH/M9ZVHzI=;
 b=FSanEoZkFq47h2zt+e8App4QBRrNCUvELtlHvhq85waiTEfabOqWGPcQ2YHyApYTG+djuV0Ww7QUDNdxtRHxDUYNoBWPhW2yHwBymbAIOSZ2blmpkOuOp3kcgbfJnR7E40ENN8Z1QXlnPdXErMPQP6fv6EMNFnGxutJt7hg56DU=
Date: Fri, 15 Jan 2021 16:31:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD: remove xenbackendd
Message-ID: <20210115153105.nuqikbadcb2q6ic5@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-6-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-6-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::30)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ab877b7-dc1f-4f0b-7b8e-08d8b96a95d9
X-MS-TrafficTypeDiagnostic: DM5PR03MB2716:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2716D9A03661A7EE54D0A8748FA70@DM5PR03MB2716.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FkieGKWCZ+uBM7k6Ax07X79oQmKk7tt7/zPX7AK0l/Y3obcegBooho+3hT0w7kpCuwvQWndPB9sVS2J8ZXDdEeAgu21O62u5wVe/B0mJRYGPuOOmPuwCzz20RGruJduh73RS/wY6iflDH86PRmGQ0LwVS8CZf7BOlpH0cAMo4E96IvVYkx+pfmZ0KSb3VrxhyD3dRXb5bKeSofg0OiNVFm4NBiCm+M19XRAdM5f0/z/iZ8P5rdwX6SiO9B4X4562xtbVcZCSonSJGAqNAOjAbYIFPk6Lhu5L/gj5Nqap9BwGxTqr3+kJxFNEIVr9A57ZnCLZXgwwLRt85HIZOBmWqkY/TbeeVcMdVSu/BsX9h2dQgl2lv5murEtzuA3z6TyHxsowgae84TFcX1s3ddlvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(346002)(396003)(136003)(366004)(376002)(33716001)(6666004)(26005)(66556008)(66476007)(5660300002)(66946007)(1076003)(186003)(6496006)(478600001)(956004)(54906003)(6916009)(9686003)(86362001)(85182001)(6486002)(2906002)(16526019)(316002)(4744005)(4326008)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YlU1QVN1emxtOUkxR1pjZXZMS1M2S29BK2IzMWdOVDQwTWcvekdIam81eDk5?=
 =?utf-8?B?ZG9oek1tQnpaenZ6M0lFb2YxMXFJdE4rT2VzdE4xUFowKzI4ekszU3R6aTd0?=
 =?utf-8?B?WFRIS0ZjYnVZcDEzRU9ydWhyMWtIZzI3cDg5T1daSzBnUWI1Y1FZcEJ3N29Z?=
 =?utf-8?B?elFSSldhNUlJTHlzR0QrN2VVZXdMTkN4anVjZElBak9reGp1eS82dkZWTHAx?=
 =?utf-8?B?VWFSdFpaaithZG5jTnllSmoxZ2lEY2ZKRmppeng5Skg4RDNXejlubVpTZjNv?=
 =?utf-8?B?SjVyeXI2RlJxQ09XYWQwSDRzeXVqa0h1R3RYUWVxYnROSnlmMHN6VGhEbnhq?=
 =?utf-8?B?WTEyVXJvSFBGSUs1VDM2WmQ4WllrWUNkdHpPa2RGM01qRUZwa01Mb0srbzRC?=
 =?utf-8?B?TThpSVhSSEhLOWNwa3gwOXkxbmF5M1dCeitWQUllUlMyYTcrVEdsVzBoWUQw?=
 =?utf-8?B?Y1daeDRmK3kzZWFRM3BLbFZ6ckhDNkZzd25zMjNGNHI1N3pqRWtEMTlZMVdH?=
 =?utf-8?B?cXdHbXJFdTVqUnVMYy9QQ0kxYVc5WENYMU4rT0RwWmRqVXV1V2M5UEdKQ25i?=
 =?utf-8?B?TURNQWxRREtseEFWZjlEc2ltdGhGUGgzeS9SdGpJWFZuMHFIbnFUS3EzVkhS?=
 =?utf-8?B?UGVRK0xSUjVQbml4dThMaUZxZTMzR1R3ck9yOGdIaU0vTFQ5YkVtTHkzV1p5?=
 =?utf-8?B?SWFlakFZbkx2T0lpbTJibkJYcGNjVFBGNzNBdXkxVFhxQk1iai9mZGNjaXFR?=
 =?utf-8?B?akdHTmtQU2xMS3F2cjFMbWwxaUlEbExkelR1R3lLRGR2Yk80cHFCendwZmJ0?=
 =?utf-8?B?QUM4QmJUMXplUXFiVXV5bVNxOGNpclBHWHk2ekR6b1ByRXFhWDhnWE1ZUm1z?=
 =?utf-8?B?dHV3Q1Nja0M3dG9YcGd1dWs4dlJQZEZrWXo5bVJiTVdGVE5PZFJFUExhcUo1?=
 =?utf-8?B?cCtmUzM1M3owN1ByMzhHZGlWRkQrYkViUEhwU3ZiK1BlczhNZjRWQjZQRkNN?=
 =?utf-8?B?ZnNCcTA4bFloeUtYN29FNHdjdHdPTmV0bHpReG1PNDI0M1RESWdPVEErcmg5?=
 =?utf-8?B?OWtlMlJzSVFMcklVd2ZnU0Z1L25aVDE4d3B4U2NIc2NWV1JmK3FJanZ1MnZ4?=
 =?utf-8?B?Z1A3SWRkLzZWODl6NDhyYWphY3lHM0x3WVYwVnN6K3VUWCtZcDZHZG94SjZn?=
 =?utf-8?B?b1c3Q3VrK0pzNWVKQzBDN3FrblhOS3lFbFNXRXZmNkkrMmF0ZHphdG9jMkdh?=
 =?utf-8?B?bGVvWnU3YTFtWnN6akZ2bmJOR09zb2RPaGlGQ3Bhb3FkN0RiWkhOemJ0Y0lk?=
 =?utf-8?Q?1BiXVR1MBROW78PNYhp+CCpMTbBFPVt73n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab877b7-dc1f-4f0b-7b8e-08d8b96a95d9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 15:31:10.5840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRn78OHJ1rAppamlOAUJ6UqN0tdxOj+aPN6bSUbDCh0/F07KNq8pIe6hKN5cRogFsWX6Te+h8vUuCXcd7ARZCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2716
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:26PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> NetBSD doens't need xenbackendd with xl toolstack so don't build it.
> Remove now unused xenbackendd directory/files.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

