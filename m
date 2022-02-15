Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578FC4B7035
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:33:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273433.468621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0lc-0008Vw-Cb; Tue, 15 Feb 2022 16:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273433.468621; Tue, 15 Feb 2022 16:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0lc-0008TZ-7Y; Tue, 15 Feb 2022 16:33:28 +0000
Received: by outflank-mailman (input) for mailman id 273433;
 Tue, 15 Feb 2022 16:33:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIVK=S6=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nK0lZ-0008TR-QF
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:33:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcd3b462-8e7c-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 17:33:23 +0100 (CET)
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
X-Inumbo-ID: fcd3b462-8e7c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644942803;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LRjKM8olk6HBnkJWLXgrzrwMBSbHlR+uBcK19SFdVD4=;
  b=e32r0Q7gQd9QZ9BCYr3+EjKlfN4VUlMx+Lg9V6LK/rV+O/EE2X5Qhen6
   pbg4SFT9fRyQ1G+SLHkXlgwCwE6rCL3d0SxLRmdL8Uy5lPSQ+Hwjt1s8E
   c3lfTjopzCaNuyDVTCzSKRg8Y09RdoAW9Bq0++15na/KA5R4stoRlXclU
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sbeiUBLXvB3iQuXgs81ByylMzozm0IgrXeZa/jgVuVJb9d9v6rMWU4/UPUOUcOeu+SGPkw2ZyC
 QxNi4yew2O/izK9FmxrS/zMR2uo3YfClSDelXDRlFn1vp+3I5IAj65dLajsy9p7tFAScUCBYsk
 QCjORdHhBD2IBN6tMQBsdCaRz4BJhxHIseV4QMgpGXptOWA/xA6EB0pycvdI2faDy5oKy+qV3O
 pTuiaQOqFy7Ej1de++ufgU08vHYWsn0nhfLHfduEoTb1IzYnnnlYKfzi4Y0zYut1iljvXY6Bu4
 9egW8JCbIZIQLm1gndZOYOhX
X-SBRS: 5.1
X-MesageID: 64261680
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KUl+AK3zfjfhwgG9+vbD5bh3kn2cJEfYwER7XKvMYLTBsI5bp2MPm
 2cYWmCGPPvYYzCneNF+PY3i8kMHvpLUmN9kQFdspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrNh2eaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhrYwy6
 /pLpIeJUSwGJqDtpM4nUF5gHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EpM0lIY/ONYcWvnhmwBnSDOo8QICFSKLPjTNd9Gls3J4XQ6aGD
 yYfQT43by7jQzFrAU4wA6Bjs+W513LFdyIN/Tp5ooJoujOOnWSdyoPFDt3RfdCbQNRPqWyRr
 GnG4mfRDwkTMZqUzj/t2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IBcbT0ehqP+1zEu3QctCK
 lc88zAr66M18SSDTdTjXhv+vH+NuDYdXcZdF6sx7wTl4qjJ5UCfD2sNTD9EYfQnstM7QXoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLoos+kxbORdZLC7Oug5v+HjSY6
 y+OhDgzgfMUl8Fj/6em+VHKhRq8q56PSRQ6ji3VUXii9RhRf5O+asqj7l2z0BpbBN/HFB/b5
 iFCwpXAqrBVZX2QqMCTaNdRX5KG4eeeCSX3rkZiPqULzTfqw3H2KOi8/wpCDEtuN88Ffxrgb
 0nSpR5d6fdvAZe6UUNkS9nvUpp3lMAMAfygD6mJNYQWPvCdYSfapHkGWKKG44z6fKHAe4kbM
 IzTT8ujBG1y5U9PnGvvHLd1PVPGK0kDKYLvqXLTkk7PPVm2Pif9pVI53LymNL5R0U98iF+Jm
 +uzzuPTo/mlbMXwYzPM7akYJk0QIH4wCPje8pILKrHTclc7QDh6UZc9JI/NnKQ/wcxoehrgp
 CnhCie0NnKj7ZE4Fel6Qi86M+6+NXqOhXk6ITYtLT6VN4sLOu6SAFMkX8JvJ9EPrbU7pdYtF
 qVtU5jQU5xnF2WckxxAPMaVkWCXXEny7e54F3H+O2ZXkl8Jb1Ghx+IIiSO2r3dQV3Lu75Nhy
 1BivyuCKac+q81ZJJ++QNqkzk+rvGhbn+R3XkDSJcJUdlmq+49vQxEdRNdtSy3VARmclDacy
 SiMBhIU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu/QVlL9UsAe7Q
 GyV/dxeNenbMc/pCgdJdgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYsadEr2
 +YsvsIS+jeTsBtyP4bUlD1Q+kSNMmcED/ctuKYFDdK5kQEs0FxDP8DRU3ek/JGVZtxQGUA2O
 TvI1rHajrFRy0eeIXo+EX/BgbhUiZgU4U0YyVYDIxKCm8bfh+9x1xpUqGxlQgNQxxRB8uRyJ
 mk0aBElefTQp29l1JpZQmShOwBdHxnIqEX+xmwAmHDdU0T1BHfGK3cwOLrV8U0Um46GkuO3I
 F1MJL7ZbAvX
IronPort-HdrOrdr: A9a23:C+JlraNZUqvc18BcT2T155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjzjSWE9Ar4WBkb6LS90DHpewKcyXcH2/hvAV7EZninhILIFvAt0WKG+Vzd8kLFh5ZgPM
 tbAspD4ZjLfCVHZKXBkUqF+rQbsaK6GcmT7I+0pRoMPGJXguNbnn1E426gYxBLrWJ9dP0E/e
 +nl7N6Tk2bCBIqh6qAdxw4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ss1
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RHoFq/QpF5N1H2mxa1u
 UkkC1QZvibLEmhJl1dlCGdnDUIFgxesEMKh2Xo20cL6vaJOg7SQ/Ax9L6xNCGpt3bI9esMoJ
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvHLf2x4Uh2bD30XklW6voJhiKorzP0d
 Mee/309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv0Uso5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHrIkd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MS2AtPTWu4hjDrRCy8/BrYvQQFu+oQoV4ridSt0kc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.88,371,1635220800"; 
   d="scan'208";a="64261680"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gj1ihSJ4ZUfXaQu6Gh2oSaSzCXQvzyt8RUnbc5tE9m0vybi4aorjvlyAf9+SC2vH6nLn8prYVgymjOaFHrMUTmsK0lJIlFyJ6WsnVwXOpqpJjjnVp8VxoYVeEGzeAyC5vM1daixYA04+2yD2kH5UkFiNynGcRE2g/gy4k0DEB1UA2P0sbaR3iTSI+Km6CTSssX5ioA3u3KyxXtCW0ofGmmfg6A+U6Iqa1tPeZa5JZIC+zsH7p1e79twqg6hJqlZseoenEVi1B+BiWjSFBO3J63VUzSun4C4DADrN/pmCgzFhPgeFoUEr++YrbXS7wgBOECNoAPJAa0Ww2XbL2QwpFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRjKM8olk6HBnkJWLXgrzrwMBSbHlR+uBcK19SFdVD4=;
 b=W140MHVrHpj31pv9iJCk62CwBuT0I74PzA/RHGexevwN2UEekmlDupKbSQ3dP+WsHZYH8rW7jlA+lT4e7iK73m28TOuB5ogLJ07KJtI87kIZyIKqV/gwKVjKSwPsNO65TKVdSmgcYMnRw8nLtjoHmbxfmCsYg8Pbwd0xoMAf5wrf/iQM6ni0aZWSQc3D8so5gEMkS63/UHk2NL7BkgoJOXOuXmobP+NgA+CJzr30g9P0ye2u3JWkXQIh4ISUrKX3sRddHvDlyesalWJP0NxCwHZJbCGGfRWrGez8lYjf2cW0jz+FyKjG+IsI1ytebV/hAQur64WjrCLtWcqG+g7e8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRjKM8olk6HBnkJWLXgrzrwMBSbHlR+uBcK19SFdVD4=;
 b=j3mjjo4gmE8PSkTfOI7knCQcJFloZWwRkf+GXv3IYLZxC/lH7F9VKRou//eoME09iqyQSCR+nroGXIdnI8UsdEtj2gXQFtglukp+WMuO5C/c9ViJ7JVL1uDQGznqi7/MRwr6w2MVxWaJafwDJ2RblAwmNS8d3BrJvUaYkzE7cg0=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYHE+TdJl64aH33EedeR0PZ4zblKyMkj6AgAGTLwCAABdDgIAABJKAgATOw4CAAAIAAIAAQJgAgADqygCAADOdAIAAAYiAgABRRgCAAALfgIAAFCIA
Date: Tue, 15 Feb 2022 16:33:15 +0000
Message-ID: <c548b7cb-dc83-b591-d82e-0c70490a38d2@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
 <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
 <YgZIo9VQktcqGHTD@Air-de-Roger>
 <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
 <6c9400b8-7c76-34c8-f69e-3fad1eb53b8c@citrix.com>
 <101b0950-b7f2-119b-b654-574a71cec3bc@suse.com>
 <1bac0507-9420-f0b9-f846-f1c73bf9678d@citrix.com>
 <42fb3257-0c36-c156-c81b-f70dd5f247aa@suse.com>
 <9721222d-1c0d-ddaf-fbc6-801f5d9445f5@citrix.com>
 <12727658-68f4-1785-9b37-c948eb2cba71@suse.com>
 <9ed50d7a-23c7-2405-ff5e-15cc02b0c67f@citrix.com>
 <7fbc16f6-4175-06e8-742c-9aa8c7eb3e91@suse.com>
In-Reply-To: <7fbc16f6-4175-06e8-742c-9aa8c7eb3e91@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b523016b-a162-46c4-9d79-08d9f0a0dd9a
x-ms-traffictypediagnostic: BN7PR03MB3539:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <BN7PR03MB353918E50F6036E8C3F387E981349@BN7PR03MB3539.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2BZuS6gUXBbvfDIwb0RyVJO6YlsprD7lbLa3SdZMeFMTGpYGrwaCwjpZncCYfzuAAgiFBlNPC/hho3qS7pGtpJE+g7iKdzRFk17lUfVN55DXZUS/uirB1pDI9iJ29fDyLJQ6ANIgf1hK1TDOtQjlYIFP1g6chg7jGR7yz2RzAV5GOQ+mx6Fjm1BOfGeP6fnArXpZuOfpdbYNZERZK9pWfpvi4s10CFYNKj4YiAuPiCsI5N7iS3u2ALZIAEiuzQfDm3iUXOY8QmYvHqHMTaZqvNpNyAsfkQpuhPF2Q+fZS48pPpKNp3tQ9XbtzvKUo3xO9nB/VymWMEjD6+LRvwe3ecglSIkzpohqqtQl+Ltm7J/7UfEKOukjSr44NJ4gHCX3gt8U8yZjKTB8M/UB8+FjgOR64xBpceje7f3697ERGfhQiALBsZFoaK3Xg4BF4AcilC21vXqbjDw3e8lzhcOvq00DYakyo/As/wgnyVR5mDLzshDT0xO59HCwehvszVrPLMRSwRssXICGKTFbBtD9tAvDCbs8XDnpQ8Fg9NLQjwdxFG30ayBg+gi1b4ZdI2F6mvWOh5pEkKrpTpFufk+HIGeovvpdnsEvgc8+1fzrRDJsoQLnBW5Y2yt+Jq01KfKGGjD5n/Fe3IJ+fw1C8B0+2WxoDsViq6QjsmbF7DYOt4vy8uuuNnTXlzLmXQThIv08nkMUHupFQ9EA4Gun4W18F8Fk8J6hWpJtt5rG5VbFAt9bWpip5HR2vrL1WB8JAVhZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB3391.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(107886003)(186003)(26005)(2616005)(5660300002)(2906002)(7416002)(8936002)(6512007)(53546011)(71200400001)(6506007)(83380400001)(6486002)(508600001)(122000001)(8676002)(31686004)(4326008)(38100700002)(86362001)(76116006)(54906003)(110136005)(6636002)(91956017)(38070700005)(31696002)(82960400001)(66556008)(66476007)(64756008)(66446008)(66946007)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3laNDh3ZHZhTG9kU2tZOXhmWmRTck1YQndyNnZlY1lsb3JveXA2MU9SK0wv?=
 =?utf-8?B?M3FUbjh6TkpUZUJxSEhwSWVTQ0xOMkxtTzRGczQ4ckJielVvZXNyWFlhaEJj?=
 =?utf-8?B?M29ZRnhqdWtoRWFNQ1FTVnQ0TW56cUx4b0ZvaW9DSGg4TmgrWDNRTS9nOXdx?=
 =?utf-8?B?TEJIemdTR2VDQ0c5Z21kRUhyc0MxZ1hzb1Ftekd0dmZWK01Sak5WRXFHRzRK?=
 =?utf-8?B?b3VscDluTHFMNG43QnZnU1BROEp3WGM2Vk80cEViakJJbTRXcnlyUkdYZ1lS?=
 =?utf-8?B?WmpKcjFKVUZIU1V6YkhzeDhQN2I2OXZGVWN4ZG5HbXc5aTk2aXNKWkxQaWpQ?=
 =?utf-8?B?VkFGRnI1R04vV2NRTDBmOForN0VZdnZxUzhpU0tlandTUFpUbWtBNHpJcDE0?=
 =?utf-8?B?Z2RHclR0UjdQU0NqNkdjYjU0K25TZlRaclVoV0lRRG52WnFjU0FVVVR4SjhV?=
 =?utf-8?B?eUJZWm8zbmd6ZFdWRFFOeTFobkNhYkpwcWN2dWFkZjlyeFI2ekE4ZlhOQmsv?=
 =?utf-8?B?cGQyVGx2Wmw2L2lTRmN0Q09GbnFpOFZwRE5JK3dWYmZBbWNZUGVvRWpOSU0v?=
 =?utf-8?B?U3h1REc1bGxQU21oWmphS0lOdEtJUXpzZ0VMdWFoT3VpOGh0djdBL2JyS1Y4?=
 =?utf-8?B?R1R0WEczTkVuTDV3bGpiWHpDUzhZMERyekc3UlpLNUNDRmlSTkJPUjlpRFlC?=
 =?utf-8?B?NWZPSm90UUJmdm1OcnJSWEZNcUtSU1FyMDZ0dUpGQVMvQVdlRDFPYys5VnJs?=
 =?utf-8?B?a3ZEbXRqODk0OXdPeEFvNDQ4NDJodm90MVdlQi9hL21ZREpGU2NGUnNwMERZ?=
 =?utf-8?B?Sms0R0J6dDgxVStJbHNyS3hPM0E2ZEo2c1BpRmpFVDJPRUl1dXQ4MTZLZ0Vr?=
 =?utf-8?B?KzJ0Ukl1QVhVdHg1T1N6Y0NGeG1ubEtyQ0s4cnhEY3BOdWZoSFpvRGhVejho?=
 =?utf-8?B?d3d5VFh2SmpKUVdCcEdpQVNkdnh1Nm14R20raFYzNCtqK21nVGd3ZE90Y0FZ?=
 =?utf-8?B?K2h3cEN3eE01TTdkY3VqNjA0N3FpeTJkRmtDR2pocGFqV3hwenY0a05YaGtn?=
 =?utf-8?B?Zk5CT0R1RWszV09Nd0M1ZFZrbFBKRHgrd2tyb1lGNW9VMzRrcTVxNlVRVkRO?=
 =?utf-8?B?R2Mrc0t0dmZIY2ZkSDNrc2U2dXllYmVqOTBnazNoeU9wSjdnWEJOZ2JEdzZW?=
 =?utf-8?B?QlQ0ZHNrTVkvN3luajY4eHVoU25EcUR4YzhUWnVyOHZUdGpSM2JLVzRkTmlL?=
 =?utf-8?B?M1dDZGsvenhVK3hSUExlZjJGWTdVWXN1M0xGSDFoTW81NDMxem03cWZMTnVI?=
 =?utf-8?B?ZFlyMzZ3dFlTYTFZV1JXejgzTDMrVXc1TjMyS3RjaG03bVV0cmU2RUN5SlR1?=
 =?utf-8?B?a1FmTlhiNnhsczZvSVZsdFJwM2pnOU1NalVZSVArL200T0RtS21DRGlsVjkz?=
 =?utf-8?B?cDJ2eGgxa2YxQ1VGVDkrWk9RS3hnOS9aUlpuVDFVZC9wdmhuTlNEODhaWkJX?=
 =?utf-8?B?bURnemZoL0xuWmZPSUEzNjZYVzlpNFBkTXhhb2h0VGtUN1M0U29yV1g3aDFv?=
 =?utf-8?B?S25RRUtueGpUekpCR0dncWlWeHJLaG1aMlJYdld5ZDlWbmMzTWpGZDl6TnBO?=
 =?utf-8?B?VHpkcHRoMFZ3NWF0YmZPdDBiaCtyc1gzVi83MjY4K3VPNnlKanUxS2NVR2RV?=
 =?utf-8?B?dysyMXVBZnNoOUFyNmgvYzM5TUhuN1RBZms0a2pyL1BDbi9zOUkzVG1ob2Y5?=
 =?utf-8?B?RjFQR3RGendBZk9VTDZaeURmaVR2VFdPK0RiSWk0eGZZY1N4azVwWE0wam5I?=
 =?utf-8?B?Q0EzR2R6dmxUekx4OTNZS3JXRUovVXBFcWlNdExFd25UeHRzUk8yRzVRNUpB?=
 =?utf-8?B?UUJNOXczMWEvVDFPelN1NXhHUDltUUdiMzY0Zys3dzJCa1V1Q0tJejZKdmll?=
 =?utf-8?B?YzN1OVphNjlVbGFEUWRSZExDWG5FZS9EYklHUkVSZnplaDlrRVdqVjNLdUZy?=
 =?utf-8?B?NVo5am90T3hweFRWWmtPcWt3ZUROeDFaME9NUDh1b2J4T1dHUmVJOU1VT0RW?=
 =?utf-8?B?akdaeGhWZ2RZM3ZsRXc2SEFkcGJwc2RoQVo5UVVDZFdtRllFZHVqcUt6ZTJY?=
 =?utf-8?B?aForTkVwNk9nSlVCdU9BTElVOHJ0VGdoQUhHM05vWGtrVFE0UlR6OENrbEIx?=
 =?utf-8?B?SkpLM1o2Z2VxaEVva0FlMDJ6ekQ5bEhDeWFOZzBNb2RuMCszcUUyTVdUM0JY?=
 =?utf-8?Q?PuveBNot4FEMok4XWZrRVGgAhtA17WZsgnZH8R0qlw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94411495C640F44298DE344FB64A77C6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB3391.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b523016b-a162-46c4-9d79-08d9f0a0dd9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 16:33:15.2185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VM+06Ly+w1/EbQhSnWC/4ijQyrcHy9BHfDRfbPZ27xlLxUK5mpEB2FzY38zGEuXHlbhSy/6q6AUmrYT8HoMD+wE/Wojz46YxklCmFRVWEHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3539
X-OriginatorOrg: citrix.com

T24gMTUvMDIvMjAyMiAxNToyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDE1LjAyLjIwMjIgMTY6MTAsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBPbiAxNS8wMi8yMDIyIDEwOjE5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBbQ0FV
VElPTiAtIEVYVEVSTkFMIEVNQUlMXSBETyBOT1QgcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pj4NCj4+PiBPbiAxNS4wMi4yMDIyIDExOjE0LCBKYW5l
IE1hbGFsYW5lIHdyb3RlOg0KPj4+PiBPbiAxNS8wMi8yMDIyIDA3OjA5LCBKYW4gQmV1bGljaCB3
cm90ZToNCj4+Pj4+IFtDQVVUSU9OIC0gRVhURVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xp
Y2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4+Pj4+DQo+Pj4+PiBPbiAx
NC4wMi4yMDIyIDE4OjA5LCBKYW5lIE1hbGFsYW5lIHdyb3RlOg0KPj4+Pj4+IE9uIDE0LzAyLzIw
MjIgMTM6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBbQ0FVVElPTiAtIEVYVEVSTkFM
IEVNQUlMXSBETyBOT1QgcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIDE0LjAyLjIwMjIgMTQ6MTEsIEphbmUgTWFsYWxh
bmUgd3JvdGU6DQo+Pj4+Pj4+PiBPbiAxMS8wMi8yMDIyIDExOjQ2LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4+Pj4+PiBbQ0FVVElPTiAtIEVYVEVSTkFMIEVNQUlMXSBETyBOT1QgcmVwbHksIGNs
aWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pj4+Pj4+Pj4NCj4+Pj4+
Pj4+PiBPbiAxMS4wMi4yMDIyIDEyOjI5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+
Pj4+PiBPbiBGcmksIEZlYiAxMSwgMjAyMiBhdCAxMDowNjo0OEFNICswMDAwLCBKYW5lIE1hbGFs
YW5lIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4gT24gMTAvMDIvMjAyMiAxMDowMywgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToNCj4+Pj4+Pj4+Pj4+PiBPbiBNb24sIEZlYiAwNywgMjAyMiBhdCAwNjoyMTow
MFBNICswMDAwLCBKYW5lIE1hbGFsYW5lIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1j
cy5jDQo+Pj4+Pj4+Pj4+Pj4+IGluZGV4IDdhYjE1ZTA3YTAuLjQwNjBhZWYxYmQgMTAwNjQ0DQo+
Pj4+Pj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYw0KPj4+Pj4+Pj4+
Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMNCj4+Pj4+Pj4+Pj4+Pj4gQEAg
LTM0Myw2ICszNDMsMTUgQEAgc3RhdGljIGludCB2bXhfaW5pdF92bWNzX2NvbmZpZyhib29sIGJz
cCkNCj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgIE1TUl9JQTMyX1ZNWF9QUk9DQkFT
RURfQ1RMUzIsICZtaXNtYXRjaCk7DQo+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgfQ0KPj4+Pj4+
Pj4+Pj4+PiAgICAgICAgDQo+Pj4+Pj4+Pj4+Pj4+ICsgICAgLyogQ2hlY2sgd2hldGhlciBoYXJk
d2FyZSBzdXBwb3J0cyBhY2NlbGVyYXRlZCB4YXBpYyBhbmQgeDJhcGljLiAqLw0KPj4+Pj4+Pj4+
Pj4+PiArICAgIGlmICggYnNwICkNCj4+Pj4+Pj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+Pj4+Pj4+
ICsgICAgICAgIGFzc2lzdGVkX3hhcGljX2F2YWlsYWJsZSA9IGNwdV9oYXNfdm14X3ZpcnR1YWxp
emVfYXBpY19hY2Nlc3NlczsNCj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgYXNzaXN0ZWRfeDJhcGlj
X2F2YWlsYWJsZSA9IChjcHVfaGFzX3ZteF9hcGljX3JlZ192aXJ0IHx8DQo+Pj4+Pj4+Pj4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1X2hhc192bXhfdmlydHVh
bF9pbnRyX2RlbGl2ZXJ5KSAmJg0KPj4+Pj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY3B1X2hhc192bXhfdmlydHVhbGl6ZV94MmFwaWNfbW9kZTsNCj4+Pj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+IEkndmUgYmVlbiB0aGluayBhYm91dCB0aGlzLCBhbmQgaXQg
c2VlbXMga2luZCBvZiBhc3ltbWV0cmljIHRoYXQgZm9yDQo+Pj4+Pj4+Pj4+Pj4geEFQSUMgbW9k
ZSB3ZSByZXBvcnQgaHcgYXNzaXN0ZWQgc3VwcG9ydCBvbmx5IHdpdGgNCj4+Pj4+Pj4+Pj4+PiB2
aXJ0dWFsaXplX2FwaWNfYWNjZXNzZXMgYXZhaWxhYmxlLCB3aGlsZSBmb3IgeDJBUElDIHdlIHJl
cXVpcmUNCj4+Pj4+Pj4+Pj4+PiB2aXJ0dWFsaXplX3gyYXBpY19tb2RlIHBsdXMgZWl0aGVyIGFw
aWNfcmVnX3ZpcnQgb3INCj4+Pj4+Pj4+Pj4+PiB2aXJ0dWFsX2ludHJfZGVsaXZlcnkuDQo+Pj4+
Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+PiBJIHRoaW5rIHdlIGxpa2VseSBuZWVkIHRvIGJlIG1vcmUg
Y29uc2lzdGVudCBoZXJlLCBhbmQgcmVwb3J0IGh3DQo+Pj4+Pj4+Pj4+Pj4gYXNzaXN0ZWQgeDJB
UElDIHN1cHBvcnQgYXMgbG9uZyBhcyB2aXJ0dWFsaXplX3gyYXBpY19tb2RlIGlzDQo+Pj4+Pj4+
Pj4+Pj4gYXZhaWxhYmxlLg0KPj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4gVGhpcyB3aWxsIGxp
a2VseSBoYXZlIHNvbWUgZWZmZWN0IG9uIHBhdGNoIDIgYWxzbywgYXMgeW91IHdpbGwgaGF2ZSB0
bw0KPj4+Pj4+Pj4+Pj4+IGFkanVzdCB2bXhfdmxhcGljX21zcl9jaGFuZ2VkLg0KPj4+Pj4+Pj4+
Pj4+DQo+Pj4+Pj4+Pj4+Pj4gVGhhbmtzLCBSb2dlci4NCj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+
PiBBbnkgb3RoZXIgdGhvdWdodHMgb24gdGhpcz8gQXMgb24gb25lIGhhbmQgaXQgaXMgYXN5bW1l
dHJpYyBidXQgYWxzbw0KPj4+Pj4+Pj4+Pj4gdGhlcmUgaXNuJ3QgbXVjaCBhc3Npc3RhbmNlIHdp
dGggb25seSB2aXJ0dWFsaXplX3gyYXBpY19tb2RlIHNldCBhcywgaW4NCj4+Pj4+Pj4+Pj4+IHRo
aXMgY2FzZSwgYSBWTSBleGl0IHdpbGwgYmUgYXZvaWRlZCBvbmx5IHdoZW4gdHJ5aW5nIHRvIGFj
Y2VzcyB0aGUgVFBSDQo+Pj4+Pj4+Pj4+PiByZWdpc3Rlci4NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+
Pj4gSSd2ZSBiZWVuIHRoaW5raW5nIGFib3V0IHRoaXMsIGFuZCByZXBvcnRpbmcgaGFyZHdhcmUg
YXNzaXN0ZWQNCj4+Pj4+Pj4+Pj4geHsyfUFQSUMgdmlydHVhbGl6YXRpb24gd2l0aCBqdXN0DQo+
Pj4+Pj4+Pj4+IFNFQ09OREFSWV9FWEVDX1ZJUlRVQUxJWkVfQVBJQ19BQ0NFU1NFUyBvcg0KPj4+
Pj4+Pj4+PiBTRUNPTkRBUllfRVhFQ19WSVJUVUFMSVpFX1gyQVBJQ19NT0RFIGRvZXNuJ3Qgc2Vl
bSB2ZXJ5IGhlbHBmdWwuIFdoaWxlDQo+Pj4+Pj4+Pj4+IHRob3NlIHByb3ZpZGUgc29tZSBhc3Np
c3RhbmNlIHRvIHRoZSBWTU0gaW4gb3JkZXIgdG8gaGFuZGxlIEFQSUMNCj4+Pj4+Pj4+Pj4gYWNj
ZXNzZXMsIGl0IHdpbGwgc3RpbGwgcmVxdWlyZSBhIHRyYXAgaW50byB0aGUgaHlwZXJ2aXNvciB0
byBoYW5kbGUNCj4+Pj4+Pj4+Pj4gbW9zdCBvZiB0aGUgYWNjZXNzZXMuDQo+Pj4+Pj4+Pj4+DQo+
Pj4+Pj4+Pj4+IFNvIG1heWJlIHdlIHNob3VsZCBvbmx5IHJlcG9ydCBoYXJkd2FyZSBhc3Npc3Rl
ZCBzdXBwb3J0IHdoZW4gdGhlDQo+Pj4+Pj4+Pj4+IG1lbnRpb25lZCBmZWF0dXJlcyBhcmUgcHJl
c2VudCB0b2dldGhlciB3aXRoDQo+Pj4+Pj4+Pj4+IFNFQ09OREFSWV9FWEVDX0FQSUNfUkVHSVNU
RVJfVklSVD8NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IE5vdCBzdXJlIC0gInNvbWUgYXNzaXN0YW5j
ZSIgc2VlbXMgc3RpbGwgYSBsaXR0bGUgYmV0dGVyIHRoYW4gbm9uZSBhdCBhbGwuDQo+Pj4+Pj4+
Pj4gV2hpY2ggcm91dGUgdG8gZ28gZGVwZW5kcyBvbiB3aGF0IGV4YWN0bHkgd2UgaW50ZW5kIHRo
ZSBiaXQgdG8gYmUgdXNlZCBmb3IuDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRydWUuIEkgaW50ZW5k
ZWQgdGhpcyBiaXQgdG8gYmUgc3BlY2lmaWNhbGx5IGZvciBlbmFibGluZw0KPj4+Pj4+Pj4gYXNz
aXN0ZWRfeHsyfWFwaWMuIFNvLCB3b3VsZCBpdCBiZSBpbmNvbnNpc3RlbnQgdG8gcmVwb3J0IGhh
cmR3YXJlDQo+Pj4+Pj4+PiBhc3Npc3RhbmNlIHdpdGgganVzdCBWSVJUVUFMSVpFX0FQSUNfQUND
RVNTRVMgb3IgVklSVFVBTElaRV9YMkFQSUNfTU9ERQ0KPj4+Pj4+Pj4gYnV0IHN0aWxsIGNsYWlt
IHRoYXQgeHsyfWFwaWMgaXMgdmlydHVhbGl6ZWQgaWYgbm8gTVNSIGFjY2Vzc2VzIGFyZQ0KPj4+
Pj4+Pj4gaW50ZXJjZXB0ZWQgd2l0aCBYRU5fSFZNX0NQVUlEX1gyQVBJQ19WSVJUIChpbiB0cmFw
cy5jKSBzbyB0aGF0LCBhcyB5b3UNCj4+Pj4+Pj4+IHNheSwgdGhlIGd1ZXN0IGdldHMgYXQgbGVh
c3QgInNvbWUgYXNzaXN0YW5jZSIgaW5zdGVhZCBvZiBub25lIGJ1dCB3ZQ0KPj4+Pj4+Pj4gc3Rp
bGwgY2xhaW0geHsyfWFwaWMgdmlydHVhbGl6YXRpb24gd2hlbiBpdCBpcyBhY3R1YWxseSBjb21w
bGV0ZT8gTWF5YmUNCj4+Pj4+Pj4+IEkgY291bGQgYWxzbyBhZGQgYSBjb21tZW50IGFsbHVkaW5n
IHRvIHRoaXMgaW4gdGhlIHhsIGRvY3VtZW50YXRpb24uDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRvIHJl
cGhyYXNlIG15IGVhcmxpZXIgcG9pbnQ6IFdoaWNoIGtpbmQgb2YgZGVjaXNpb25zIGFyZSB0aGUg
Y29uc3VtZXIocykNCj4+Pj4+Pj4gb2YgdXMgcmVwb3J0aW5nIGhhcmR3YXJlIGFzc2lzdGFuY2Ug
Z29pbmcgdG8gdGFrZT8gSW4gaG93IGZhciBpcyB0aGVyZSBhDQo+Pj4+Pj4+IHJpc2sgdGhhdCAi
c29tZSBhc3Npc3RhbmNlIiBpcyBvdmVyYWxsIGdvaW5nIHRvIGxlYWQgdG8gYSBsb3NzIG9mDQo+
Pj4+Pj4+IHBlcmZvcm1hbmNlPyBJIGd1ZXNzIEknZCBuZWVkIHRvIHNlZSBjb21tZW50IGFuZCBh
Y3R1YWwgY29kZSBhbGwgaW4gb25lDQo+Pj4+Pj4+IHBsYWNlIC4uLg0KPj4+Pj4+Pg0KPj4+Pj4+
IFNvLCBJIHdhcyB0aGlua2luZyBvZiBhZGRpbmcgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBv
ZjoNCj4+Pj4+Pg0KPj4+Pj4+ICs9aXRlbSBCPGFzc2lzdGVkX3hhcGljPUJPT0xFQU4+IEI8KHg4
NiBvbmx5KT4NCj4+Pj4+PiArRW5hYmxlcyBvciBkaXNhYmxlcyBoYXJkd2FyZSBhc3Npc3RlZCB2
aXJ0dWFsaXphdGlvbiBmb3IgeEFQSUMuIFRoaXMNCj4+Pj4+PiArYWxsb3dzIGFjY2Vzc2luZyBB
UElDIHJlZ2lzdGVycyB3aXRob3V0IGEgVk0tZXhpdC4gTm90aWNlIGVuYWJsaW5nDQo+Pj4+Pj4g
K3RoaXMgZG9lcyBub3QgZ3VhcmFudGVlIGZ1bGwgdmlydHVhbGl6YXRpb24gZm9yIHhBUElDLCBh
cyB0aGlzIGNhbg0KPj4+Pj4+ICtvbmx5IGJlIGFjaGlldmVkIGlmIGhhcmR3YXJlIHN1cHBvcnRz
IOKAnEFQSUMtcmVnaXN0ZXIgdmlydHVhbGl6YXRpb27igJ0NCj4+Pj4+PiArYW5kIOKAnHZpcnR1
YWwtaW50ZXJydXB0IGRlbGl2ZXJ54oCdLiBUaGUgZGVmYXVsdCBpcyBzZXR0YWJsZSB2aWENCj4+
Pj4+PiArTDx4bC5jb25mKDUpPi4NCj4+Pj4+DQo+Pj4+PiBCdXQgaXNuJ3QgdGhpcyBjb250cmFk
aWN0b3J5PyBEb2Vzbid0IGxhY2sgb2YgQVBJQy1yZWdpc3RlciB2aXJ0dWFsaXphdGlvbg0KPj4+
Pj4gbWVhbiBWTSBleGl0cyB1cG9uIChtb3N0KSBhY2Nlc3Nlcz8NCj4+Pj4NCj4+Pj4gWWVzLCBp
dCBkb2VzIG1lYW4uIEkgZ3Vlc3MgdGhlIGFsdGVybmF0aXZlIHdvdXVsZCBiZSB0aGVuIHRvIHJl
cXVpcmUNCj4+Pj4gQVBJQy1yZWdpc3RlciB2aXJ0dWFsaXphdGlvbiBmb3IgZW5hYmxpbmcgeEFQ
SUMuIEJ1dCBhbHNvLCBhbHRob3VnaCB0aGlzDQo+Pj4+IGRvZXNuJ3QgcHJvdmlkZSBtdWNoIGFj
Y2VsZXJhdGlvbiwgZXZlbiBnZXR0aW5nIGEgVk0gZXhpdCBpcyBzb21lDQo+Pj4+IGFzc2lzdGFu
Y2UgaWYgY29tcGFyZWQgdG8gaW5zdGVhZCBnZXR0aW5nIGFuIEVQVCBmYXVsdCBhbmQgaGF2aW5n
IHRvDQo+Pj4+IGRlY29kZSB0aGUgYWNjZXNzLg0KPj4+DQo+Pj4gSSBhZ3JlZSBoZXJlLCBhbGJl
aXQgSSdkIGxpa2UgdG8gbWVudGlvbiB0aGF0IEVQVCBmYXVsdHMgYXJlIGFsc28gVk0NCj4+PiBl
eGl0cy4gQWxsIG15IGVhcmxpZXIgY29tbWVudCB3YXMgYWJvdXQgaXMgdGhhdCB0aGlzIHBpZWNl
IG9mIGRvYw0KPj4+IHdhbnRzIHRvIGV4cHJlc3MgcmVhbGl0eSwgd2hpY2hldmVyIHdheSBpdCBp
cyB0aGF0IHRoaW5ncyBlbmQgdXANCj4+PiBiZWluZyBpbXBsZW1lbnRlZC4NCj4+DQo+PiBPaCB5
ZXMuIFJpZ2h0LCBJIHNlZSBob3cgdGhpcyBpbmZvIGNvdWxkIGJlIG1pc2xlYWRpbmcuDQo+Pg0K
Pj4gSG93IGFib3V0IHRoaXM/Li4uDQo+IA0KPiBHZXR0aW5nIGNsb3NlLiBUaGUgdGhpbmcgSSBj
YW4ndCBqdWRnZSBpcyB3aGV0aGVyIHRoaXMgbGV2ZWwgb2YgdGVjaG5pY2FsDQo+IGRldGFpbCBp
cyBzdWl0YWJsZSBmb3IgdGhpcyBkb2MuIEp1c3Qgb25lIGZ1cnRoZXIgcmVtYXJrOg0KDQpVbnN1
cmUgdG9vLg0KDQo+PiArPWl0ZW0gQjxhc3Npc3RlZF94YXBpYz1CT09MRUFOPiBCPCh4ODYgb25s
eSk+DQo+PiArDQo+PiArQjwoeDg2IG9ubHkpPiBFbmFibGVzIG9yIGRpc2FibGVzIGhhcmR3YXJl
IGFzc2lzdGVkIHZpcnR1YWxpemF0aW9uIGZvcg0KPj4gK3hBUElDLiBXaXRoIHRoaXMgb3B0aW9u
IGVuYWJsZWQsIGEgbWVtb3J5LW1hcHBlZCBBUElDIGFjY2VzcyB3aWxsIGJlDQo+PiArZGVjb2Rl
ZCBieSBoYXJkd2FyZSBhbmQgZWl0aGVyIGlzc3VlIGEgVk0gZXhpdCB3aXRoIGFuIGV4aXQgcmVh
c29uDQo+PiAraW5zdGVhZCBvZiBhbiBFUFQgZmF1bHQgb3IgYWx0b2dldGhlciBhdm9pZCBhIFZN
IGV4aXQuIE5vdGljZQ0KPiANCj4gQXMgc2FpZCBiZWZvcmUsIEVQVCBmYXVsdHMgYWxzbyBhcmUg
Vk0gZXhpdHMgYW5kIGFsc28gcHJvdmlkZSBhbiBleGl0DQo+IHJlYXNvbi4gVGhlcmVmb3JlIG1h
eWJlICIuLi4gYW5kIGVpdGhlciBpc3N1ZSBhIFZNIGV4aXQgd2l0aCBhIG1vcmUNCj4gc3BlY2lm
aWMgZXhpdCByZWFzb24gdGhhbiBhbiBFUFQgZmF1bHQgd291bGQgcHJvdmlkZSwgb3IgYWx0b2dl
dGhlcg0KPiBhdm9pZCBhIFZNIGV4aXQiIG9yICIuLi4gYW5kIGVpdGhlciBpc3N1ZSBhIG1vcmUg
c3BlY2lmaWMgVk0gZXhpdCB0aGFuDQo+IGp1c3QgYW4gRVBUIGZhdWx0LCBvciBhbHRvZ2V0aGVy
IGF2b2lkIGEgVk0gZXhpdCI/DQoNClllcywgdGhhdCdzIGJldHRlci4NCg0KVGhhbmsgeW91LA0K
DQpKYW5lLg==

