Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A1E2E71C5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 16:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59972.105157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGqg-0000ld-6S; Tue, 29 Dec 2020 15:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59972.105157; Tue, 29 Dec 2020 15:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGqg-0000lE-36; Tue, 29 Dec 2020 15:23:46 +0000
Received: by outflank-mailman (input) for mailman id 59972;
 Tue, 29 Dec 2020 15:23:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuGqe-0000l8-G3
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 15:23:44 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 825da18e-a02b-4c92-b11f-c47510e9f367;
 Tue, 29 Dec 2020 15:23:43 +0000 (UTC)
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
X-Inumbo-ID: 825da18e-a02b-4c92-b11f-c47510e9f367
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609255423;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9K4B+otHp9pjsvtgsdUyb+3K61CPImQEWih7qny+E70=;
  b=GqogtrMBh31YppjUjc+p+IsoTSP2QlGhm76qHR8jmmL9aN/7po+tcWi3
   uwGaZv97CHL5QTN5/TrVFqgOE7DE4t+wm6Ru2YhspVyXwZ/EarIB1O9OQ
   3rtsHGMumjUNO2Xuk2AasvSF88+17EFET/LZOXmTZuGWH8LVSifX+CKAc
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: i8I6K2ZanQwbgSXP1P6hFdwVYg9rMy5pp3TZYu97Lj8oIlxEy1lsaGyRlzYrcWuvHkLCvzDrNc
 kwMC6a8X6tTSDIQs2E+kL6SShh+3egOwpqZkC+5kciLQPbgDIyorHBQlLtPamM8hlnfGqLlNiG
 uPlOdVnsCPYmrGK6G4hF4+fC/aNQT1G7+gTxUI7t+nBX+sZByUALfixIdBeqCabyFmMwJSU+N/
 jVgZUDJx+njf/jDKugt1iUGr8VhcQIgws2NeaHJqFKjK3XjndmJgXaCj6PebcN1HidiPXyNUUv
 IyQ=
X-SBRS: 5.2
X-MesageID: 35349745
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="35349745"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1gckP56ysE/9A5rLMYMSlpHINabSa6+z+cg/OafhTk6msDzF3r6F+JpUAtE4hfrdhUxbcHzBiuBF1Kz5F6U0fU6q3FSvbcgDGGCimqwcYvq8Vz8t8FpEPn4GDXYUC2CecRwN+uldSfXDsuVpl71Beqt2OKLB1bSQhdZSy1Hm/EW7sBGPqP3dtzQNTaH8hl4Uygc2bbmg2hzKtarbddi7hYneR7coNFrHWMVvLMddMomRm2InUzHg4GS2C7Y+vSGuvO4W9z3GRIJv6uvvdSP4UWggJdbWmCYBA46OGuuT8e78pfH2LimxNhoaPkRbG+PiI7oi8bXTHALCg54+wJvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KkwukNq5S5gP/FrJN1Z6FX++GUKEOIr098DiYJYpgU=;
 b=kv5k6mlaxd7GGexP2jxM6a98ELdDL4v/qPjyMuk2vvGL2hzCIko8uROZtHQbCVLIKji/6h9LMepaLs+BorOSCRlzLhDGT7XGFf5vcKzGERfWVUpcaPZIgczUEvj8LQwk0hBFqgIM3xNrChxMDiGcPXK95dMv9tWu06EEs0TyoBsCpqKdoi9hcWoWQ92DCZf21PA7TEWnzKpIr6pMnjg6mkfaVq2WRFYc3S85dbJxwCX1aYSn6VLYOCqtzBamp43keqQcqyBmO13SCbswQrl1Mz4BUkCBtoAZVUWsaqishZJ4c/JVJCUMZ/LE1oGq6Bdh9prR1V4LKyLUQ3XW+jDLlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KkwukNq5S5gP/FrJN1Z6FX++GUKEOIr098DiYJYpgU=;
 b=LakH5AZsnUozFDugcBrI87T69C0mX8hsxxryThSR680zf0f8RrG9B7NO4y7AZjdPQm8VAblF2+9zE70nkTQes1uXB/hWkmz8nAT/mqgJ4A/NVsPdt3RBXHO4+aZE/v/q5PMprWOSHFJpoyzklrjnnWDa4aY6RCy6UdiocssP9mg=
Date: Tue, 29 Dec 2020 16:23:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 00/24] NetBSD fixes
Message-ID: <20201229152334.mu6i4kg5tltrf7ky@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 374341fa-f3a8-4a5a-3e70-08d8ac0db8a6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4217:
X-Microsoft-Antispam-PRVS: <DM6PR03MB42172E5051AFE374318045228FD80@DM6PR03MB4217.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oPndQYsC9bmpo+6bjM39LS9w/mRdZ0ATdviu7icVQbJ0rouAgiZhs5NfeNlIBWktKcfFRmVp7M3yhUeynRDFRjhv/45Lj4wZC6vDLqQ/REV/ns6TUpUmTLaensbvhOn3hiyjA2oHr58kLA1Mz0dGUlXA467y2Om/2yifIAzJQpgOvdoAA3ydqVDLYKGl7UyEUM+VrU25I82Tvb5Ok6jnnmyBnGT8eEXtw02nVqt75AjfmvzulMksFZZifCNRz2DHa7vGp47QJNkmL470BVyqCYWYuAkTJV2PpKqAwhB2oHF+h2/BDYVd4/dL7LYrJIAYeF+PeW6Fi5Jlqh5dMDtlbvbxX51rk4aOIdLBIhjNubX5ziSZ1lHOEP6HA5SnOSXlZ9y5ghqOmwEJ9SVB9CvUPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(4326008)(9686003)(33716001)(6486002)(2906002)(6496006)(86362001)(6666004)(478600001)(5660300002)(66556008)(66476007)(1076003)(8936002)(26005)(186003)(16526019)(6916009)(316002)(956004)(66946007)(8676002)(85182001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a05md05QZndKTSsvWVM0UjlYNlJtQWZseE5sY21YZ3VucG5sVEM2eXdKSkZZ?=
 =?utf-8?B?WSt4VmNSTmJTWUd3bzVUdkpIK2ZFNHdJMXhLcFFkUTQ5Y2NXVmNQcUxzUHRU?=
 =?utf-8?B?ZnlYRitFVExTWUFHWEVmS0lRRXY4dlkxVkNYTFpvbGIvdWdPMWlmM21SdGtU?=
 =?utf-8?B?bzBQb3ZuU1dOWGxVcGtaRzFmbDlyc3c5MGZJakJJRExkd2RYdG8xeGIxS0dJ?=
 =?utf-8?B?WGNKM2o3cmlJSDFOR3JSblV0cTlLczBLQmh4TWRlbXd6d2c4R29udEZkRWRF?=
 =?utf-8?B?MmV4NEZLQlQvblVLVEt6MW0vUGVmTWJqbnFIMFpNMzlMdUVtQ0lGSkl0WWxs?=
 =?utf-8?B?bThlRGhWbjV0T2Y5YlVKVkdwZnl4WElaM1pyYWpoMWJBQUtGMlE5dTFXMUdF?=
 =?utf-8?B?bDZsTUVDS0hERnZMWnBka0ptZGhSeXhraTVoQ01LTk53cUxlVmNyUENxbHov?=
 =?utf-8?B?cnJtZjhLZ2lHa1l3cy9qQnNhYlJXeEJJMVFUaGZScTN1Mi9VZTdkYUdsQ1Rj?=
 =?utf-8?B?bEpuNjFNTjNQQyt2Ym1zMytlWGIwbjRzVHFjaWgyZTcrSlkzOTZCMkFTbHJl?=
 =?utf-8?B?YjNqaVZsTEtuWXFzS2JTdzFBeDdkV2ZBRUpsdUMrdUhpQkNjSUdqSkRwb3hR?=
 =?utf-8?B?SXcyMWlLQ2c4Mitvb2o3ZDdod0xGYy9kWVZ1TmlOanVBMnIzUEhkcEdyTUdQ?=
 =?utf-8?B?eVFsQ0RpaXkvckRqMkRIakZzYXRrQUNHY0ttUVo5NXQrNEJERnVUaS9wVGlZ?=
 =?utf-8?B?ZTc1R2tCWEtpQ3JSdTBEWFVTRXArVnc3KzBXTUg3ayt1cHA5K2ZMRTYwMERo?=
 =?utf-8?B?UFBFejNyQkd2OFNlcENabDVLaUdQamEvd2VkVTR1Z2RrU0hKTmRiU2xiR1VS?=
 =?utf-8?B?YjRlVkg1eFVHNnY4cEFuM0JrODZQUnEzR3VwaFlCQS9oNmZkUzgvVng4aWNS?=
 =?utf-8?B?RGFCOFBKaDlTY29HR01HRG5YREd0d05IalB3OXVjdEJ1bzhUek9PRy8zVGJD?=
 =?utf-8?B?MEdlQ3RJMFlsTEdvcEUzSi9xN3NlRmkvbHFBWEhzbzBGaUYvRnJMSjBYalpJ?=
 =?utf-8?B?WmZKS2crRWFYTktEVzNwS1NvajJ0OU44b0o1V3lIcDY2WmpRSCtjb0V6RUg0?=
 =?utf-8?B?enI1bDJ5WHZGdUxrb2crU0NPNlZUS2FsVldndjhZK3dZYUgrTFRlalVVbHU0?=
 =?utf-8?B?Y1Z4SkYrTWlOSEFiaUMyNnF2ODJTTEpheGRaSnpNMEU0K09YM21oQW9BTTZG?=
 =?utf-8?B?UTNZcUZuczBHd3orYW1Db09iQldPdFBFTnF2N1VnNzQzVlRLK281c29LQ3gx?=
 =?utf-8?Q?ZAA7lHMZHe0/w63Ldreg+XwEdqEfV5whYT?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 15:23:40.4125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 374341fa-f3a8-4a5a-3e70-08d8ac0db8a6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TR5IG9G3Oo+bpVPKU8dMtozq0T48vKsvbMpG81qX3WpWcmMaKSpXSpkZOFJOhp3MInwccufocIHMqKuUvzqy0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4217
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:35:59PM +0100, Manuel Bouyer wrote:
> Hello,
> here is a set of 24 patches, which are needed to build and run the
> tools on NetBSD. They are extracted from NetBSD's pkgsrc repository for
> Xen 4.13, and ported to 4.15. 

Thanks! I think they are mostly fine. All of them are however missing
a Signed-off-by tag, which is mandatory for getting them accepted.
Also you should Cc the maintainers on patches, so they can review
them. There's a script in tree to do that, you can use it against the
patch files and it will append the appropriate Cc's:

% ./scripts/add_maintainers.pl -d patch/directory

Optionally use the --reroll-count when sending new versions of the
series (2,3...)

Thanks, Roger.

