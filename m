Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8248B81358
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 19:40:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125473.1467416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyw82-0000pz-1y; Wed, 17 Sep 2025 17:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125473.1467416; Wed, 17 Sep 2025 17:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyw81-0000nZ-Uq; Wed, 17 Sep 2025 17:39:37 +0000
Received: by outflank-mailman (input) for mailman id 1125473;
 Wed, 17 Sep 2025 17:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZihP=34=citrix.com=alex.brett@srs-se1.protection.inumbo.net>)
 id 1uyw80-0000mz-B0
 for xen-devel@lists.xen.org; Wed, 17 Sep 2025 17:39:36 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45e1031f-93ed-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 19:39:35 +0200 (CEST)
Received: from BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 by DS7PR03MB5656.namprd03.prod.outlook.com (2603:10b6:5:2d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 17:39:31 +0000
Received: from BN9PR03MB6027.namprd03.prod.outlook.com
 ([fe80::1479:e1e0:cc3f:e779]) by BN9PR03MB6027.namprd03.prod.outlook.com
 ([fe80::1479:e1e0:cc3f:e779%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 17:39:31 +0000
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
X-Inumbo-ID: 45e1031f-93ed-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZYxPBQ9ev9HMVyLrAukRZrBMxB/BGDl2nZc+zy2me3f5auSQ/b0A2vPr0sVlOtFVeClckEHmC05KbTQx9sGj2t3Ikoj8IE4o5U4RnSiSv3JtzjcoSsG+9GEd3IiELRXHVqegyo6KfJvDzWVqvLU2di2tfqLDV7FaquTsVIfRtaWNgsTThfFjhr/LNvLoPhTyCoyek0hYNZTismgOJ10ylP3Gg24kaLrT6xd9Zg/rBlnhXPWHH4tQp6dy9UasxR8wYNMsR1AP72Nj8dLqpv18cnnS/++G796VgRvXcLedLP08bpghezhD5hpcYmAOHTZL3msaHy8WN+gCICWRKUrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMUz5YWKZbS1DiZwLy5+Q9SeTceii7ScuxGwx2YOxWk=;
 b=QyySDQ52cmtjODUSswCKDhZKHq3kf90ydo/3PJX42pjOJH8Ogr88A1RLrNXnqXvtx4laCIvqDkLZDPi7QNZLGLCJwvV+LDj96Nimat3aDWEEsyk+/beCIdPKlmJZG9Ud4kFAPmbihKsRNY8f8FBt5MHyFIBqFIu0s4VresgvmJruvFGqyLkt9nTn9gUEuE2E6owAab18tEytklBjGIrmf2maD5kw4RbjIUlTrRt86Eu2d6UlC8X6YAP9jXVWiSjh+m4TAwt0tDXF9m8McsyyptonU1u9HL4jujOemHucm7+rpatMsp3ZcshSNugVjMlOuGsfSAyCrnvy8yGlsDhBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMUz5YWKZbS1DiZwLy5+Q9SeTceii7ScuxGwx2YOxWk=;
 b=VxgqNwsXnOh+8PEnm06wzzzdIn0QL4cDSVUolcIXVWGMmWeUEV87A3jBl6M21wiprD+tqnYn6VdIQguclcLFYuF5BMO1RawslK1Mi4EBog12BV3O+jzyEDdqi4tkDWs02efqColuup5mis3zQ0BzUsy/QyDkT5ri3zlXjF1KEA0=
From: Alex Brett <alex.brett@citrix.com>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Xen Summit 2025 - "feature tracking for releases" design session
 notes
Thread-Topic: Xen Summit 2025 - "feature tracking for releases" design session
 notes
Thread-Index: AQHcJ/naHDfZdbPcJE+n2aX6bSqg1A==
Date: Wed, 17 Sep 2025 17:39:31 +0000
Message-ID:
 <BN9PR03MB6027E4B4931A5FBD744741B7E317A@BN9PR03MB6027.namprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR03MB6027:EE_|DS7PR03MB5656:EE_
x-ms-office365-filtering-correlation-id: 77eae75d-3e57-493c-a56c-08ddf61128dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?i7D2bXbOPyi1xbLv84YxDbBNF5EH32Api1Di8+9qOyi/0k0udNZXXy4bkM?=
 =?iso-8859-1?Q?XV3peP4LOfQeKD5uvw8ZbZuWoUpPoiZicjurhytDeFqyg8aeLK72WfIC71?=
 =?iso-8859-1?Q?vPHfl1jSpNpNZCDtR0MWGBGlfCNSo3J1EFpVMkFXG1ILxkNl8aY9/Pf6st?=
 =?iso-8859-1?Q?KAy+FYuNnWRwZPQ5VFNzdrGfMY13ZcCZdSV9i+c3mxXf30b2PaRepbOWkm?=
 =?iso-8859-1?Q?fU3AUL9R8mLvOIU+dVIuT+02vDDPTd9J47gzhJrpbmCaYWDrtUOaYfhgbS?=
 =?iso-8859-1?Q?r2g3LiTW/CzbsxRTscccz5Viwbz8mWlXOyZsZZa6oBJQaR1VERMqZEs6Da?=
 =?iso-8859-1?Q?a0j7qIHD6eJDPPQcN/Hf/WLKDM6afDUpyshSkYMMCrDmfxM1b2O6z4MjwM?=
 =?iso-8859-1?Q?BnVigTX7etiOk/ZyN3Z2sJH3rRZsGplhUe1wv+mZWzXNEfe2CaoEt4WOCI?=
 =?iso-8859-1?Q?xCEgJgnpjAU8z+6IAwW5EXBgMC3rzX2lq0VCkanmezvlOgva2el5IvbNEn?=
 =?iso-8859-1?Q?adzpR7imFIx1KRPL2CmYWK9MsbRUWQvoGWCgnmDgznUuyBxjCmlHGMrX7G?=
 =?iso-8859-1?Q?0aFvBrtMB3IyebTcgqQUtn7v7okcfhZAHJVHC+sdrvBPd1TsOgb2eNjXV7?=
 =?iso-8859-1?Q?z1S5Q6c1Hba9zBn1eRUo6h9/6dmMQS95XnPXWvf4gyNLyEIpcwOfAk2JlL?=
 =?iso-8859-1?Q?OMk+JGiBX6/GnBvvMwwcV3WXezgAEeCYhBUgy242nuhczSztCHtBxd9bBU?=
 =?iso-8859-1?Q?4HxWqqtkXMeaQmG3yL/n9q1i3r6wCa1PwGN0rPVYrw3CCYqMFZITCbtpkW?=
 =?iso-8859-1?Q?UdeK8OHYPcaj1+wsH0bG3SRgO+9AilkH4GpJkav85GVikX/gPGQisxPVnD?=
 =?iso-8859-1?Q?yzQmsbRKrP84jwaaFFDf2xHDGIswaltd9g0049SSfE5TP1GqZ+gaxzA6W0?=
 =?iso-8859-1?Q?DooVXurfs/rRWd6SlbZ5bw+pegD/Mp9zHN7uHd5WOJKZKfMHTDyJG6LcGv?=
 =?iso-8859-1?Q?bvSp7Q3Y84YTT90ghZ7cV6Utn0xWkv13zuF/6IJ/K/njFxgvd2jSOD+tA3?=
 =?iso-8859-1?Q?TIMoJojstHRBNGCehWYyMGmz1ufZzOsbJE5C8QezJoJPTgpaJqalZEDcRF?=
 =?iso-8859-1?Q?tfr2zYgFe3LE29xw19gK5/pyhAJrRAcf0Rl+nB+8+TAEi+LCUf7IBzgDFB?=
 =?iso-8859-1?Q?mGMyhlbGoAHbzyyPS5JxoCX39Hef5kTbqlBc777aVSUa3S6aRNYqvmT8UQ?=
 =?iso-8859-1?Q?YVXpsjzlnZeq/7QaJMj2FzEolIh6/cnxX/1pW5MGkYKfnX9UZEklukLwEL?=
 =?iso-8859-1?Q?YwLoC+l0ldJcOQv1jt/QBZg6aRAPLW05LnXb2PjHbQqfNBEsg5vmui7Lzb?=
 =?iso-8859-1?Q?3Wa3ieT144+sf3lJi4wJRfvQBSTJisICp7AhhiQ8O0DNTLVzqj154cNs0F?=
 =?iso-8859-1?Q?ebdXEF7PnETFi33sVQt+s8QLI4JuIZNneE6ekAHbddDBD27j/ULgfbPQ4q?=
 =?iso-8859-1?Q?1RTjsC6jfoeY7+f7RK8K4TpP1QZAnXu3dyZEy10+qvWw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6027.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VASlKnyu3dZKbtQFBd/Bx29uR0tSrLiNLRk1YuKu1g7MUhwpC6DiPhCvrP?=
 =?iso-8859-1?Q?sMDfZ2P7vaDL6MrHyyQSvRsgHQmNGD3cQQVg7zf671mCFvuspX95EZvwSh?=
 =?iso-8859-1?Q?0unPCxFAl/wD758G4oXOWcp/Ce7bs728Vnv8uS4/WNFAN7P5SyZEBiEI9D?=
 =?iso-8859-1?Q?XgoJMK10R4awx7E81lJUwZQLonpzDzuTpj1yqRlGxB7CDQL8LANGUITug8?=
 =?iso-8859-1?Q?yCDVxFqRIpwR8tOWdEiWZSSP1O9mgwfODQIpWQxEOVFuAhZUaOriWZtJTA?=
 =?iso-8859-1?Q?9ea+P5g9kSQ2puZTcK0ym+bdkde36d9MWvBC1EQti26KIMEQd0ESb/b0ny?=
 =?iso-8859-1?Q?1h26VMMWl9R3OHPGpCaMqPa8fyzQLt2BDE7PEhTRcTs0KyUwg4cWB+ukXy?=
 =?iso-8859-1?Q?m8vaA/7rS1h69TkEbfk4Zk0qRkqyk8ls4rllcLJpCGgo2EErA1eevOSA7q?=
 =?iso-8859-1?Q?6sTliEipg9BLgVPwvT5wOaQ9EqvhzkOEBdbcJuBBisYADz/7dNihmyI7YR?=
 =?iso-8859-1?Q?UGDoT59f00KLvyosGbjbRho4wsPOJO1l6l1Qa9ms20+3HUSHrwFZ0hEQ+j?=
 =?iso-8859-1?Q?EVrepSAAcidzbAiorRTlllituYBdkI8wJSrYV4eYsIkdUJGv81ds4YeTrP?=
 =?iso-8859-1?Q?NynNbt9RnLovTQBkeoQAuIHvvaBZycyiqUiCkQ2DhAbZPTjluZj2ZfwjV+?=
 =?iso-8859-1?Q?OETT0dPKGOrhBSd4zZGUfN+m/xLG3ljFSaPBnyJoiuA0jwAKJglYoilZC3?=
 =?iso-8859-1?Q?FRzamczeqcgKqyTTrLgA7F9rKq1Zi5kzuASfTMKtnd2LHFxNvHHpn65SAe?=
 =?iso-8859-1?Q?mxAZKIcMadv5TY4beUasmXZ+8uNW1mSP6xUDlLkGjQLxQxBh0USEdBSaww?=
 =?iso-8859-1?Q?GUwVVjCwcuqP7f4X9Mrg6xBIZtVTuOu6tLAOQjNnLXvWC7hhAjYGXHsK7D?=
 =?iso-8859-1?Q?iBHkHRT/PmjGXCNM/NpsLqS0i6aJWxi4sZsSjIkj3w+cmKZGQZi3SpOAZ8?=
 =?iso-8859-1?Q?ipwi6nt5sqBKFvigEg708qgtRIhsfYIC+nw8tk56ot8m7VWih0TK8BcM3g?=
 =?iso-8859-1?Q?hEKdpl5OnVw9dmLunJC55tFSz1B3p5uNI8MiLIHqeBkjjm0FVjWrpHNDup?=
 =?iso-8859-1?Q?wo8AnVre87rrg8n3Q7vtvoFHPN7qYms6Cdv5sgYtGsPsnUn9GNzwxwYCGf?=
 =?iso-8859-1?Q?LfnFfOnqmouawFCM0l5zXt4ji/r5bI76YyoX14jTw5y200EfPoNbUVCEFE?=
 =?iso-8859-1?Q?0/7FyO2hnfGN72WlGSa7OXbPt6eNZ4cSJJMb/Q+f+dUbcCkhhuCGu5ujnU?=
 =?iso-8859-1?Q?oT3G7V7FVSI8gaammb2FJOtBIXDYyh5oIOsQE254yaaYPE5AOuApBsW9Zo?=
 =?iso-8859-1?Q?FPihhihKPoZkrKmiSTHFbeQ1GvuKVQ/o+PW5Z/YLyo+OLGsgwsC/ntrd3C?=
 =?iso-8859-1?Q?Yg43GOhEp3tYzCrFc5jqt5TESG/Oy1PQ391biR4QQLjmd2DOS4BdvDjceW?=
 =?iso-8859-1?Q?iGURqAJBYkLBcu64R88WnyK5gJl+fcBnkMM+IiOscxnzzIKRxHX4tFpS1L?=
 =?iso-8859-1?Q?yLLTxIjK4jO7PgPTintm1N0VnDS06KxWpiOJ/aySxO/dnK0jmOy209wMwY?=
 =?iso-8859-1?Q?Qh2eylmpEtqM2F31srSNSxWT0tqt0ZVvJ+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6027.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77eae75d-3e57-493c-a56c-08ddf61128dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 17:39:31.6483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cFPbEgovjqPHn9KKA/koDgi3wIVIXR1ixftD1C8Ru7v63FRNI2If8KWsEPw/OYe1YqL7a8wg+/0vWiKyfP3pJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5656

(Apologies in advance for any misquotes etc)=0A=
=0A=
Jan Beulich (JB):=0A=
Intention is not to talk about 4.21 (largely done feature wise), plan is to=
 think about a more structured way of deciding e.g. at beginning of a relea=
se cycle what features we'd like to have in the release.=0A=
=0A=
What we have been doing is a large set of work with no plan, not taking int=
o account importance / ordering etc.=0A=
=0A=
Andrew Cooper (AC): Everything we do is reactive, patches come along and ma=
y go in may not.=0A=
=0A=
JB: Patches indicate someone is interested in functionality, but in some si=
tuations may go in quickly, others may not or be abandoned by author etc. H=
aving an overview of what people want in a release and are committed to wor=
king on (both author and reviewers etc) (AC: and necessary testing) would b=
e good.=0A=
=0A=
Is it something people think could work, if at beginning of release cycle w=
e settled on a plan of what we want in the release. New things can of cours=
e appear, but we'd be in a slightly better position of knowing what a relea=
se can bring?=0A=
=0A=
Rich Persaud (RP): Is there still a single release manager for each release=
? (room: Yes)=0A=
JB: Don't want to move away from that model=0A=
=0A=
AC: Tried to do this for the previous few releases, e.g. on the community c=
all presented "here's what XenServer is thinking of doing in the next relea=
se".=0A=
JB: Only the first step, then need to keep track of progress on things we i=
ntend to be in the release.=0A=
=0A=
RP: How do you transfer knowledge from old to new release manager?=0A=
=0A=
JB: New manager turns to old one with questions.=0A=
Oleksii Kurochko (OK): This time had short meeting where previous manager (=
Henry) told what he thought was necessary to know.=0A=
=0A=
Daniel Smith (DS): Useful for people to know which items to focus on that a=
re likely to make a release over e.g. review work on things which are not.=
=0A=
=0A=
AC: Complexity of review grows as series get larger. FRED example - went in=
 with 5 different series (some of which didn't say FRED). Splitting things =
up makes things easier to review and can end up with some parts getting in =
to some releases (even with no overall feature to talk about in that releas=
e).=0A=
=0A=
AC: Wherever possible we should be helping people to get parts of series in=
 to simplify remaining parts.=0A=
=0A=
Discussion around whether this would affect decisions as to what goes in. W=
hat about when authors have multiple things they're working on - clarificat=
ion around multiple things from same author or different authors (subtlety =
as e.g. XenServer may have 3 things from different authors but same manager=
s etc).=0A=
=0A=
Roger Pau Monne (RPM): Can't force people as to what they should review=0A=
JB: No, but if we had defined features for the release it would help review=
ers make their own decisions knowing what is more important=0A=
AC: Tricky in some cases, e.g. XenServer and secure boot - we said it was t=
he most important thing for us, but then nothing happened for ages. Importa=
nce therefore decreased as it became clear other problems meant it wouldn't=
 make it. Need to have a way of knowing when things change in priority=0A=
=0A=
JB: Can't commit other people in an open source community=0A=
=0A=
Marek Marczykowski-G=F3recki (MM): Community update emails from release man=
ager have been very useful. Don't see why these couldn't include plans abou=
t things that are not yet posted to the list.=0A=
RPM: Mails could get crowded if it lists anything people just have an inten=
tion to do rather than actual patches.=0A=
JB: Status emails felt a bit crowded recently. Need to make sure anything w=
e do here isn't too fine grained, but also doesn't omit too many things.=0A=
=0A=
AC: Effectively we want to maintain a status of features in the release. Pe=
rhaps a dedicated section in the community call where we can look at any up=
dates. Only way this will work is to spend a small amount of time very regu=
larly keeping it up to date - community call or similar venue seems appropr=
iate.=0A=
=0A=
OK: Last time this took half an hour=0A=
RPM: If we ensure it is just status and not technical detail discussion, th=
is should be better=0A=
AC: Have to be quite brutal about stopping it going into technical detail. =
Keep it to a small amount frequently it should be less work than waiting se=
veral months to do lots of updates in one go.=0A=
=0A=
RPM: Problem I have is knowing what to work on during the release, currentl=
y have to be quite reactive. E.g. could have put ASI in but then wouldn't h=
ave done any work on it.=0A=
Anthony Perard (AP): As a maintainer knowing what's important would help pr=
ioritise what to review more quickly.=0A=
=0A=
Discussion around grooming and when things get dropped - AC: have to be qui=
te strict about dropping things off which aren't making any progress.=0A=
=0A=
JB: Do we know who will be doing release manager job after Oleksii?=0A=
OK: I can do it again=0A=
=0A=
Alexander Merrit (AM): Do we want two release managers so one shadows the o=
ther to handover?=0A=
OK: Don't think this is necessary=0A=
=0A=
AC: Release manager is supposed to be lightweight=0A=
RP: There are other things the release manager could do for community wide =
coordination. Should be a community wide plan driven by revenue for compani=
es involved.=0A=
JB: We are not a company=0A=
=0A=
RP: Example of companies joining projects to get certain things done, sched=
ule might need to move to accommodate. Advisory board may need to fund a de=
dicated role to handle this sort of thing and coordinate the business side.=
=0A=
=0A=
AC: Stefano is doing this on the safety side, which is one (large) part, bu=
t not everything.=0A=
RPM: Recently we've not been that bad about releases missing features - ver=
y few things that were very close but didn't make the cut.=0A=
AC/JB: Two at the moment (domctl stuff, ?something else?), so worse this re=
lease than it has been in past ones.=0A=
=0A=
AM: Would it make sense to differentiate features that are 'reactive' vs wh=
at's good for the project as a whole?=0A=
AC: API/ABI example - doing more than what XenServer needs, as it it's a on=
e-off opportunity=0A=
RP: Great example - shouldn't have to be done as a charity to help the proj=
ect. Not sustainable.=0A=
AC: Some expectation/responsibility on maintainers as to work that has to b=
e done (e.g. CI work). Xen has no developers who work for Xen, everyone wor=
ks for a company who allows them to spend time on Xen.=0A=
RP: Companies should allocate an amount of hours to be directed by the rele=
ase manager=0A=
JB: His opinion that won't work in open source=0A=
AM: Could we get money put in for specific items. Some projects seem ashame=
d to ask for money, is that the case here?=0A=
RPM: Difficult to find people with the right skills for Xen. Not the proble=
m with money, but a problem with time.=0A=
=0A=
RPM: Advisory board could maybe hire contractors through LF, but difficult.=
=0A=
RP: Go to contributing companies and say we want N hours of time from someo=
ne at company to improve release coordination, carves out a budget of time.=
 Release manager goes from having zero power to maybe 1% power as they can =
now direct some work.=0A=
=0A=
Actionable items:=0A=
- Grooming a list to discuss in community call=0A=
  Make clear to people they don't need to wait a month to update, can discu=
ss on a thread=0A=
  Put the list on the agenda=0A=
  Formal tracking stays with release manager=0A=

