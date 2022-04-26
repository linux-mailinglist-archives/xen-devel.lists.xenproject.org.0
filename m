Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030351005F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313939.531759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njM7R-00075z-PK; Tue, 26 Apr 2022 14:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313939.531759; Tue, 26 Apr 2022 14:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njM7R-00073g-Lw; Tue, 26 Apr 2022 14:24:45 +0000
Received: by outflank-mailman (input) for mailman id 313939;
 Tue, 26 Apr 2022 14:24:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njM7P-00073Y-Qb
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:24:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d301747-c56c-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 16:24:42 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-AwlGhSk5O8Gtz6tGEvvu4w-1; Tue, 26 Apr 2022 16:24:40 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB9PR04MB8075.eurprd04.prod.outlook.com (2603:10a6:10:25d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 14:24:37 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:24:37 +0000
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
X-Inumbo-ID: 9d301747-c56c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650983082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvQAGQAD/xjMH0rOFAgUmcx+I/82BCesuCMRj1nAJ9A=;
	b=DEm8uouKlXwZ+MGU+5f17YPBz0F48CjFXSXlNKhRtCWD/4u+a8bXkaG9eMuiOJW7zvJe8Q
	Tg8iZ7lwH0saK4RWqteOInWcFXEmETEzZLgjAEjmgSyxLrKAxM610VOUSpRKqRtDRVSKK4
	bwGsXXMarx1jGvW9ekc0xsoJSUjvk88=
X-MC-Unique: AwlGhSk5O8Gtz6tGEvvu4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vu9S39fVbpQmqo5ZOv3bMbo7KuNja0QE+aUVLcUUC//R3p7KwncE+MGMO3F1SgBPV1qlWPUsnMiv0UlN3hvATiB98TmmbTi0ABvK1Lt2giIdXLEfYrGfyDS7J44FcUxbGUBs3VocpsaMazhKC5cWLHaJs1+cQGKOzErbJRs8qSSMVcbgLwH1ffViyPvWs6nFMz9TE0788leRo4KFP7AbcUQfreIQDGK3yRz6/Dx/1oH3kWQi68VY0WtP5n4iOv8wI9tMXAxSl2lvOnnDsrXPlonviy8BLzqdjoMq5pPyCQMcaFsii4HQDqRKMm3LirzCLZelnXRmscAM/Wj1+fJRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSUemzqtohV91lkmhBaOzyt4zzjFEIQ8k/mkTXSWZcE=;
 b=M1/S0mdFTfzhkcKOjfHuOdkA5Zwf7jnNDK4ZTdMkYBMVCTb/nsiGyCFcmsMYqkBkg6JkunFRIlnULqOJepvIcK3v8KH6aruuKIq6Bhc///3TkTFKS/Q/EgM+XBV6qMhYRZVOGQDAV+cb22C+8TeqAkc5LytzaakpexQXEUNpBBtuMcXhEf1UCMtdSGmXBAhua6Hz6+/IfJqNHCCv/ynYoDHWUfoK0rYIyjx4Wx3p/pPth+eDqzNPXA49txHLHO6Xd2wfK5N7hDEVO9fCiPc7ztpUv+HU7F00dIe+g6behe8BtS4KU5Mnrg6qgtwYNXYjynHCdC03/DxN8Ho5Obrzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16d9b9a6-b80d-ebbc-9577-c8579a6b5b17@suse.com>
Date: Tue, 26 Apr 2022 16:24:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 5/8] libxenguest: deal with log-dirty op stats overflow
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <1b24d2b5-14ff-6e4f-6fa5-d91d75e315a4@suse.com>
 <068a468d-a7a4-bf24-264a-ac86b910dd82@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <068a468d-a7a4-bf24-264a-ac86b910dd82@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c6684bd-c9bd-4e86-9b05-08da27907e21
X-MS-TrafficTypeDiagnostic: DB9PR04MB8075:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB807516D9F5D4B400EDC79A9EB3FB9@DB9PR04MB8075.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	08RNdbQDps5liaf+OrDg5W4CEHdl7KHtAmhWSQL0G8cLKaES3S2R0UVVZbvyz7aGQoyEC44HHIwluzfQtAjkEztqIFMBhnjoc2XZFVrC979Rg/RntJgpHb6JQE0G12IQ16iIx7vv0qoipPoM4n+5PN9DuCWEq4l1fKzCKxUGsg4Yeygk731IwPdUITiQEbnFnRLj2SEgY/eASgd2ooI2rFLvrsVoi3vEyJJmi7+4TDe+jG6EJKYu8vHO4HUUopsgFxJSCjAE2WFhyTHGpAAliORLqy3kg3HF0fGWIUaYe+reIn8OGsLk1OucO8rB//PEs9vHSiRDllSH6HL99yvakTmOqwK82nqnT3Shz0r/r8gYjVf7dHIevwmNGhmgnEOuMez6vQAP59c4sHFI9oLR6i4cLIHhOy8Ebz9/wOfSEmB75ro+H4PMjvjd52fvfzivUhpBqFkW09aQUiAeGRcFORGrsEYnfOAEs0rIBm2WUOqhSnODSSLl/zOMBy493lRXJmQOSpZVBQ0EJpbW2eVuW2gm16g1+GuF7AYTVT/cOECQFnQfj5nmKu3UB0uM/u7J9mHUGejHu1h5BgRFS3eb1qCFYV/fTaddzJR8tk1MN2E/wtNuQhR91T9bBTJQmSRSmoB/UPKLEtinBHykWnHVncrPvp/QkHqt/dK3gX6wnrha0rKJ0Uks3FaDoyyYMkAlPwT3erFzbSHXypiYlpHeuZ0q9ldQrkwVdfsCt5SEhMUTsPD8ZW2gWYIeKK8sa63oljpNRrvCBJFr/rpVhlDcwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66574015)(8936002)(66476007)(4326008)(66556008)(8676002)(508600001)(83380400001)(6486002)(6506007)(53546011)(86362001)(2906002)(6512007)(2616005)(5660300002)(26005)(31696002)(38100700002)(54906003)(186003)(6916009)(31686004)(36756003)(316002)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oOP1Pj62YgBou+aXsOyAkC8h3jsy5eaqIIR8b0gOvZNvQrZeThCh8qEArbi2?=
 =?us-ascii?Q?ij5AgPc2xLWqa6djBu5Znr2r54csVD7cnU6ARnKpydA/LG1SHdIcaNWSsnOP?=
 =?us-ascii?Q?ppvvSf4n3/Qpp2fkK2hlml5C4h7Kw7Vz25vn6pkOzrVLAginC+Cj9Isg+Jvr?=
 =?us-ascii?Q?UygreyRL/oIzCyyfqTVJILtutcGV9Owcj7J08mYlPDSvtkasCN5gchCNKiFT?=
 =?us-ascii?Q?9Me82Sh6W4rPq2P+aj0vVU8319wwcBpeX2J9XcbIoxl1AiYCpCnIfuX6ExG6?=
 =?us-ascii?Q?Iv/xy0eCxirgeNKQkyPaSjq70zvKcIs8QoFnkR3K0PBLKA+srzCkfTb1QElB?=
 =?us-ascii?Q?a6NoOvYbqzUHseeXjoOR44zQqZ3IyNgYB9VzsrPjyxNYc55VhZVI4/uX61II?=
 =?us-ascii?Q?azKyp3VNL7WFZrQRmVmQ+kq1gV4yXy9fwKtnlX6syqXqjRgFmmkvJo6/Ar/O?=
 =?us-ascii?Q?EGAl05tSAK/VQmEZXvtlIFLEDT32qjZLhF8/burClN7OyflJWIpwNTeG5cIo?=
 =?us-ascii?Q?8ubS+Z+asllczgIuoAJZJ8Tph96DjRzcC4AUGlblSXcd0FWDI/+WdHF6CzNx?=
 =?us-ascii?Q?w88fofifUKJzNEeH8MJBnZBCN5Wr04HnsFgOUD6GIO7pc5knTgh/ADhQT82Q?=
 =?us-ascii?Q?qQMVzmXzN0/OoukS0BMFWuO1RIo2MRnK6p/exaIXg5ZxIhiLr85HGOdylx1t?=
 =?us-ascii?Q?7rAUFPBHXTKDGmjNJwnHQrLoFi9PmQohY4rpI62LFLVnqVEZ4Ciz/SzRiDaW?=
 =?us-ascii?Q?IdIBKSsZPMyMpH+u0Y/MSFYqLrzBIWvIeKMVExZj/57Bdvso/gQlf9Xd5CM+?=
 =?us-ascii?Q?9ZwkhQ2qG1n6VJDLURCpteZeYcsoTTYvt7xDiEmUhaDHDMpV09Iay+yJNN9W?=
 =?us-ascii?Q?/frEW7pyahpSNFiODNGPeQgpYdqUeHHrzsW6qfVDi37NyUfzwclULYIQrvA2?=
 =?us-ascii?Q?h05r3IbMjXsmR6m76cCAoGyny2Ou87o/PseNGS3br5p2kar6fIXFrWwzFRqL?=
 =?us-ascii?Q?DUqWptG0iCcSzpkJJGRGy/5X+gRxYLyMfsD3t2/Ca0/fEaUWuDgJqOeizFEG?=
 =?us-ascii?Q?oqRav09UehxPlIgTHTwvE7rT4kftH5PWHwwJ0copCmSc8+EYEDaeWsEWLGgW?=
 =?us-ascii?Q?0rhtdP2slziseSwOCAn+lRwHuhdvG9tQ7w4xjKTgWOr/80mm/ynEhUhnn23A?=
 =?us-ascii?Q?zYeXC+njPLWJQ5n8dDfQ+/WgO4Jf/3URZLnE2gSYVeglZQlGUb0Pknv85rYC?=
 =?us-ascii?Q?RzRftVA82DkE+5lWPPT1Ke/hKDSrlkwj5TsP8xl9Qc9Kn6uvknCVrMv5CMUg?=
 =?us-ascii?Q?S6M73rr7dnQGDPW+JDeJSWtVfYiDDv/oQrK1ScVOKn3ay6UyyCVYaAwl1UVS?=
 =?us-ascii?Q?/uLm2XVHMMUKQKW2jjxx0cxIhbtBOTbF1znw37qZAziiO+UYWIT7CztDwQqw?=
 =?us-ascii?Q?yhkN7EqiAiQ67sHGMR14njOAPYFnnAjyXda8bQ/JaIAzeKVL4qmffOdtK4NV?=
 =?us-ascii?Q?TC7lnGXeYL+lck08R+k5pYeN1tizVsBe5AQDW7atrgZWrCP4X5kvq07e3zpL?=
 =?us-ascii?Q?+/k8MLfhfwL17RrM43Y9VdnNaVvOdi8/kd9uG2dmKpdj9vtMxW3vTkOrGYr5?=
 =?us-ascii?Q?xgQIAOCLo3V0zQYeT1ptxzfUKlCl0Z8S7yN57uC3c7cELQI97NCtGubV9pa6?=
 =?us-ascii?Q?icGjEWrGIhZkNtoKGsSOq7mSG7tLYQCpOT+5lYaeDPCzlLM59zO6ry2B7L4f?=
 =?us-ascii?Q?MpoyEDGWpQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6684bd-c9bd-4e86-9b05-08da27907e21
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 14:24:37.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFcn/tEDOzEYvEtrRvh3Jkm+vGCiu6X9kJIQ567XNWXStLgPXXyTwvPMRql40mY9ECgZEHd+RY6poyxYQDUvFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8075

On 26.04.2022 12:54, Andrew Cooper wrote:
> On 26/04/2022 11:24, Jan Beulich wrote:
>> In send_memory_live() the precise value the dirty_count struct field
>> gets initialized to doesn't matter much
>=20
> Yes it does.
>=20
> And as you keep on refusing to actually fix the bugs pointed out during
> review, this entire series is NACKED, seeing as you've also repeatedly
> failed to address feedback from previous revisions on other patches.

Excuse me? Afair I did respond back, requesting further input from you.
It is this input which hasn't come forward; I don't see how I could
have made changes when I don't know what exactly I need to do. This is
emphasized by Ian giving a provisional ack on 'libxenguest: short-
circuit "all-dirty" handling', depending on you not proving him,
J=C3=BCrgen (who had reviewed what is now the first two patches), and me
wrong. There again was no response from you. In such a case no
response can only mean "what I've heard back was satisfactory".

Also may I remind you that you're not in the position to NACK this
entire series. You can latch '"open" objections', yes, but it is at
best unfair to record objections without then working towards
resolving them, by simply remaining silent towards the request for
further input. This looks to be a repeating pattern, which is rather
frustrating. I fully recognize that in many areas you know things
better than I do, but this doesn't mean you're always right and I'm
always wrong. Therefore, like e.g. for patch 1 in this series, you
will want to actively convince the three people who think the change
is okay, rather than simply saying "no" with apparently none of the
three understanding why you say so.

I also view it as at least questionable behavior to NACK an entire
series when there are clearly issues which want taking care of. If
not by the patches in their present shape, then by whatever is
suitable (working out of which is why discussion needs to continue
until clarity is actually reached).

Jan


