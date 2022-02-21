Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF14BD920
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276074.472122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM655-0003UM-4q; Mon, 21 Feb 2022 10:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276074.472122; Mon, 21 Feb 2022 10:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM655-0003SW-1Z; Mon, 21 Feb 2022 10:38:11 +0000
Received: by outflank-mailman (input) for mailman id 276074;
 Mon, 21 Feb 2022 10:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vyL6=TE=citrix.com=prvs=04447c275=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nM653-0003SP-LB
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:38:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b25f681-9302-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 11:38:08 +0100 (CET)
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
X-Inumbo-ID: 5b25f681-9302-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645439888;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CmkBH10/xbV22qlXlAqN+ydnsL1j5/GBZV3vOSJT7po=;
  b=IJDoy/ieO1dGvPUZcirpbQ5mzNw5HzSa4ehCkUy+xNiGKQpcCtkBhaY/
   aKT0ZcUZLW2JBhpA5SF/i6CNWELrwtjId9o0jAOe2Ul3O8xakf1qtJ+Sq
   Usp9Ovzaor008Kb5xqDPKGVvXFvGg86yeKjU5vXWbGzo/nZLcHVDVhmoI
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65043832
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tEO5FqIhtCmSzYEvFE+Rs5UlxSXFcZb7ZxGr2PjKsXjdYENShjAOz
 jAZDTuFOqnZNmWjc9tyaty+pBtXvpbTytNiGQNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NQx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PZOi8GCFTsABZLjpMQfTztZCnk5J6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glt3pwVTa2ED
 yYfQSVeYVOaTwRQBgs8KrRltqSMhz79ejIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7tIjhguiBthUTufhsKc33hvDnQT/FSH6S3OYosfkuBKCculgB
 HA0+DYMrLFqs1akG4yVswKDnFaIuRsVWtx1GuI86R2Qxqe83zt1FlToXRYaNoV46ZZeqSgCk
 wbQwoi3XWAHXKi9FCrFnop4uw9eLsT8wYUqQSYfBTUI7ND4yG3YpkKeF40zeEJZYzCcJN0R/
 9xohHVk71nwpZRSv0lewbwgq2jxzqUltiZvum3qspuNt2uVnrKNaY2y8kT85v1dNoufRVTpl
 CFax5XFvLxfUMDQzn3lrAAx8FaBvavtDdEhqQQ3Q8lJG8qFoBZPgry8EBkhfRw0Y67oiBfiY
 VPJuBM52XOgFCDCUEODWKroU55C5fG5TbzND6mIBvITMskZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKp3yZZvbYIw6pAeLqxA1i+FznXlmnTuJLX05pjz+uYejiLeuYe5tGHOFb/wj7bPCpwPQ8
 t1FMNCNxQkZW+r7ChQ7O6ZJRbzWBRDX3azLlvE=
IronPort-HdrOrdr: A9a23:kwNzJaM6gQZB7MBcTyX155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9ZVfYF1P7wrhJ1GdZI8qOuMeyXwqEH3QSqvyWqOLtByB5uKke+x3IkI
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="65043832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmZTT3ll9Wof7104WfTTZr27YgMMVBE9CYnZGWjQ5W4LCiCA8hSrueot7dLUNrzEIKEvG8kgC0CcCKqomqbxoT3fATvqBNaeScUMbC6rg5JBJkkmP0htEeW5wCMzFXkUjsgKx7YbLnTbjsS0n0A6pjnHRqRvaW4dmlGGO6i2dFrKV0DaU8JDHPYwlLuGor5zjZFA5mivZbBRdq5T53Ch58a2Xfa4nryanRLxDErmP2kdrTaFl3O0YeGVcLamEogVMmmA8vLDEEPhnBEIpmvfp6wEHWQV65BUDfraOLxIrCeVPZ3lSfF6FoZuY0DKS13NuMjhbdyC9brb8x4x+vt4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXqOQDBG0IhVUdxCG71KSOtrHMM7QX77cQFq/Ygmw94=;
 b=FKdZu2EDXdWTa0BuwCKjRNeAuAG3NoiCVstNJNBNJUmv0Ry00xs3lDY0vkMC+yxl5zY2KwZahKkFydg1sb8qEnC4EjpQkjNJp7r1lz8n8xsX3SFxfVS92wsi+SpZz/rwRE9FgJW5SrzST2geSEylssnyBBL0aYvwaacPUy0PejEq/5qYxQSSqT/odd2wTXMwMDYNyAzrueZZXKeAJlycIQBltDsfQo7/qxcmxrVxlSGSUisgUVC7YEdaLD0ei9JvPmenrpgI6ptFrqBOqQozUEL702Me8qj79mw1JK/wP4XNzoDQhEau44uc1HUTL2tnZ2WOjqCJF5xQCPXtHjWbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXqOQDBG0IhVUdxCG71KSOtrHMM7QX77cQFq/Ygmw94=;
 b=GobSDMsyEbZusFdLvTGlTc7GuCf5c915UVmeuQbEhEYL+zN3swWIdRI01E8gj36lmYmNvLpHaaBQ6Ruh3Q6AFYGizAXor6Oe0EqSIO5C+CX3Wf80DOuPED8Z5bCBaCCdrEHg+SpCXYYSTxVgF2Wc6cxi+sdKbz8pUkF67fVyRTY=
Date: Mon, 21 Feb 2022 11:37:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] CI: Coverity tweaks
Message-ID: <YhNrhuvBbZ43hcA6@Air-de-Roger>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
 <20220221100254.13661-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221100254.13661-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0208.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcb0ba0a-c05f-479e-f1d2-08d9f5263ca3
X-MS-TrafficTypeDiagnostic: DM6PR03MB3945:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB3945500D4A96FAC8B5CA54E48F3A9@DM6PR03MB3945.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UPCMwgAsl/PvTOdQUjNHqBoEJM69lOYhNB+r3OFlr+I5ZW6wnnGphkux71OHBi62dQ9ViIV1Ma4pIHkPYjwlideUcpwohCi6TN/oV+8S7kbz2JwCxXRShUSWSfWdDvNTpeWl3lHXb2qX2MN2E2vc0PjXbH0fIiM/A9q2dkg9tFyR7AG6kPNGdzpUepmY/1r4MgxU8ZOSWfcOLB/57qmQFHFyZbT8bmIJWaVrxG8EjdXriIYQgcYuivjdDDo3FwPNFcQIWEx7TVvyRFnmlTGRea4jKBIwW+SLeyAna23p1DaZA7xacP0W1gUF94pyPJ4lOmE0lPoum+4SHqxAgdzbGIwgabjQEwDkm+d/GG+7lQcPYhUIxgNzU7R7xrwwZCPOUklnRJCZHJqMaeLJruqPbruo8Rk25AYaxCiUFjH7S1QUeVE3/g0QDEeORmOjOltLz3v+viGJtqrc7SiZiT5A0ByanbwMu/02zTkgPLJOO0QPh9z6CqaZJnwqw9t4k/lTsYCVkQx9EzAnQGRTA9EF7z/oytRTQRMrHGXa9FF54NV1A0pgXLDnOFrv9AqGu4oQC05/EtHW3cWjmjbgiH7cWolJjxyuk1FQNSa5Tj1CiupWzeXlpi55JrzYOk3VIlgrzuJvqRPvfb2Ji3bzfYOKTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(9686003)(6666004)(6506007)(66556008)(6512007)(5660300002)(4326008)(6862004)(26005)(316002)(508600001)(85182001)(66946007)(66476007)(6486002)(6636002)(83380400001)(186003)(8676002)(8936002)(33716001)(38100700002)(82960400001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVRiR2ZsV1hTQ3draWVsNGxaMmFURnJ4QTNQdXdSNEU0dDR5c2FrSlhjcE1u?=
 =?utf-8?B?UXk0RGpmUHFyMk9SRXhSUXdJbkh6TDZlKzJZd2s5TjlLaFhoTlFzRjJZQ2FE?=
 =?utf-8?B?STgveHRZK2IzY2hmZW1zeEJIOWNwOE0rbnNLcUpTMzdjYk0rYll6QStGalRI?=
 =?utf-8?B?YjBlcExlK21JWjFpcU5TZmFMYjFkUWdPODhSM2U2amRaZThzREUzeTFwMEpD?=
 =?utf-8?B?RmtxRXVqWTREeWFoank4MHNpd1VjYzdZZ2svNitIMVk3d0JDRFdnV0dmQW5q?=
 =?utf-8?B?Y0lHUkF6SVRXa3Q2Mk1RaWlYbGJuWGFRaGREdjBRMXNaWGcxTE5xYWNsNE12?=
 =?utf-8?B?WWZnUUxsNDN3c0M4WHNqS1p0bGg3ejIrK0RkYnlLOStOOVJhUkdMaFhNV3VL?=
 =?utf-8?B?K1RPWVBqUnBjLzdxN3A3SUE0VTZwR3RUbWlOU2NrdGtZNU5TdWdPbkVndWZO?=
 =?utf-8?B?ZDV5ZEFPaTBJd3dGZ3Z4dXlKWWNBd29yL3h3V0p5cUJEOUc4UW95V3hTeFJ4?=
 =?utf-8?B?eVJ5cm9TaURULzRyVm51Z2RWdVRreDhRSWk1aGFOcjl3ZGMxbTZUei9HeU1a?=
 =?utf-8?B?RTRjUE1aUEJPTlFXSTdWZnpySllCTVJqQTdJKy9sUkxvSkdwTXF4Q25WMHlX?=
 =?utf-8?B?amdFS2lNN0FBamtlVjM4THRtQzVGbjEzWVAvTkpsdUxpWXZRUzJEWmQvYXQ5?=
 =?utf-8?B?OWhlaG9FbS96ekYvQmhsanBibXQvMUU4SlpCbUxGR1FhVGJPZlkrMldjQjVY?=
 =?utf-8?B?b1BCUEd2cjRuNmsrblNKREdTMS9HemlJZU9QSmQveENKNGxoeVh2bjFOWUlX?=
 =?utf-8?B?SDk1TDlESExKT2M0dG9pT1Q5d0hpK1R4OEZjTG9qalhUaStNbkYzdGxucVZ2?=
 =?utf-8?B?WmRlSEtaRjllUTJJdjQvQ2NMV1dpSjlYcmQzd0d5cUlGQmgxeHd3Z2tCWjJm?=
 =?utf-8?B?U2JpV1hQaTlJM1VLY1pXVW5sbFl6VE5HVXU1TmVlbTBiK3lyK0dadEQwN1pr?=
 =?utf-8?B?K21iVUlMc0VENGg0OVFtRVduN1hCdlc3RTVIajJ5MVlCYWlJdmRyUnZlSU1P?=
 =?utf-8?B?enBuam14SEs4N3JSeE1qR29RWHVSNVRDc2VuYjZ2WEYyWXUzeU1jUWFCd0hY?=
 =?utf-8?B?QVExYTZZNGdSdExYdmFONE0wVWVlYmQ5eXNnTVBaMUllai9nSkYwVXZjcnJx?=
 =?utf-8?B?WmU0YXZ4WEZLZzV2cXc4bjRmU0pKcUV2RUFnSU9YTXVISEFuMHQzeGJOSFpG?=
 =?utf-8?B?OGFGbElMcGk5bGNGSkxOYVFDU1dPc2czNmFQRTVSbE1uUWhGSnlFMG1IMUx1?=
 =?utf-8?B?TFAvQUJEd0F0MEVUTlZta01XMm5Xcno3Y1ZreHlBcEY4THc3MVpKTXk0eSt2?=
 =?utf-8?B?VGRValpJNEFwMlZwcGxGVTJCU0dtWUk4N29mMEU1eUN0c2hMUmwxMTVLM1pQ?=
 =?utf-8?B?dThnK0xSaU9TLzYyS1RnamRqYVFLQ1YrRjdZdjdSMllGLytybS9YcUNhK0tI?=
 =?utf-8?B?bkZJZ1pZT1owc3JkRDQ0OWkyTXhsd3Q4alJERzVCYVcxTFdsV09BbG9CaTZP?=
 =?utf-8?B?TGdrRUZLckN1MmdWQnVHV3ZlOHovek10US9IMEtyUVh3MThEcXpXVmx4SXhz?=
 =?utf-8?B?WjZsWk9nOVl6WWRLbmNHUmdSeGVlY203d0hqa0gwMFRFbWJCUnpvUTVVRjBz?=
 =?utf-8?B?NUtTb3p3TlBrMTJodExlZmcyWHdGdG16V0hFb3NOV2VTZXo1aFNDcGladmtK?=
 =?utf-8?B?aWRoNE9oMVhJVXZZeHczdk5TbG5wMHRxNm5NdGJ4TkJWV3VUSi80OW1nRmdk?=
 =?utf-8?B?NmZQRTVEbGVGaGlNWVhUckphRHNaSDA1eTBHdXo0ZGhUSk1FMENobVpnVVVl?=
 =?utf-8?B?RFFZOG55RXRSOVpQUW1GK3BLUDB6Y1RWcEFnSjljRjc1L2dxQ0M2VFN4R251?=
 =?utf-8?B?cEo4UU80NjJmcDVhbjdMNzVYWGZPUy85M0s3QXJFOVp1NU4rTDA3Skp1SW9T?=
 =?utf-8?B?U2lpSDBZRjZwSlBOcDh5N2IremFQb2JTWVZFWFhQbGNzamFlM3k2eGRoSWZV?=
 =?utf-8?B?YXVyMWRzNkxIUUxzSHI2clc2MEZqSmtBcXdHRTRDT0hKM2N3Y0R0QktOblJF?=
 =?utf-8?B?enN4MmJoUVloZXpyR0o0KzhyVVRDenJkNEVJcGRzdGJlL25NcHEyRVl6K2VW?=
 =?utf-8?Q?rWjwDtQcfUnQL4tEc02quVU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb0ba0a-c05f-479e-f1d2-08d9f5263ca3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 10:38:02.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byOX61qKQz95Xd9vgogJ7IIuicVHJyIQqNG2zeH0IItCW67+jD9vEfilND/QW0zRin+s/oPkCng8cpupulSggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3945
X-OriginatorOrg: citrix.com

On Mon, Feb 21, 2022 at 10:02:54AM +0000, Andrew Cooper wrote:
>  * Use workflow_dispatch to allow manual creation of the job.
>  * Use parallel builds.  The workers have two vCPUs.
>  * Shrink the dependency list further.  build-essential covers make and gcc,
>    while bridge-utils and iproute2 are runtime dependencies not build
>    dependencies.  Alter bzip2 to libbz2-dev.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  .github/workflows/coverity.yml | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
> index 9d04b56fd31d..6e7b81e74f72 100644
> --- a/.github/workflows/coverity.yml
> +++ b/.github/workflows/coverity.yml
> @@ -2,6 +2,7 @@ name: Coverity Scan
>  
>  # We only want to test official release code, not every pull request.
>  on:
> +  workflow_dispatch:
>    schedule:
>      - cron: '18 9 * * WED,SUN' # Bi-weekly at 9:18 UTC
>  
> @@ -11,11 +12,11 @@ jobs:
>      steps:
>      - name: Install build dependencies
>        run: |
> -        sudo apt-get install -y wget git gawk bridge-utils \
> -          iproute2 bzip2 build-essential \
> -          make gcc zlib1g-dev libncurses5-dev iasl \
> -          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml \
> -          ocaml-findlib xz-utils libyajl-dev \
> +        sudo apt-get install -y wget git gawk \
> +          libbz2-dev build-essential \
> +          zlib1g-dev libncurses5-dev iasl \
> +          libbz2-dev e2fslibs-dev uuid-dev ocaml \
> +          ocaml-findlib libyajl-dev \
>            autoconf libtool liblzma-dev \
>            python3-dev golang python-dev libsystemd-dev
>  
> @@ -31,7 +32,7 @@ jobs:
>  
>      - name: Pre build stuff
>        run: |
> -        make mini-os-dir
> +        make -j`nproc` mini-os-dir
>  
>      - uses: vapier/coverity-scan-action@v1
>        with:
> @@ -39,3 +40,4 @@ jobs:
>          project: XenProject
>          email: ${{ secrets.COVERITY_SCAN_EMAIL }}
>          token: ${{ secrets.COVERITY_SCAN_TOKEN }}
> +        command: make -j`nproc` build

There's already a 'command:' parameter set just before 'project:'. Are
we OK with using plain build?

If so we would have to disable docs build and stubdom? We don't want
to analyze all the newlib &c that's build as part of stubdoms?

Anyway, the switch from `make xen tools && make -C extras/mini-os/`
to `make build` needs to be explained in the commit message IMO.

Thanks, Roger.

