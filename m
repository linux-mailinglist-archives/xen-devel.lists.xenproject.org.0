Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7506B8F78
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 11:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509522.785406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1fG-0002Hk-BX; Tue, 14 Mar 2023 10:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509522.785406; Tue, 14 Mar 2023 10:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1fG-0002Ew-8T; Tue, 14 Mar 2023 10:13:54 +0000
Received: by outflank-mailman (input) for mailman id 509522;
 Tue, 14 Mar 2023 10:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXSW=7G=citrix.com=prvs=430734c92=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pc1fE-0002Eq-7n
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 10:13:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e96ac14c-c250-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 11:13:50 +0100 (CET)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 06:13:46 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SN4PR03MB6766.namprd03.prod.outlook.com (2603:10b6:806:212::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 10:13:44 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Tue, 14 Mar 2023
 10:13:44 +0000
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
X-Inumbo-ID: e96ac14c-c250-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678788830;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=z8WyPBBctI4bdaBwIcJP6Wa2GGiqZSHu8111TZ84Fls=;
  b=Sro7xTTPiStn0hgZ3hdMewJeoYqXlI3MCcIVYAQbYaXauuKp9dmfiF1s
   paUCdR0HCT3QfBos+yV6T0kqV4HpYgxgU6zk4JmkBv7FmwywIoZccl/rO
   K84PTyBchBnlXi8BqhmJtHJsoFdobJT8Bl5MeB6v/8moWi2DZ4prosHiE
   k=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 100122420
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:63QfRKN+DiUdhrDvrR23lsFynXyQoLVcMsEvi/4bfWQNrUoj1GQBm
 zMaWGuAafrYMTHyfNlxOom08U1VuMLcyYdrHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rtJMXFVx
 9sjEwEyYECstseZ/KywScA506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCKpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr037WVwXmjMG4UPJij27ltnQfI/UkWJl4JcXK3ouKjrnfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvU6SdHtbSUTTeR8+mSpDbrYSwNdzZaPGkDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhF2bZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:gsgl7q5tqDgvrpe7ZwPXwfSCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6QxhEE3I/OrtV5VoLkmsl6KdjbNhdItKPzOWwFdAUrsSibcKqgeIc0Oeh41gPM
 FbAt1D4bXLfC5HZOnBkW6F+r0bsby6Gc6T9JXj5kYoZxprZshbnnNE40ugYwxLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUqzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+4goAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKcQongyyGM5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHof
 t29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjRto+a87bXnHAb0cYa
 5T5YDnlbJrmGqhHjXkV7xUsZqRtzoIb027q3M5y4GoOght7TpEJnQjtYcidw87heMAorl/lq
 v52/dT5f9zp4ktHOBA7NNte7rFNoT7LCi8QF66EBDbE6ELUki93KLf8fE84e2wZZwEpaFC46
 jpQRdRsGIoZljjEtKDx4Ba6xylehTFYR39jsla64Nlp73gQbaDC1z4dHk+18Okr+4DHMHRQf
 C6IfttcoHeBHqrEYNExBDhV5JPMnx2arxohv8rH0iOqtnKLYOvvOrdf/bcYKb3FF8fKx7CK2
 pGRjn6P8VG4ASxVnv/nRSUR3PhE3aPgq5YAezB/uAJyI8CcpNXqAMck1ik/cTjE0wljpAL
X-IronPort-AV: E=Sophos;i="5.98,259,1673931600"; 
   d="scan'208";a="100122420"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIwQX7ur8uwauvWXQ6DqywbrXMJod8KEOeeaxlWz4InRFGSh+uZlSX0MFlVa1J9nFa+MmhKLeKWvQ4xonOR4+FxW2PFDE0tOc782dT0P1Ratt9pQ2kaerYpqfk5+5nQ3wHf8ELi05itgl9PoxzgfOIKE6fExEZLcZ07C8iIxwF2FDvXkcIhzw9ckbODJk6sddJ1Hn+XReF5KbQLed9x7r32xBXfAhyg7JEc/6M6voCS3oV6QgULofcLnraz3MAbGIYuMkyvQhTfBLk0gsX8r3jkhvm+3tkkSSRD++lY8q+us8DhoXAx0sPeqh1hS18ZjR0tfzo+hvhgbNQsiAVOLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlbQb2nbl8GJ3brMpKES1M8hi+FxR0QVkO6xDYCDg4I=;
 b=Q4SjvpHf96w43fp4kP9aCq9LhofvQgWVgI9/O5zSWvXWIJTvKXNt6qSr9Lh3K6xIekKZfcYXbDZTHml7FYALj4UkqSu3BOecW5aZl7MCtZhh7BO7fL1aOBI+4YEzwei+aS/k9BplKVTIk7Z2pxqgVLFTKjYbLoYYBzfxE8sGd6jq7pJjCdrDN7AyYOKrtUKrpQUe9kLTkecxGO74Rwiu6cG2Ih0Ze/hPFftdEaz0xZSD6vuGVSYgXK9Pd853zoan4iGmsSAkNAnPPQ3JeH5Gzfyema8XIe3LoVptNM+lKoNmfRcTWHPOxBbyPvygM2wyYm2GM+rqbYx3NZzPgEwbPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlbQb2nbl8GJ3brMpKES1M8hi+FxR0QVkO6xDYCDg4I=;
 b=SD4+PTWsyNWFZ2XTVc6yQMwXs/YFXhTZPeMHOHMgAvZNKWrQQgiFv4XozMWCc49WdXZa4OpNFKZrwFPVrX19PPfdZd6mALA6Sjmu+XiJc0yPsr+Gqria0MZUudXjgbMxO9pPtc6mKAlAST60nZx6wk7wW/fSakdUddczYd0ST5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] vpci/msix: handle accesses adjacent to the MSI-X table
Date: Tue, 14 Mar 2023 11:13:31 +0100
Message-Id: <20230314101331.4194-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::25) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SN4PR03MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 30254bcb-c3c3-4415-5ef0-08db2474cab7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CJ89XVzvpdEwVGy4Nir69ZAZlCHxT01xN+DAJyyQ0CerEcAsB256tvV6iDZdbfKbqxKk3kcmfh02iHjsVYD1jhRa0qVZppyUimFT4j8kQtbGZxp4ZMcOIe1/ZnoQin44YLX0LDnxsp9GKNINw8UbNJBWhMjhXrmQqBaPk2VEvKWz0fA0kb2BgE5nx3wCgcIBBvbCFVU/6AnnZxh4X88dF85lWd3j+bbMUh2Cn9xUVxYmKu1MySIAZxp6jFsF6zNi3WMjy2oHb/nqw8HO4M2k9ywGf+56VCC1GX3Dbb+uuhd3/gJ1PqmtkzWK3MwQlr6bvH5rc78yZDSGz5ThLjqDct2pw7YlTEhgjQ99QgixzwaanQ2jqY3me7PVhrxKFTyVUwzBuq4eUbksMR9aDkQH7lMypgngVEfGCn9c+FhqEYKBcFa84u9hYkB0uv3+VHdCEBsNz2uNtb/soUOdMjl0yXwFbUfOmcEVDA7KMMx2VI8i2c3qkUhgvOOyr+9p5598XhB+FJRGs0L++BQVYJCxzTpgg3sLvCHoC1vmLQhcZQCpT3XhyMP3rUb5bFWqR9gjsW9gsRhH8nOSrcO07HL11+d2laqno2K2WtOHNHnhl8nCtthSRdac1Oz07z89DZm+HXp3C8qvOnesxL78D1xktxRxaglZa5mS3MdIKYQ1YGrFjKXGlPOdxNEPlKUQgJlQFJ7kIP6KHU//ADzGhYsI1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199018)(4326008)(8936002)(5660300002)(6916009)(2616005)(41300700001)(186003)(6512007)(6506007)(1076003)(26005)(36756003)(86362001)(2906002)(83380400001)(66946007)(107886003)(66556008)(8676002)(66476007)(30864003)(6486002)(316002)(478600001)(6666004)(38100700002)(82960400001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFF5VnNzTFVmY2dES1J3Z3FJRWRQZmVEaXU0YXA4OEZneU9QL3cxbnVIYnd0?=
 =?utf-8?B?bGJKdmQxN0FmQTR4YVlSaWxmcVdFdjlLdTVYRVd6cmRYWkhYOHVBbEFDOGZY?=
 =?utf-8?B?YUVIbTZTWXRYam8rOTFBd3dteCtYVlJGUDlYR3hpYS84ZXFuNDJZZVA5R1Ba?=
 =?utf-8?B?VnJsTFZUTWI5cFNlMWo0T3Y3WWNuUDNyZ2cwTFo3c3E2YTB6UVkrUUNFL2N4?=
 =?utf-8?B?MHRXVmdlTjJvbG1DM21NWkwwY2RPMTE2TFgyUmFlbmp4UzJPRnQzQ1FBNkRn?=
 =?utf-8?B?bG9KSEF6QSs4N2N5aDdiWkNWRHorWkduQmpXZmVJNTBaMmI0NksyTi9uNUpL?=
 =?utf-8?B?bmxsQjFEZU9ZVjlJdHVJM0FxQ3RoWEljRDJQYjBkTWJHQ1NuZEhXN09kSEl6?=
 =?utf-8?B?aVZjZ3NiQ0IvSktpRGlwZ1QybzR1U080c1M5SG5nbHFWRzE0d0RyQ2VsSy9r?=
 =?utf-8?B?eTlSTUhxL1M5bkwva1QwSnVuYUg3MVNTQldPanI4LzcrUS9UNEc4UThzWm9X?=
 =?utf-8?B?N2Nwb1h2Ty9TVEJaNmUrWS9lTkNteWN4STRsRUUyMm92bXFvRnFDY2lYQ2hz?=
 =?utf-8?B?STVsbEprdGw3OXVHczg2L2hQWEtyOW4rcGRnbnlTeDVvZUgwTFhyUDFhWVN2?=
 =?utf-8?B?c0V5TjJpeCtpWnp5Rktnc0hlUndBUEVwc0JyS1NwUWpPUFJWM0V6MzVROTNP?=
 =?utf-8?B?M0RQYWZrY1U5bkVtazZlSFBkV0oweWlmZ21DczJ0S2duVHJDdm1TTXpDMVZ3?=
 =?utf-8?B?SzZtd09HWWtMVDBmeGI5Y1lJazdUaWMrYStVTnBiTytkeG13V3ZaM1U0QXR3?=
 =?utf-8?B?ZTk4NVVweG8xaUVXY0tBU245ZllpdUZqV2FpbkwyREpyNmVtdW4yeXpUK0N5?=
 =?utf-8?B?c0pmaFBBTjhtTnJHblJaOVE1eU1MTG95OVlnVXhLa1JMYXU1VzloRlY5akNa?=
 =?utf-8?B?OEk4VVZXQk5pVlBoUnhqQ3dERTBrK3FOUzNUWlpCRHJwREJ1T05Va016ZVZJ?=
 =?utf-8?B?c1AzeXVnbEoyUDZreXlHd2VSbGFUc09Xcjd0RlJUMk5JR0JmWjdEbTdlUExr?=
 =?utf-8?B?dTR1QVZmZno0aUkvbndmQjJkb0VYZXgxRUtqbndBRTExNm9DcDVyQS9kVUt1?=
 =?utf-8?B?Q2VPYVZndGRDczBHZTBRL2lndTRoNVFSNnU5YXJseUZMUHJRcFdHL3paL3Ur?=
 =?utf-8?B?RFF2YnRsYjJCUTV2VTFYajVmRVRHTW92VzV6OXZPVjZLTVlZRnk1bC80TCtR?=
 =?utf-8?B?c1UycXlpckxkSWo4ZkUyem1rZ1RoYkpwWk43RlBDL1J1bzJDZTBwZlcrSVhw?=
 =?utf-8?B?UW9kOTRMTUlScWptVFFwaU0zdTZkNXQzeExVdzhPUE40ZnA3SHI5RGNaZHk4?=
 =?utf-8?B?cHpjWXg5UkxzU09XV3BQU0xsWmRjUkdmUzRFMXMzOWZJUmM0RTFudHhORS8y?=
 =?utf-8?B?S2VYNno2dlY1bXdpOVIwNkNQS3hFK0EwZFRGN2VZbFJYMkJhQTZwaUNxL2E5?=
 =?utf-8?B?WFFsaVUzOG1laWNaTW84N21IalVEU25qRE56cHJqRnRwb0NJRnFid2VTMlc4?=
 =?utf-8?B?OWZRSnNSMmxwSGpjQ3RJTXZHZngrUm1aVGptZ1d4cVNlOGtsMmpZd0pLUHBX?=
 =?utf-8?B?dGpCRjA4Sk4xN1h3bXF0QW1MTm9teTU2RlVsODBGWUFDOVpCZmMxRXBSdHc5?=
 =?utf-8?B?N3VKT2t1eTF2QkVzWUs2NXVVdXNwZGZSdVVOZ1FvWEIrZW1PUHhsN1kxNGtL?=
 =?utf-8?B?ZnhlOWkxS1FqVjVDUkNZcU9ibzV3YVU4dTBZelFDa3ZzenJ4bjZTbVp4MXBH?=
 =?utf-8?B?NS9FZVlNMzNBOU8rendCNklNY1VOUkxSRkhxWTJ6bUZ3elRHY3o0Q2gxQlpk?=
 =?utf-8?B?QlZiaU1kdHVrQlE2aEgyLzAwcVl6SVpqYkJDVjdsZnFPUnpQSmNPbHdWbTVr?=
 =?utf-8?B?elQvSm0xaXFPQmJwN05OMllhTHNIY25INHBxSDQrS1hEeTlPb0syMHNvaCtZ?=
 =?utf-8?B?S1pIU2JVYXhockN0dUpMRW1QNFVpZmR4VnhHZ3NGZHlCdCsvU3Q1cGhubm1x?=
 =?utf-8?B?c2pCZkpxbDdyWFJyVHA5b1BRS1Y1SUhvcVNCeEZ6N3orWXhLbi95T2RuWjk1?=
 =?utf-8?B?SFFEbmwwaUt1d0J3QU40NnBDb0hsVHI1aE1selNhV1g0WVV1M1NiUStqM0h1?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mEPFXGyX/u5dDcFQ7rzfM35NWIfrBdleAFutWqzW+QsFX0DUqEFZ0uGhJNY5Hw4OpT7HSP+SphGPoJGjCfTAbfyAnyWjUysPj/fr8RWxq/eIAXrrLZwwWJ+qDk7ffAJK5PuHQOnab51iyWMA6inDrTwxWlNLhB1KSifLsHVlf6mS3eeWA+f+PgAXDqAFU9+OMoFmdkWWR8nj2pn1b9fKmn1MqeKKxHMJoLIjx4YG61Q+/1RpJfEWR+yRzA5k6eG7GzBMmxLo2RsMEgu4gXSO6OEFMbVJk4BcAkHSbSc60VpW6aVMV1LEYpDqVnP6hVKbpquT8sH2btKX+nz0VUG+wOuJ27TPaEL88kLpt4gqXZswmVqSf4OXkYSqpguwA9T+C3LTM3PVgP3rjQpQGVxScvvQ7aCvR8UZ1p2y1UWnciTwD7Bc16jVt3q218ARRO3T0Rw6W11r/9i0BiDJVniWdqwneUUUBlotSnEblTGbGSC1WhzvSbO1OruzMrWYvMtp6jCPmhR16CxFoJ1F70DMFcX85uLA1M9vvzW/krxukmM6BjAIuOYjhfi2AVrVFSsIiDL9AlCqJCk7JSe+P9AesLn/8J4PwQjEfsaKSc71N09FoKfl4Bdh7iCD/hoM99Cn7an5KFHBq+91x8sqtv4P8wDJuagdsyBhQjjLjKgPThh/GXVGCxXfGjVMCko1I5GJpIUy1j/AWltDbd88Y7t27i07KPZOtBGKqt/vs1CNqdgQxurvVDmL6/JkNXS9BDq7KTH5HNbwTtcdAGIrkKywg7YWKddpUkt+jd3scyNDZwPV14UWRhH03KcciTIwLeC0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30254bcb-c3c3-4415-5ef0-08db2474cab7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 10:13:44.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXgDljPuV37sO0MW6SWglI72TURd2J+GJK0MfGK1TLH6fGbltKlmcYrTNX0ZxKrp7EYmo9yd+5vpYInU0tJPzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6766

The handling of the MSI-X table accesses by Xen requires that any
pages part of the MSI-X table are not mapped into the domain physmap.
As a result, any device registers in the same pages as the start or
the end of the MSIX table is not currently accessible, as the accesses
are just dropped.

Note the spec forbids such placing of registers, as the MSIX and PBA
tables must be 4K isolated from any other registers:

"If a Base Address register that maps address space for the MSI-X
Table or MSI-X PBA also maps other usable address space that is not
associated with MSI-X structures, locations (e.g., for CSRs) used in
the other address space must not share any naturally aligned 4-KB
address range with one where either MSI-X structure resides."

Yet the 'Intel Wi-Fi 6 AX201' device on one of my boxes has registers
in the same page as the MSIX table, and thus won't work on a PVH dom0
without this fix.

In order to cope with the behavior passthrough any accesses that fall
on the same page as the MSIX table (but don't fall between) it to the
underlying hardware.  Such forwarding also takes care of the PBA
accesses in case the PBA is sharing a page with the MSIX table, so it
allows to remove the code doing this handling in msix_{read,write}.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/msix.c | 259 +++++++++++++++++++++++++---------------
 xen/drivers/vpci/vpci.c |   7 +-
 xen/include/xen/vpci.h  |   6 +-
 3 files changed, 175 insertions(+), 97 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index bea0cc7aed..1b59c7fc14 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -27,6 +27,13 @@
     ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
      (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
 
+#define VMSIX_ADDR_ADJACENT(addr, vpci, nr)                               \
+    ((PFN_DOWN(addr) == PFN_DOWN(vmsix_table_addr(vpci, nr)) &&           \
+      (addr) < vmsix_table_addr(vpci, nr)) ||                             \
+     (PFN_DOWN(addr) == PFN_DOWN(vmsix_table_addr(vpci, nr) +             \
+                                 vmsix_table_size(vpci, nr) - 1) &&       \
+      (addr) >= vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr)))
+
 static uint32_t cf_check control_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
@@ -145,11 +152,9 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
     list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
     {
         const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
-        unsigned int i;
 
-        for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
-            if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
-                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
+        if ( bars[msix->tables[VPCI_MSIX_TABLE] & PCI_MSIX_BIRMASK].enabled &&
+             VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
                 return msix;
     }
 
@@ -182,36 +187,38 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
-static void __iomem *get_pba(struct vpci *vpci)
+static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
 {
     struct vpci_msix *msix = vpci->msix;
     /*
-     * PBA will only be unmapped when the device is deassigned, so access it
+     * MSIX will only be unmapped when the device is deassigned, so access it
      * without holding the vpci lock.
      */
-    void __iomem *pba = read_atomic(&msix->pba);
+    void __iomem *table = read_atomic(&msix->table[slot]);
 
-    if ( likely(pba) )
-        return pba;
+    if ( likely(table) )
+        return table;
 
-    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
-                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
-    if ( !pba )
-        return read_atomic(&msix->pba);
+    table = ioremap(round_pgdown(vmsix_table_addr(vpci, VPCI_MSIX_TABLE) +
+                                 (slot == VPCI_MSIX_TBL_HEAD ?
+                                  0 : vmsix_table_size(vpci, VPCI_MSIX_TABLE))),
+                    PAGE_SIZE);
+    if ( !table )
+        return read_atomic(&msix->table[slot]);
 
     spin_lock(&vpci->lock);
-    if ( !msix->pba )
+    if ( !msix->table[slot] )
     {
-        write_atomic(&msix->pba, pba);
+        write_atomic(&msix->table[slot], table);
         spin_unlock(&vpci->lock);
     }
     else
     {
         spin_unlock(&vpci->lock);
-        iounmap(pba);
+        iounmap(table);
     }
 
-    return read_atomic(&msix->pba);
+    return read_atomic(&msix->table[slot]);
 }
 
 static int cf_check msix_read(
@@ -230,45 +237,6 @@ static int cf_check msix_read(
     if ( !access_allowed(msix->pdev, addr, len) )
         return X86EMUL_OKAY;
 
-    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
-    {
-        struct vpci *vpci = msix->pdev->vpci;
-        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
-        const void __iomem *pba = get_pba(vpci);
-
-        /*
-         * Access to PBA.
-         *
-         * TODO: note that this relies on having the PBA identity mapped to the
-         * guest address space. If this changes the address will need to be
-         * translated.
-         */
-        if ( !pba )
-        {
-            gprintk(XENLOG_WARNING,
-                    "%pp: unable to map MSI-X PBA, report all pending\n",
-                    &msix->pdev->sbdf);
-            return X86EMUL_OKAY;
-        }
-
-        switch ( len )
-        {
-        case 4:
-            *data = readl(pba + idx);
-            break;
-
-        case 8:
-            *data = readq(pba + idx);
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            break;
-        }
-
-        return X86EMUL_OKAY;
-    }
-
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
@@ -317,43 +285,6 @@ static int cf_check msix_write(
     if ( !access_allowed(msix->pdev, addr, len) )
         return X86EMUL_OKAY;
 
-    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
-    {
-        struct vpci *vpci = msix->pdev->vpci;
-        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
-        const void __iomem *pba = get_pba(vpci);
-
-        if ( !is_hardware_domain(d) )
-            /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
-            return X86EMUL_OKAY;
-
-        if ( !pba )
-        {
-            /* Unable to map the PBA, ignore write. */
-            gprintk(XENLOG_WARNING,
-                    "%pp: unable to map MSI-X PBA, write ignored\n",
-                    &msix->pdev->sbdf);
-            return X86EMUL_OKAY;
-        }
-
-        switch ( len )
-        {
-        case 4:
-            writel(data, pba + idx);
-            break;
-
-        case 8:
-            writeq(data, pba + idx);
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            break;
-        }
-
-        return X86EMUL_OKAY;
-    }
-
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
@@ -438,6 +369,145 @@ static const struct hvm_mmio_ops vpci_msix_table_ops = {
     .write = msix_write,
 };
 
+const static struct vpci_msix *adjacent_find(const struct domain *d,
+                                             unsigned long addr)
+{
+    const struct vpci_msix *msix;
+
+    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
+        /*
+         * So far vPCI only traps accesses to the MSIX table, but not the PBA
+         * explicitly, and hence we only need to check for the hole created by
+         * the MSIX table.
+         *
+         * If the PBA table is also trapped, the check here should be expanded
+         * to take it into account.
+         */
+        if ( VMSIX_ADDR_ADJACENT(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
+            return msix;
+
+    return NULL;
+}
+
+static int cf_check adjacent_accept(struct vcpu *v, unsigned long addr)
+{
+    return !!adjacent_find(v->domain, addr);
+}
+
+static int cf_check adjacent_read(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
+{
+    const struct domain *d = v->domain;
+    const struct vpci_msix *msix = adjacent_find(d, addr);
+    const void __iomem *mem;
+    paddr_t msix_tbl;
+    struct vpci *vpci;
+
+    *data = ~0ul;
+
+    if ( !msix )
+        return X86EMUL_RETRY;
+
+    vpci = msix->pdev->vpci;
+    msix_tbl = vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
+
+    if ( addr + len > round_pgup(msix_tbl +
+                                 vmsix_table_size(vpci, VPCI_MSIX_TABLE)) )
+        return X86EMUL_OKAY;
+
+    mem = get_table(vpci,
+                    PFN_DOWN(addr) == PFN_DOWN(msix_tbl) ? VPCI_MSIX_TBL_HEAD
+                                                         : VPCI_MSIX_TBL_TAIL);
+    if ( !mem )
+        return X86EMUL_OKAY;
+
+    switch ( len )
+    {
+    case 1:
+        *data = readb(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 2:
+        *data = readw(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 4:
+        *data = readl(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 8:
+        *data = readq(mem + PAGE_OFFSET(addr));
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return X86EMUL_OKAY;
+}
+
+static int cf_check adjacent_write(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
+{
+    const struct domain *d = v->domain;
+    const struct vpci_msix *msix = adjacent_find(d, addr);
+    void __iomem *mem;
+    paddr_t msix_tbl;
+    struct vpci *vpci;
+
+    if ( !msix )
+        return X86EMUL_RETRY;
+
+    vpci = msix->pdev->vpci;
+    msix_tbl = vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
+
+    if ( addr + len > round_pgup(msix_tbl +
+                                 vmsix_table_size(vpci, VPCI_MSIX_TABLE)) )
+        return X86EMUL_OKAY;
+
+    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
+          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
+         !is_hardware_domain(d) )
+        /* Ignore writes to PBA for DomUs, it's undefined behavior. */
+        return X86EMUL_OKAY;
+
+    mem = get_table(vpci,
+                    PFN_DOWN(addr) == PFN_DOWN(msix_tbl) ? VPCI_MSIX_TBL_HEAD
+                                                         : VPCI_MSIX_TBL_TAIL);
+    if ( !mem )
+        return X86EMUL_OKAY;
+
+    switch ( len )
+    {
+    case 1:
+        writeb(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 2:
+        writew(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 4:
+        writel(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 8:
+        writeq(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return X86EMUL_OKAY;
+}
+
+static const struct hvm_mmio_ops vpci_msix_adj_ops = {
+    .check = adjacent_accept,
+    .read = adjacent_read,
+    .write = adjacent_write,
+};
+
 int vpci_make_msix_hole(const struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
@@ -530,7 +600,10 @@ static int cf_check init_msix(struct pci_dev *pdev)
     }
 
     if ( list_empty(&d->arch.hvm.msix_tables) )
+    {
         register_mmio_handler(d, &vpci_msix_table_ops);
+        register_mmio_handler(d, &vpci_msix_adj_ops);
+    }
 
     pdev->vpci->msix = msix;
     list_add(&msix->next, &d->arch.hvm.msix_tables);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6d48d496bb..652807a4a4 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -54,9 +54,12 @@ void vpci_remove_device(struct pci_dev *pdev)
     spin_unlock(&pdev->vpci->lock);
     if ( pdev->vpci->msix )
     {
+        unsigned int i;
+
         list_del(&pdev->vpci->msix->next);
-        if ( pdev->vpci->msix->pba )
-            iounmap(pdev->vpci->msix->pba);
+        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
+            if ( pdev->vpci->msix->table[i] )
+                iounmap(pdev->vpci->msix->table[i]);
     }
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d8acfeba8a..b1ea312778 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -133,8 +133,10 @@ struct vpci {
         bool enabled         : 1;
         /* Masked? */
         bool masked          : 1;
-        /* PBA map */
-        void __iomem *pba;
+        /* Partial table map. */
+#define VPCI_MSIX_TBL_HEAD 0
+#define VPCI_MSIX_TBL_TAIL 1
+        void __iomem *table[2];
         /* Entries. */
         struct vpci_msix_entry {
             uint64_t addr;
-- 
2.39.0


