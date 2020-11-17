Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0512B5C10
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 10:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28839.57978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kexYf-0005eX-9y; Tue, 17 Nov 2020 09:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28839.57978; Tue, 17 Nov 2020 09:45:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kexYf-0005e8-6Z; Tue, 17 Nov 2020 09:45:53 +0000
Received: by outflank-mailman (input) for mailman id 28839;
 Tue, 17 Nov 2020 09:45:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kexYe-0005e3-0Y
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:45:52 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d684498e-a975-412d-bf96-4a5574b4ac98;
 Tue, 17 Nov 2020 09:45:49 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kexYe-0005e3-0Y
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:45:52 +0000
X-Inumbo-ID: d684498e-a975-412d-bf96-4a5574b4ac98
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d684498e-a975-412d-bf96-4a5574b4ac98;
	Tue, 17 Nov 2020 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605606349;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jU/GQeNT9VECEGZp6at1TS7GCw3RTxDwROdm6yd8Pqc=;
  b=NYUnK3kO39S3ZKxWUTQ+mCaMUExKPjXeoqPiVuwNMwm8BlcDeMn61Yok
   EotEjQwNzg52otDjqwNOEd5lrQUM3A4VBJdXqhc6nvCZA6cENqtChDbNq
   obzZtvVPR4R7L1jRw6hduPb3c/OvheM5+baxNpE1Qzhh6ODEVvfXHO2IM
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Uli+V3pqbYMY7VLBDEkw8zU6Jfx51qPghPaAy4KDczcdtUdgM/COfHlfbgvtDL/aTB/vfw1jie
 KFno/fBPrEpGH1hPm56hQnY8m5CYxLDojKRHcgPUGD1Ulz+pofJcBOw1rXoFpT89HWKRv4sfWT
 6fwmoX+RVykWMgwO4VGBgjjwIsiJQgW/GuP1a820tQFd+eChqZxq7yLK+BrZuwIm/4eUVUUVTk
 YBxeAp9IylZBGqB/VQ2MdNUG6H5w3F5XjSJfixim3wbe7fK0C55/fn4Vt0dC3wcvRLvuFOzFL7
 9bQ=
X-SBRS: None
X-MesageID: 32457950
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,485,1596513600"; 
   d="scan'208";a="32457950"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFgZwwaf/CuxNNo7OXCr6CIP9gmEM8P4QcUQmIg9n2/hi/EsNRKWU2Ebz+HHZrL6zLHRu4YcLNscma4LiV/vu0jguz/ytmJBfB4bAXWvibH0WqSLgLiiJ36b+DysBjTm0k1g2dD0I35VkM5HFOWCHb7KzG6xf8AEhmyORcJoZ7OMkFp2xeJfwRjzctxIzFTX/ZB3BRpUQSuycvHglO8QzNkNrdCz9au5/cK33OAudL9O5TOF2sZ6Fa2RvkVa17tuNvcE64xVGmoQhU/gVdFVWNT+bygk+NhW1DNM+APYaGoHysXbwe+qrr5OsoL0VfyT7Rc47ot5wpap/kKZtvBr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34KokYREnulQM/fcbrIbd8nwLMKmZGtLmoRvZKEIMn4=;
 b=MKSikhyY3rJ1SaEl7mpi6aEp+cDEV8/LQu1q5ZG3XdRZ0u7UVhEKM/PucqWTESQYkuG4qYdGRvvcisrWBW9ydkTh8RqCGe6Lyhodh2dNDQ1gq3JcrEMZjgfAi4/MarQgFGegT4v8hGJ/PcOA8JQIiMR+kQZ9FElgbQeS1lmt0xwlcVzEKpmgra0EmJ16ajwtSw+TM0IYmhKJlXnZFE2sMJEEac/UlN271aH50UUD+IwZP+WWgjyIItjsKW64FbWoMbNgQalZn/pSkzc0JWm2o7ckDKR/X5+gXGzA+Cjmtci/4cCdfo6Ohz3SnIhU70EccVr5/z6mTP48UtvaVXqEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34KokYREnulQM/fcbrIbd8nwLMKmZGtLmoRvZKEIMn4=;
 b=mAuwTByAb7xnEUm/X8kc8/qNSF6FFKhQsxvOkLfXJG0vwnRuCXsLO2AC6rKxee+yfW+K/H/owarWGX3l3JmzF0WBEG9he3ACeqHc4UJ1CSVq+PF7S9f+oVJZJHL9FQhyqXo6mzpBNkUlxa+AzdYe9+wJ7FPMnEEyhtulDmwMfsQ=
Date: Tue, 17 Nov 2020 10:45:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: netbsd PVH dom0: xen clock event stops
Message-ID: <20201117094534.z3usx6tsydtle53o@Air-de-Roger>
References: <20201115174938.GA3562@antioche.eu.org>
 <20201115182416.GA30231@Air-de-Roger> <20201116182211.GS840@antioche.eu.org>
 <20201117085448.2haekgpbcspwmqja@Air-de-Roger>
 <20201117090733.GC1405@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201117090733.GC1405@antioche.eu.org>
X-ClientProxiedBy: CWLP265CA0355.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:5a::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a735f5-7586-4f66-4ad0-08d88add8f18
X-MS-TrafficTypeDiagnostic: DM6PR03MB5065:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5065B4CDF779A93B81C2F2D98FE20@DM6PR03MB5065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QvsFJ2k88aQOmR+uSITSUb2uDULndGVMeKrxAzcl2kSKvmmyYUu48ZDr1x/ebyXs4UOPa4y6K8p0PSyRvwmY7caOomoDOCcm+x89W43GZX/qYTA8wAI5u14Ev3kuL9y5hJEcwvrQFvyjOOdgwBqroiuEtbJnNd7OpN7uK3k/gXDyxiglG59WPbBP6Ettojhf4Alwu0EWkm2vX1jKosX7oOSZ3WPtuFuM5dJpYjJO7UEazDQOccPJVRMKalNLAQj4XJisobMZiMzx4XIBRgUlmUDsWqu7UG87wqTZgvepr+yEqlmOvpl1Hm+WEcnhso1M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(6916009)(8676002)(478600001)(8936002)(9686003)(66946007)(6666004)(6486002)(86362001)(4326008)(85182001)(186003)(1076003)(6496006)(4744005)(956004)(66556008)(33716001)(66476007)(2906002)(316002)(16526019)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 911VPRXQpNCwO9bRtLkijNqsscesWyK+H+JRHKki9k/ctmRmBiSVbHSsLNMQyYcSOVeqyjgTi9Jm1m7ddWEfXqzwH82q3XaTkkWQYV5AC50gj8DIWne38sKY1eUCjVst7qj58uY7+q369GjjeX79gjhdg3Gr61PShwcJ1f061G8I1qEtuPTcoRMeH5aU/eamzpXWPoYIkb4aw9xVHCNMJJxybUAGkcCSsoMr/cu2gfpwvR8zQJAsDqbcxk5BEM+IOa5x+NKNkfL22pwmteJ0xDijWj6np9VWW+f9AFlj04aZQIwWax0IQ1vvAU6YvWny0Dlv0gS+6CEpd55SJpPSe8VAx5W6CoZmVEhPidgi34j9ZRAEJ2H+l75Itl3zTv73A358E07sbWaRFMaKka4byxH69qRUj/27ep1sRHjeXlscad/NbHaDwjmUNk/qr/4uTNCcKnFZxePpdCgF1vv6roq/1030yzYANevjltiKTzrLvOpCfPEK5oId9kQyGJYfS3B/+lUDdxdE4lhkn+JeFpDMalZBlgWqrt2iAufQRZtaq1XliQ4gEhFxBLuUCFpgy1/KB3PueGfMX4r0DLUn7pw113+20sBG7VkEZ44+2wEQr2yHYLFDKDD3EScr1RWJHIUjaBByV3DGUMZsJjnMsxSpRXMXCvLmeIJdE8pOzMk3CWAvLf4FW0mpvdDjwTv6bM9b1ZBJfIwc1meHZyk8sFAx0qthL5JDYt1AFBPyffWFSMB9uYnzGCOeYXPyqiGOLM6rUkoRaGxQtYkADULNCwY71z7kfWdoetrkdg5RP7GWMFqRn2Bj52OzFOVFzC8/e26v0/NvsXpOom/4qj3GqnQVzYVTs0k2xXVg/lCRZjEkl9tWBa9Qfp52gJeJtkDH53NwRvtqTHx9hcScWP0FdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a735f5-7586-4f66-4ad0-08d88add8f18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 09:45:46.7209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWUIS1GlVUeNapTht2ysu1+gfHTFLkfdL1Tgo8Nw4ykRUC/kNGytL4+B85LuS55R2Gz1kwEEduy9IBbIfuq2NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-OriginatorOrg: citrix.com

On Tue, Nov 17, 2020 at 10:07:33AM +0100, Manuel Bouyer wrote:
> On Tue, Nov 17, 2020 at 10:02:04AM +0100, Roger Pau Monné wrote:
> > Great! So all interrupts are working as expected now?
> 
> No, I'm back at the problem where the PERC raid controller times out on
> commands. I'm cleaing up my sources and will try to get more data
> about this problem.

OK, the output of the 'M' debug key might be helpful in that case to
see if the MSI-X entries are masked (IIRC you said this controller was
using MSIX).

Rogerr.

