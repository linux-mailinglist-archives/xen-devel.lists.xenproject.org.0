Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5E8B33115
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 17:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092091.1448157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqCMy-0002QX-SS; Sun, 24 Aug 2025 15:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092091.1448157; Sun, 24 Aug 2025 15:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqCMy-0002NO-Pj; Sun, 24 Aug 2025 15:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1092091;
 Sun, 24 Aug 2025 15:10:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epLo=3E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqCMx-0002NI-Bt
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 15:10:55 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84e76660-80fc-11f0-b898-0df219b8e170;
 Sun, 24 Aug 2025 17:10:50 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PA4PR03MB7517.eurprd03.prod.outlook.com (2603:10a6:102:bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 15:10:47 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 15:10:47 +0000
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
X-Inumbo-ID: 84e76660-80fc-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZrAtPdFH7eaJLOq02+gRx7xkcaJEonLzyLMkO2lgHJHr3nng1v4wr4BIInLC+md0+v2Tn6UWG55DVbLMr6qcOzpV6TFJ+MyqHiWK3zpylXXbLG+9a5tNAR9HBL+FS8V830MoV1MpKKwlRqWe/WU3KVhZm22djq+UZr+eAlaUG3xxAMSamrkY2AuoHRsksU2PA/1rQiN61/K/jPV/5qI8ObDJZlhks2jYrgPA19KLXIPsvZ309dekfqzYJW3nQKq9CLeWxEVUWkqi75BP+Gblcw4kyrm3bwN94JxVRct4eCtyHQ4odGta8cDcJk53hGWeUjoWq/kMJyd0dtmZhib4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI0sw4VQoV6ivAmxst3keUXn201q9YNHqSmgOpeMvFM=;
 b=kRs8x04ktGA/59AYs26UP2hN5Rj06v0z+d8QdW0f9OQA6TTH+ljbFHET3w3Rw27Y2BhWxCWMMlNl6cofMFGe5KBCIMpzFRHSZRwYr4hOfBINzO0NvEUWS72gRXGN2vpaUfvxCPgZS867Lh8+W4OQxc/7cF3U8o+dheeokPAAWQGMTHswVawxYjrJspYFZ/B+cWhxU5hby1373MCAwr5Z4+AlXE8K1tlYZEI+uTPDHk9qEIQasuQTn0yf9bXspx5+eyY65X6YJvqXEqYdOEfhpWcbg3XyQWs2INDuetvhlWQ/rQio1daQj9CGRyA2N+a+CrITfwzBmCscbYISXrVU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI0sw4VQoV6ivAmxst3keUXn201q9YNHqSmgOpeMvFM=;
 b=L5JkCZynQXRx4uQZfcD854PVANys++sFnR13D1V9H4UFXGEec2CMYnO+C1gl0ZBMwDv5baxXfJyZwrHZoC8qxPP4pLr5b3rt7ccooZw1vkoXYckFo30QmRXfp/IcWrVIqVjpQiIFKP+vJ2OeujcBUqtsa1Mhtw4ZCLXBlILjccaGxu1wWi8LmCmSrU/RrlA8v41Zil4SfvxkEQ4v6QIDDOixhH4Cu9dOkRE96OUCBEeO+B1+2BqeFwPxXs4mure1vHomqm4VfZJaDCvF8FvtiwSe6F4f6p2IwzxcGn64rlUbAYw1HBXjrGke+MxMpjlESqNBdrhG0WQy3fJ96xcLuA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] common/efi: fix Rule 2.1 violation in read_file()
Thread-Topic: [PATCH v4] common/efi: fix Rule 2.1 violation in read_file()
Thread-Index: AQHcFQlF20ah2tP5uUOdXQ1Ea/l40w==
Date: Sun, 24 Aug 2025 15:10:47 +0000
Message-ID:
 <1e5a31fe588f58bd2b5c7835773fdf7899ff5511.1756047981.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PA4PR03MB7517:EE_
x-ms-office365-filtering-correlation-id: f2098cd1-aae3-426a-7540-08dde3206792
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MEJjcndBYzdiMldBMllaOUVLWk1CRHMyQ1ZXRUxpM282MDJFcUVKaVZOeUZP?=
 =?utf-8?B?dnlxbjFoVnVkR2U4Rzh0bmlDL0orMlBpUjh0V3E3SjF0bHdZT01JdThpdG1L?=
 =?utf-8?B?Z3JwQUliem9vTExTdG01ZFA1R2RXVGJ4dmprTkQvL1YyeEdpVitwbjdCWmxi?=
 =?utf-8?B?NXlUeUUza1VIcHJHRTNUNmM1dkV3b1k2OVRpSUlQZE90WjZJWEZxd3VVbHhV?=
 =?utf-8?B?eTRackRxejBtcnNQRW5sWHY2TWlVeWxjbU5DazUzdHpvb0NhaFZIdUJOMzVa?=
 =?utf-8?B?YTM3aWdSWE9ZUVpOWVNNMmhOTkxNak5mK2RhNFl5RjhZMlB4ZUFZT3ZGVnEr?=
 =?utf-8?B?ekNBWm9aK2FHaU1iTjVXYU9PRnU4TjFOZWgxR1Y4N3p0TkJ2anpMM3VwN2R5?=
 =?utf-8?B?YnZMZFl3U1ppcEtUTXlOT2k0M0JXQkNTQzdYM1VQaW1SMlZNcEFDVk9MVFRs?=
 =?utf-8?B?anVxNklTZXNIeHgzYVFqR3BZaWkzUm5oOFJDTGp4RDgyRlo0Vm0zR1NCeVpJ?=
 =?utf-8?B?cSs5UnIrSXlTODBNVzc3M2tycEw2REd5WGVUR2lLKzdRUlJlUEFsN1ZaVUtk?=
 =?utf-8?B?VlZISit4TmIzRStaejBGTGdHU3hWeWNiaEZHaEZrR0VscFl4dmI0bU1yQlY1?=
 =?utf-8?B?Y3JhZGovbVhIbExEQTBlbDBUQUVaTExIaWpVR2pUN1pTYVZTVGR3ZlkwZnBw?=
 =?utf-8?B?S0R4T3pUclMydFRPK3EybkNjb1hyR2FDczFnMi9PTVpzVXJ5MU1vcDh6bTZ5?=
 =?utf-8?B?dUVZdXRHVVhOVUFEQTI0Q3kwbEhDSENpWEJ2c2tGMzM0dkFrMW1md3RVRGdw?=
 =?utf-8?B?UWVnU0NnS1VxdGJzTTdibEZIcTlYeW43ZDF3eUVQSXNHYjdBVEIzenR5N2o1?=
 =?utf-8?B?bE80YWE0K2FicmxraGZVYUhOUERDOEZ3cDZxVDlyaTkxTFY2RDBDanN6RDR1?=
 =?utf-8?B?WXJjUnN6UWJpTlh5aGtiRlpZTkQ2NkN5cVhQWXIxajV0WllpaUYreW83Z2I3?=
 =?utf-8?B?eG5wMTc1SVNQZkc0d1gxMjNVaUw4VkhKYkhzeWhQTHRvQmRLUWt5MkZaZzFG?=
 =?utf-8?B?cEZTN2hxN1MrSXpmMGRITWJ5dndUZisvdlhIT2ptUUxrdW1mS3NicFhhTThz?=
 =?utf-8?B?K1JTK0E0dTBOdXgrNEptSG5vbG5RQnljd25TRFJwMGovd0hCam5wRDlxeUpm?=
 =?utf-8?B?Vjl5ejladGg4T3FZQjVnS0hvdHYvSVkrMFBrWkZkdFlpRHMrQkpjSFpwTDVn?=
 =?utf-8?B?WUlnY2FHSzBQQ2hqdEJLM2FZakl6MEIyRW15ajlVUXBZeW1GNVJQakFMZjV6?=
 =?utf-8?B?dE1pbFNxRm5rWDQ1SGlKMGtjbUlwc29LQm9ES2lKaFZpMGgwWTJ1SFA2aTJM?=
 =?utf-8?B?dE9NWk1lQmIyZGxRdnA4QzNudGhCZXdxN2J4OUJEUkF5ZUdidmlvMlVBNWY1?=
 =?utf-8?B?bTlDRENBTGNLcU12ZnEzUmNwMkdVT3ZNdnlWdGsrVkk0eDErQk13WkhmQUVJ?=
 =?utf-8?B?VWJyNkFKVjREcXFhVGlIdGVCSnp0TTVGSXgwUEx2SVZXTExrRjJvVmNLaVFZ?=
 =?utf-8?B?MThuUDBjWExjaW45MGVUR21FSGVrYTBQTDQ5dlMreE84M2huZnBsNjJIbHA4?=
 =?utf-8?B?T01Lc1hrQzQ3UldQa2RnU2hDQ25TWTBtS3VJK2REaTFwczd2TTFQTnpMei9E?=
 =?utf-8?B?Z0xRRnM2VjJQVTIrRWFxUlp4cjAzcnlTTmN6dmFnRkMzd3ZBMjVRWUxiY2Jl?=
 =?utf-8?B?Y2FmMkl1QkY4bXFHSE5SdUFvUUNjWEE2NTdRaU1ycGcyZ1VhU0tWM05oUG8w?=
 =?utf-8?B?UjdxNHZRSHFoMkFiRzVZcXpmb0Nyb01YWTJ3MkNESHVOTXhkWnU5S3VKZXVL?=
 =?utf-8?B?NklGa2RjRzVNa0J4WEU0OCt3amx3ZWlzS01NTEhsTXkra1VocCs3SWhMTlk4?=
 =?utf-8?Q?3p5hH1moaS4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVdUeWNUQnhISlkxRXBwZTNSM0Z3R0tOZDA2WFcveUd6MWUrdnpyV1p3a2dj?=
 =?utf-8?B?SWFHU25nckgvNllwcHVYYnZySkdETjJHNGZYeWYrWGppY3phaklmR05xQmhy?=
 =?utf-8?B?M1d2RWY3cHJVNUFYNEY5UkJKVDRZMmMwanBQSXcyZ1IyRFRVdWlSN29QbUo2?=
 =?utf-8?B?MDd5OG9WNEwxRmRFNG9nY1pROTdSdHh2dnd3M0wraEhSbXdRT1BXaVoyNDU3?=
 =?utf-8?B?dXBGNGloZUN5RGV6TWl2bmY2cUlMMm9zd2QwdzBnVkdIMHNKSEp3bkFTYzE2?=
 =?utf-8?B?cHpTejVtaFdPL0JwWFhKVmViRU5RMlJVeUpBdjhyZHBrdFJMZ0NsK25zUXNy?=
 =?utf-8?B?UWEvTHBLSitKbStCelUzSG4vL3NJVU9DTnhab2NRS0pyajJTTG5FOGpCb2lv?=
 =?utf-8?B?M21KNVljQk5xRCtZQUs5c1NQTmMvZ1M3ZEU2KytmeUdzd2gzeGQwZEZXR2NK?=
 =?utf-8?B?ZVJCd0p5bGVteU9KU2NJNHNld0VBUkdmV2I5MzJZNGpvM2NYekVEOENQalBu?=
 =?utf-8?B?VlU4TUJsTFFHa1JzU05FaUhLeTRsbGlaT2NXOERTTml5eUFuWHg2b0NOL25P?=
 =?utf-8?B?RFlkM0pteU1PMi9OODJ6Q3N1MmJoeDJsSjZMY1EvNlZzTWUrcTVQREwxZDFD?=
 =?utf-8?B?Zy9SelNNRWl3VGNEVncwckpjREpkL3NvR2ZsOFdlckpWa2w3cDk4K3d5eFFS?=
 =?utf-8?B?bW1vVlZCQzNtN1Y1R3FST3Uza3IzcjdtTDBGRnA0OHV6VWxNd1RGWmpHd2dr?=
 =?utf-8?B?bXdzMHljVk9PRjZ5L1Y1TkN3M21hWS9LTG9JazkvNHZwcmVQUHNoaG8ydHdk?=
 =?utf-8?B?dXhsTjFTc0pzY2ZEc2RHMkFFMVpudzdWL1VpWm9kOFpLTmRyYnhVRVJGM2Jw?=
 =?utf-8?B?dk9vZGQ5K3hMQnNKa1hYNVBXZVMzUktMdjlzVnQwQ0F5Y0VLNkdHcTdyd0JV?=
 =?utf-8?B?WU5zL3BUSW43dmhvQkRQRlJjYVZITVQwZmYxVzZBM1ZMeDk3UE1iV0Z1a3F3?=
 =?utf-8?B?YThJV0Fvelg0RG05VUZ1aXdiQW9xT1krZytBMmFLMU9maHZ6Sm1reVBrTUFv?=
 =?utf-8?B?VDRRTG1HM0hBeHFaUWVJYmgwVEFGK29ENGZVNVcxVzVaWDZ3VjVNY0RVRENW?=
 =?utf-8?B?KzFSVVN4aGZnTnRpUmtSNENOaWUxQ2dPMmErM1ZZQWVIT2s1a3Nsbm5IVGRo?=
 =?utf-8?B?c0xkbW4xdFRmQi9qY3Yxb1ZjZWx6aWNNMTlzKzl0OUI1QnJ5OG9SQ3lXVDZL?=
 =?utf-8?B?RFFDWnpVKy95ejFxZWl4WUtuSmE1Q3UwbFJzUlRUeHFoSzRkQU9Ga1NBN0tO?=
 =?utf-8?B?ZzF2YkVzNVcxK2VTdnRZWTFMc2tBK1lsYnNrY2ZHeGhONDJuaGdJSVE0Rmhk?=
 =?utf-8?B?S0dKKzd4emZLK3dlTk5lN0hJWUhETHBWN3VUdjh3eExYOGNLM1JjelQ3SitQ?=
 =?utf-8?B?TnBrT1Z5a3A3bFJHZ1dyODFDUHlHdnIxZ0xqUnJyTWtoc0p3U0hmcGg4S2pN?=
 =?utf-8?B?bStRUXhwYkV3akpmaFpPcXNVM0FKbVdOOVUvL0ZaTU82WkszdklxUTN3U0Zz?=
 =?utf-8?B?MDlxU0hEQ0l6cWQzTHAxeFV2WFNEVmVRQWhOQ2pHOWVoak9nY3dIZW1ldGlE?=
 =?utf-8?B?dEdSaU5uamkrNEx0ZVdPTXlEbWJpNFljdlRqcWprTUVZNzJVNWhJZkxwZDlz?=
 =?utf-8?B?RXVseEcwSXRkeE5TTDJ1c3IxL095VXBrQklsQnBhVXdkN2dMdjlqWmN4Y0s4?=
 =?utf-8?B?Q1lLYTRubXZsaS8wY0hpQlloR3NqcHYrVFo2d0ZRYXErRHRJT3BZdVV2MHZq?=
 =?utf-8?B?QllVZ3lNQ1liZ3pPbzNPTUJ0NXM0ZTEvZlNGd21pMDF2L2JjbHpYK2prUE5s?=
 =?utf-8?B?V3ZmRWh6UCs5Nk5SMFlZd0hUbVZueG9jNFdrbnR1aWdzM3BqaDhSTGJkOHp1?=
 =?utf-8?B?WTkvNTJ6c1dSU05YMlhIN3NQdlhrSC9zUmlIaUo5b1B4Qm9DMGtYbTdqaTJG?=
 =?utf-8?B?Q2lHR2NTWUlLUENUZVJBc1d3TGNhdW5MaVpVd2YrMTFSS002MUg5dWs1bnFZ?=
 =?utf-8?B?MHRJNVExY3FlYUN1VHlPVTdLWE5DMHF5bjlWRmNCRUErM2QxYU53MVlwd0lz?=
 =?utf-8?B?TmxaNXNSVTRKL3MvNzA5OUtsRzJ1NFJtb2x0K3dWN3hmdjM4RjdBY0h2VElw?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F7DBBDAAFA87348B21D2E1E3BFD3F9F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2098cd1-aae3-426a-7540-08dde3206792
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 15:10:47.2273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcDWBt5ILedOlSscnqaky1PxFScbBDkZDsclqFF5foAtgCl+KvHt6UAwpLAdBzPHoWWNq5v8HpJaEC6opwbro/tLhOLG3FZF2z14haESLXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7517

TUlTUkEgQyBSdWxlIDIuMSBzdGF0ZXM6ICJBIHByb2plY3Qgc2hhbGwgbm90IGNvbnRhaW4gdW5y
ZWFjaGFibGUgY29kZS4iDQoNClRoZSByZXR1cm4gc3RhdGVtZW50cyBpbiB0aGUgJ3JlYWRfZmls
ZSgpJyBmdW5jdGlvbiBpcyB1bnJlYWNoYWJsZSBkdWUNCnRvIGZ1bmN0aW9uICdQcmludEVyck1l
c2coKScgd2hpY2ggaGFzICdub3JldHVybicgYXR0cmlidXRlOg0KICAgICAgICBQcmludEVyck1l
c2cobmFtZSwgcmV0KTsNCiAgICAgICAgLyogbm90IHJlYWNoZWQgKi8NCiAgICAgICAgcmV0dXJu
IGZhbHNlOw0KICAgIH0NCg0KTm8gZXhwbGljaXQgcmV0dXJuIHN0YXRlbWVudCBpcyBuZWVkZWQg
aGVyZSBiZWNhdXNlICdQcmludEVyck1lc2coKScgaXMNCm1hcmtlZCBhcyAnbm9yZXR1cm4nLCB3
aGljaCBndWFyYW50ZWVzIHRoYXQgaXQgbmV2ZXIgcmV0dXJucyBjb250cm9sIHRvDQp0aGUgY2Fs
bGVyLiBJZiB0aGUgJ25vcmV0dXJuJyBhdHRyaWJ1dGUgb2YgJ1ByaW50RXJyTWVzZygpJyBpcyBy
ZW1vdmVkDQppbiB0aGUgZnV0dXJlLCBjb21waWxlciB3aWxsIGVtaXQgYW4gZXJyb3IgYWJvdXQg
dGhlIG1pc3NpbmcgcmV0dXJuDQpzdGF0ZW1lbnQgKGJ1aWxkLXRpbWUgc2FmZWd1YXJkKS4NCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlcy4NCg0KU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsg
PGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NClJldmlld2VkLWJ5OiBNYXJlayBNYXJjenlr
b3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQotLS0NCkNo
YW5nZXMgaW4gdjQ6DQotIHZlcmJvc2UgY29kZSBjb21tZW50IHdhcyBtb3ZlZCBpbnRvIGNvbW1p
dCBtZXNzYWdlDQotIGtlcHQgdGhlIG9sZCBjb21tZW50IHRoYXQgd2FzIGFscmVhZHkgdGhlcmUg
aW4gcmVhZF9maWxlKCkNCi0gYWRkZWQgTWFyZWsncyB0YWcNCg0KTGluayB0byB2MzoNCmh0dHBz
Oi8vcGF0Y2hldy5vcmcvWGVuLzRhMWE0YTM0MDZkMjI3MzQ4YWZhMWFkMmNlOTBkYzUyNjRmZGI0
NGEuMTc1NTc4Mzc1MC5naXQuZG15dHJvLl81RnByb2tvcGNodWsxQGVwYW0uY29tLw0KLS0tDQog
eGVuL2NvbW1vbi9lZmkvYm9vdC5jIHwgMSAtDQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21tb24vZWZp
L2Jvb3QuYw0KaW5kZXggNTBmZjFkMWJkMi4uYjdmZGIwMzFkMCAxMDA2NDQNCi0tLSBhL3hlbi9j
b21tb24vZWZpL2Jvb3QuYw0KKysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jDQpAQCAtODUzLDcg
Kzg1Myw2IEBAIHN0YXRpYyBib29sIF9faW5pdCByZWFkX2ZpbGUoRUZJX0ZJTEVfSEFORExFIGRp
cl9oYW5kbGUsIENIQVIxNiAqbmFtZSwNCiAgICAgUHJpbnRFcnJNZXNnKG5hbWUsIHJldCk7DQog
DQogICAgIC8qIG5vdCByZWFjaGVkICovDQotICAgIHJldHVybiBmYWxzZTsNCiB9DQogDQogc3Rh
dGljIGJvb2wgX19pbml0IHJlYWRfc2VjdGlvbihjb25zdCBFRklfTE9BREVEX0lNQUdFICppbWFn
ZSwNCi0tIA0KMi40My4wDQo=

