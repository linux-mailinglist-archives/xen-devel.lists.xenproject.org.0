Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3D483E9F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253066.434058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fgE-0004GD-U4; Tue, 04 Jan 2022 09:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253066.434058; Tue, 04 Jan 2022 09:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fgE-0004DN-Pp; Tue, 04 Jan 2022 09:00:30 +0000
Received: by outflank-mailman (input) for mailman id 253066;
 Tue, 04 Jan 2022 09:00:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4fgD-0004DD-0e
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:00:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2dcbcd5-6d3c-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 10:00:27 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-b-IkWBMxOK-Lvx2SOXl7BA-1; Tue, 04 Jan 2022 10:00:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 09:00:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:00:25 +0000
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
X-Inumbo-ID: c2dcbcd5-6d3c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641286827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJML5ANT7+aee/b26jTKbaQrGRXVmoyOXhnIwmr1v7c=;
	b=Rfxm+MMzpkI+A/gcohBryiKcTQWeRBe7vpJlm/62WKuLgu1GeCQ39azzreNPyj8SYuTUpT
	ZO1ggEsmI8jy9iUt2amWmIMxvj6ZXKDEIOMr7wwZx5V5seLXwfxQqAgLCuBiZdVnVRdBDC
	lbvso0wOY/aftbWQN7pliuc0jDKU04Y=
X-MC-Unique: b-IkWBMxOK-Lvx2SOXl7BA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNE2Le4g9z8Sk+LPym8MT7n3kJOhqi5MTtZPzA9acKFSS8Xmn1bMav2I1Q2zHG5cwxY6pt4EzlnuVfKaVeb09P3hFFXtTfEhHxwfokdYBHhq/CLAollZjHtQgsWUysO0OH1bisKIs17mQpJip9JYcWSI71K5mq5pR6CLrf8upE6bqmlKuzWQbCNa/7gSQ7RHnuiR3wImqVBUr2/flSnmK4NrE1478iBQISQaFwxeaeyali7IUNpXt6jmUyiPA3eHEfwin034PK9lQgsoFbriBSOfeYr2rusQhZDeKSG2dijAigYsCklByvZC8gXDl8IMVKsVJMccybd/D7pM8IMmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEAqyrFzTe7CraWNa6ySIpD+D56Cbi1riRoV+vFlOs4=;
 b=M++KkhgCLcpbCIanlbzoKo0mQsVDYd9WDvLxWiEE+n+uL4qOrLERRIqSgoeYAE3VMrLdkmzgLFZE230QeBVJ+hFYELfmDLJ01mTS65jAzXhHlGCLwtfNyb13aWlDtLJeMJzbTwjRcVOqoSE/b3SLFU7cEZ8fsx6se0ap8hft5X8CNRg/U2eHzWj+lzQmjUpui5mdSRpejeAqiYyXE4kpY3n3Bs5B5yLskbXC3urnivaymolKw3Bwvfesss8Iyq0CnhfZe0xaRi9gWhUnKbwAdoovaqOshYuzLHBZxXZv3yI55iyc02yqc69pc6/s/RIaZ8YcTxZygJUOate/PoNkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aecec46c-ac3c-3db9-640f-8e98c960a4f3@suse.com>
Date: Tue, 4 Jan 2022 10:00:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 16/18] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <aab0b88b-7643-cc08-756b-0684f93be257@suse.com>
 <Ybn0LaRuFpUfcmoU@Air-de-Roger>
 <bbcbd938-170d-94dc-4fa3-49766fb2a9c3@suse.com>
 <YcCgV/o+1I0qry+q@Air-de-Roger>
 <d85733fe-2ab1-086e-15cc-e4ef68be4596@suse.com>
 <YdQMDnfxQd3QforT@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YdQMDnfxQd3QforT@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0097.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5afc5be-ca7e-40eb-646c-08d9cf60a576
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6672F2A40CE81C81718F1987B34A9@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8UXGjsgQ14S2tqNOpH/HFeM2JcWmkmEhlCsXvgb2biNvOjTKy8Zg4mGk6A2My9yKG1GWAGYq8ZmKQi4Ga9RXtxCWv8DOLH/5HgfQ1eWxBXSHUPvupiY4602mmh/SWbDhYq9rMIp1cGPRgjO2HVoXUEJvph1+6hMK/ApAphGNLKXvR17Wuy/sFhiIr7Jw5ZOBY6tR0IU8d2Zbc1tkOl4GvCcvFnKOLsN2DIYocKfdw9pP2eZ07dlcEZlfSfma0+lwb111DoFH+/wLxzuPwR4G0tfvuVUiBGjYr0XQP4vRqXqPStSlvquoOxIM+2loPzXgbspqgTADNwokNTixK065gh+Vdv4JTLSO+gl+/1NYboAh2j+ezqKOrQyvuN1BOi49eO8A+rCqUoQTrYIXIXWOMPOD5wEUna8UQlsNYKgDTMXMKnQ7OR1QhCLQhf3Ft/SwGwZxpQ49U5m84uJgzVrXOuoc8pv3gymhjoA1o59EajFlbeGBSuoGwaxYPdEd60MvuNrV48wI5PJId74zHbG8m1meWEZ9LofBr5GaambmTQP4qcHrlc0cxzI6KO/3wOGCA3C+sl7zi36saBE3JSl+PprSjsC4AKIgkXj+mgihpU8K+DBgmxR7VLsDjuyx00sJUQnTIHM6Tf4PgoEnvLPJr+gJxCSjFx1F1xAk/uwCg7qEp2rL73Gz9zEtzPBpeU4EkEyGkOOclg4v5Mo23sz+Je8RxGlO4aY3UCxkTnod8X8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(6916009)(6666004)(316002)(66476007)(83380400001)(508600001)(53546011)(8936002)(66946007)(2616005)(2906002)(31696002)(36756003)(66556008)(26005)(86362001)(8676002)(6506007)(5660300002)(4326008)(6486002)(54906003)(186003)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mrw8yZE8ougiKbizEMBVtR58W9AJAss/fbFyYBtLS4akr2bzlcnCAjV7kOif?=
 =?us-ascii?Q?v6k9jkueVYF9K6/oHWpBMcbGUcurDSxIwr/NVPeWApNfD+/OsdZTUtyaNwk+?=
 =?us-ascii?Q?MisRqaTkUKgI6BxCB5wraAVgYb2qWe5fX6XBHiWIJt+EvV1daAI6i6wFcx37?=
 =?us-ascii?Q?YS8xhTrklJ2IBqpJChGbxT7hgydas9Vbxl4DNDsIXDQY10oiIQrCc74dJjcX?=
 =?us-ascii?Q?/5YXJujpM3p7w1NXRhBubTc4PzAWZUxlkt5FJRzrZIpiqt+r8/QM6vaMGBg+?=
 =?us-ascii?Q?yJu5lNW1XbRLzV7d38dormBvApJpjmwGM7gy1NCyozXxL9rtNxvJquAn9QYf?=
 =?us-ascii?Q?a9u41rpnytNuwiG5h/eZfIeNaAg2paIMIboBa5z9+0l49EJpfBMwe0ON5zG9?=
 =?us-ascii?Q?ox8Iu6+hY1SEkOfWxhQyCT0MCtcUnpttTrp1w4tf87tOrdEzdqgqKt8f9iBj?=
 =?us-ascii?Q?K31tT5B858uozZl7RR2X4Jfl4ZJtFTZBXz26e+0s1H3+IoJCVv/DwAuYpZAo?=
 =?us-ascii?Q?0oNQPXz196YHMX+4nJzH68Jeku7h5cO/S3iRZbLYJt4xW9oIipzUmBnwxbKB?=
 =?us-ascii?Q?S1DS4F4oBS3njC1aP+9RraTTmKlN+49shW7I33vZOZafRWhsbGTJHpjzVvCU?=
 =?us-ascii?Q?qvKzNpiZHuStP2f1cW1xmgUJUglMjfZUo4lfwvnbzGVGIELQFPs3I+ZcyFlq?=
 =?us-ascii?Q?Y5cthMroLVOldopbspsmOu6ASiwTYd7S5amARUZ/yd5keqk0XJwm4ePW8nV4?=
 =?us-ascii?Q?Yywb82QX58ALG30tfOEEcYjgOoj/S1c7zliCai9JzqHcNoI1nIHAStjl+dH4?=
 =?us-ascii?Q?ST4HKNmuIvP8SOYW2ZSQv7xhwIvuUr5vWuKwuUBW4bJZ53L+cEZGl5I2LsBS?=
 =?us-ascii?Q?ZUjocZVCAcYIpx05t7zyTCmSIhLeQ+b+yskSy4e0kabwuE0QFSOX6/3aDWxo?=
 =?us-ascii?Q?nDUjYJnu67mW78XTVbJvgluDPwaXapsObxASngNXfAbo8Soy0cwsOWIuPT9m?=
 =?us-ascii?Q?6GZCEWACkMvH5vR5XD2hc8uKaXup40DkG5NIPau9tbD/cMwXE44ZLGxwF9d3?=
 =?us-ascii?Q?HRcQAAwMzASHMwKc/jyiKD4PIomPZZkg4q45cYd+uA/ksfItJkhqLI7uAEft?=
 =?us-ascii?Q?E3ru8fdSH9zf401nuJZWx8ysrE1cFYc8oA4l5fyUZzSwKD4/d/rhTtBv/N2D?=
 =?us-ascii?Q?SkiY2DYNqAocx88GoU0CuMuCMzwZKpge5+xrhg3/eoJbGy8N0jFdxfuY6Tkr?=
 =?us-ascii?Q?6Ab4/Ly8GwIB1Z6aovHAPvAjl3xK/vGSnirlWuL5Rj8IiPeSxgQiW91wzo7F?=
 =?us-ascii?Q?jWkObL2HkBr0A2DEFLJhbb6q0+jAcnG+JlcVApR5VnB6hlRab2N1dKBkB9oC?=
 =?us-ascii?Q?SOzZKSQucOqIdMGfwkUwUrXzh4kFw4HLIDecRTnRBehGlm6L9nQq6pUewgbl?=
 =?us-ascii?Q?ll7iPy5g4kN9Z5hyQGEqA8ej0CesgGz8Cd6reMhT5y6mRZssKP1Cx9wdQd26?=
 =?us-ascii?Q?F2X85S3FEb77CWuRMCxuR5a2ZVVj+3jT6FFasmvT0qrd947EG8pAM+zP4Y5O?=
 =?us-ascii?Q?r2dBQ5m8/9M3X6oouC1uEV95OR6fnV5tbp3XCCpGjI0lkcgYGDy6+5Ojhmhg?=
 =?us-ascii?Q?F8fVksON8LYOaFfv0hEbM2w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5afc5be-ca7e-40eb-646c-08d9cf60a576
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:00:25.0434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ltbcq7uDwHpWLV7vZ/I7Yf3O04OAj50gaTKpUR+6/g+TPIfvo8DeYCzhrDQwfAVfNON+TmE8PKrEfpDm5Ytywg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 04.01.2022 09:57, Roger Pau Monn=C3=A9 wrote:
> On Tue, Dec 21, 2021 at 09:09:45AM +0100, Jan Beulich wrote:
>> On 20.12.2021 16:25, Roger Pau Monn=C3=A9 wrote:
>>> I think it might be interesting to add some kind of unit testing to
>>> this code in tools/tests. It's a standalone piece of code that could
>>> be easily tested for correct functionality. Not that you should do it
>>> here, in fact it might be interesting for me to do so in order to
>>> better understand the code.
>>
>> Actually I developed this by first having a user space app where I could
>> control insertions / removals from the command line. Only once I had it
>> working that way was when I converted the helper function to what's now
>> in this header. But that user space app wouldn't directly lend itself to
>> become an element under tools/tests/, I'm afraid.
>=20
> Also, I'm curious, did you develop the algorithm yourself, or is there
> some prior literature about it?

I would have added some form of reference if I had taken it from somewhere.

Jan


