Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD073213742
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 11:09:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrHgQ-0005In-Gw; Fri, 03 Jul 2020 09:08:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rI2g=AO=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jrHgO-0005Ii-M2
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 09:08:33 +0000
X-Inumbo-ID: c384f2be-bd0c-11ea-8952-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.123]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c384f2be-bd0c-11ea-8952-12813bfff9fa;
 Fri, 03 Jul 2020 09:08:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4AY0Ep0XMLvWjRbcvX1CzIra9cp56MtaTbTkGCacPsBPUtsXqWHjhEng5DOHajT2JfvusRniNfXriwwZa+Evf+TBAOIbYbM4QzlBugVXPx1UZF3jx/VT57NgbZ9h/jnwLp2DfAUyfxHoLeDEKdokVM8XeiLkypOEMQ0t4LekteDQNPNXqW2Nwwm8VGfGrSBfPC6JGk/q3yIVzb3PeMZtZO9ZNqBq/+w820d80QUvJu78IibQqLI2nPGc83IMiYNgwLzlQHV8MVG5EldE6gCjpbYgeSTFC7/XaP1qwRzWIUEoRorpNmvEq6N61GNFViHrbQ56w1uoXRaO9Zn4gjuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q16QWkpMwIuNHc3KdZv/XpoCCAtL9O/q/HdoKTKbv4Q=;
 b=jgGwE0S2HBzoHY8CDSUWHqrNfdYpaYUXC+KQNWpbnKeTbn7F+G9YN+mPxqnksPbxVtejGpREGlQ/f7mdL4TEewFeDPgQZ9WwqJFSqunp/nYGSxmfw5a9PjLw5c2VFN9CJUIy1YR5MiP6h1Ypj2rLqN+E5XFYC80uCsy0IVonw8uOV3Rhc3gOH5NtxgH0BA5+GbDhdyHQvdL+P1Vx7eunhtvwAsKJAQaRPn2yCGzkNeoVaK2d5NeQOhQ7wi1OlQsq8Ju862TEmSSmtssSaIIiS6JqAAIZ7pq9GCuYJmIApR7JdRPMpzHhOrHQfQ2YF5srgPqLvIKuwgAtHagU3PTfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q16QWkpMwIuNHc3KdZv/XpoCCAtL9O/q/HdoKTKbv4Q=;
 b=LunQVUgnTaclkBF4I6nnQE+IFmN4OaxCnrkfTE3FeMAItn8A9u9KlmU/ye510QzOmG3UiyyGdumNGnZLmZ6ttTDA0uj70i4ZA9qYsOoz8m1ESgtLRMB8rUD5cdAx/BvHaqpVuNETkq1lnx5TAUOlZ85mD4+OsjdyjhC064G5zus=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5448.eurprd08.prod.outlook.com (2603:10a6:20b:106::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Fri, 3 Jul
 2020 09:08:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312%4]) with mapi id 15.20.3131.028; Fri, 3 Jul 2020
 09:08:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 0/8] error: auto propagated local_err part I
Date: Fri,  3 Jul 2020 12:08:08 +0300
Message-Id: <20200703090816.3295-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.15) by
 AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Fri, 3 Jul 2020 09:08:28 +0000
X-Mailer: git-send-email 2.21.0
X-Originating-IP: [185.215.60.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bd17e35-e055-464a-5372-08d81f30a715
X-MS-TrafficTypeDiagnostic: AM7PR08MB5448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5448B4D9C641AAAE72A3A7E7C16A0@AM7PR08MB5448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L04HZ2pvo4FC4jRzJH8NlD47x6lKD5S+585bh7ZI9JBj3eB4TIc0PMyV8Q8msmfKLyK7roNEiqOfxB+gnhogaDtjnXGrJ+pubtnDggQzg53VjevKWAWdjb6PoRlnxYuLicjLP9DJqaRHeEzuo+L/K2Mxoxvo/MWeJD1YiarU4e1DHgIKMpGruGudnUHzpAdoUv4R5wLu08cdATQEBIHcD1ox+D0T4i2UEepDWif3GGJTBH3JzSGkthYoOZXVkhJg8KkQsB2T/v5d/3nBhSMhHff13aYoiq+2u/nDUcHZ72Pylx0mlTVUn5kJpkzrPehqk1hBQEm8NuEG01lHb8vH3rfi0G3eM9s1Hk1p79VTTX0GeCLUyLBfL2MoT16V6Ipc8gsgx+UwwLZcyPHkBuYkzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(396003)(346002)(66946007)(66476007)(66556008)(966005)(2906002)(86362001)(1076003)(8676002)(83380400001)(6512007)(5660300002)(8936002)(6666004)(186003)(36756003)(4326008)(6506007)(16526019)(6486002)(6916009)(7416002)(26005)(478600001)(956004)(52116002)(316002)(54906003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: VB1dOkt/mh/DTF47kWkSm6T8zoiTIA0e7iYdoDje8lqTMTtTx33rQE1gttsV68xNybs3cKHdNWAJ4BTiEQsqW9nhOUfuY6OS8LOIKqJDeZxT6l+4NeCw7s1E8IUdCScAsCYBZghDbiw/jiTKnN6WhshK6Ohk1v3JmuLMVtSIz1DLOwrgZSnIETkkQY0SwnxZHDQAILD7IJ/epaPeWGG//Cj3ut6oX4RZnl4ECJADPm8DFK2wO8fyksb0RZiy6CgbOJV3Yuq9ZcljN895dCtn56h67nGKRbXapRZJYqqK7p2qwMPCGtjvFbqzPF6WkAiphxVswlhIN96t2GM00a+52jC+gSO9aXZU1nCXJxmne96rhnz9rDjkr65wF83kM8sVpiFrv1q4h2RiPj6AOSAi8TisjwQJPiU8aVMV+Km/WCPWbZ5u+0JHadyvMVd2zEB1inbewhjxWES8hxQ7hE+rKD+SmMU10qKuap8kzDd65yu5LBbUYPgWls+KhDfVVnWR
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd17e35-e055-464a-5372-08d81f30a715
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 09:08:29.6213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBVLwEgyFYNMa7oBcYgz6QK7YVU2CMRv33TIjpQ6dRQIAHbDNFc0aSI5YV1cFtWHwosuu19fqWa0Dv2DJmnGPKORWKMg/FqtU2LeCqcj7is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5448
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, armbru@redhat.com,
 Max Reitz <mreitz@redhat.com>, groug@kaod.org,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 eblake@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Based-on: <20200702155000.3455325-1-armbru@redhat.com>

v11: (based-on "[PATCH v2 00/44] Less clumsy error checking")
01: minor rebase of documentation, keep r-bs
02: - minor comment tweaks [Markus]
    - use explicit file name in MAINTAINERS instead of pattern
    - add Markus's r-b
03,07,08: rabase changes, drop r-bs


v11 is available at
 https://src.openvz.org/scm/~vsementsov/qemu.git #tag up-auto-local-err-partI-v11
v10 is available at
 https://src.openvz.org/scm/~vsementsov/qemu.git #tag up-auto-local-err-partI-v10

In these series, there is no commit-per-subsystem script, each generated
commit is generated in separate.

Still, generating commands are very similar, and looks like

    sed -n '/^<Subsystem name>$/,/^$/{s/^F: //p}' MAINTAINERS | \
    xargs git ls-files | grep '\.[hc]$' | \
    xargs spatch \
        --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
        --macro-file scripts/cocci-macro-file.h \
        --in-place --no-show-diff --max-width 80

Note, that in each generated commit, generation command is the only
text, indented by 8 spaces in 'git log -1' output, so, to regenerate all
commits (for example, after rebase, or change in coccinelle script), you
may use the following command:

git rebase -x "sh -c \"git show --pretty= --name-only | xargs git checkout HEAD^ -- ; git reset; git log -1 | grep '^        ' | sh\"" HEAD~6

Which will start automated interactive rebase for generated patches,
which will stop if generated patch changed
(you may do git commit --amend to apply updated generated changes).

Note:
  git show --pretty= --name-only   - lists files, changed in HEAD
  git log -1 | grep '^        ' | sh   - rerun generation command of HEAD


Check for compilation of changed .c files
git rebase -x "sh -c \"git show --pretty= --name-only | sed -n 's/\.c$/.o/p' | xargs make -j9\"" HEAD~6

Vladimir Sementsov-Ogievskiy (8):
  error: auto propagated local_err
  scripts: Coccinelle script to use ERRP_AUTO_PROPAGATE()
  SD (Secure Card): introduce ERRP_AUTO_PROPAGATE
  pflash: introduce ERRP_AUTO_PROPAGATE
  fw_cfg: introduce ERRP_AUTO_PROPAGATE
  virtio-9p: introduce ERRP_AUTO_PROPAGATE
  nbd: introduce ERRP_AUTO_PROPAGATE
  xen: introduce ERRP_AUTO_PROPAGATE

 scripts/coccinelle/auto-propagated-errp.cocci | 337 ++++++++++++++++++
 include/block/nbd.h                           |   1 +
 include/qapi/error.h                          | 208 +++++++++--
 block/nbd.c                                   |   7 +-
 hw/9pfs/9p-local.c                            |  12 +-
 hw/9pfs/9p.c                                  |   1 +
 hw/block/dataplane/xen-block.c                |  17 +-
 hw/block/pflash_cfi01.c                       |   7 +-
 hw/block/pflash_cfi02.c                       |   7 +-
 hw/block/xen-block.c                          | 102 +++---
 hw/nvram/fw_cfg.c                             |  14 +-
 hw/pci-host/xen_igd_pt.c                      |   7 +-
 hw/sd/sdhci-pci.c                             |   7 +-
 hw/sd/sdhci.c                                 |  21 +-
 hw/sd/ssi-sd.c                                |  10 +-
 hw/xen/xen-backend.c                          |   7 +-
 hw/xen/xen-bus.c                              |  92 ++---
 hw/xen/xen-host-pci-device.c                  |  27 +-
 hw/xen/xen_pt.c                               |  25 +-
 hw/xen/xen_pt_config_init.c                   |  17 +-
 nbd/client.c                                  |   5 +
 nbd/server.c                                  |   5 +
 MAINTAINERS                                   |   1 +
 23 files changed, 690 insertions(+), 247 deletions(-)
 create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci

Cc: Eric Blake <eblake@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Cc: xen-devel@lists.xenproject.org

-- 
2.21.0


