Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C232548E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89884.169759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKV2-0004w0-45; Thu, 25 Feb 2021 17:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89884.169759; Thu, 25 Feb 2021 17:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKV2-0004va-0I; Thu, 25 Feb 2021 17:32:28 +0000
Received: by outflank-mailman (input) for mailman id 89884;
 Thu, 25 Feb 2021 17:32:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYzK=H3=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1lFKV0-0004vV-FM
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:32:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [62.140.7.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a15a9c4f-6334-457e-8279-e7dccf36af87;
 Thu, 25 Feb 2021 17:32:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-N4vtx34NP5auh_XSgffBEQ-1; Thu, 25 Feb 2021 18:32:21 +0100
Received: from AM8PR04MB7970.eurprd04.prod.outlook.com (2603:10a6:20b:24f::9)
 by AM0PR04MB3954.eurprd04.prod.outlook.com (2603:10a6:208:63::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 25 Feb
 2021 17:32:18 +0000
Received: from AM8PR04MB7970.eurprd04.prod.outlook.com
 ([fe80::8532:12af:9c2:66ca]) by AM8PR04MB7970.eurprd04.prod.outlook.com
 ([fe80::8532:12af:9c2:66ca%7]) with mapi id 15.20.3890.020; Thu, 25 Feb 2021
 17:32:18 +0000
Received: from [192.168.0.4] (75.169.34.2) by
 AM4PR0202CA0010.eurprd02.prod.outlook.com (2603:10a6:200:89::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Thu, 25 Feb 2021 17:32:13 +0000
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
X-Inumbo-ID: a15a9c4f-6334-457e-8279-e7dccf36af87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1614274343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ryAn2ABAftELdbjkxWIfITKCus8zUPpxQ+W5FBSx3BE=;
	b=QBC0fAtFp/OQPUIc6FP/Oswx85JcKU51KSxOc7PX+VTo9j9CptGT/3mkxPeMgH9Qy5ER+q
	v8nHw/wsO40CgfgH88sIAUWjH9XeUEr/QzAmkHsWiBY3pYBNuIZaQE4Uwx/Tgdva36v7ds
	vYDiZV/sIm8nQsuAPEGkCr/ZeG/WMbA=
X-MC-Unique: N4vtx34NP5auh_XSgffBEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8saZWZ85tESZqs/+Sgv/oi/kAlU/xApplnQvSWvSd6hhDVN22xby4EaXrujUF/+HBVldTLDBPS+yIVel1zjSDQ2nt+BMeNz9gNaOd88xDfEozAqvt4NvorF7zaSDfVYOXNzQe3XUpEMnCMmMK5w984Hp7ypWunJkSJI0pqqY/T/hNMPAPZx7h1dzX8pp0zO2my3WJlTeCQvB4pC3moYQbuORX8wcrq6O+JOIzSh3/EddpGuLQBtxiOwgsK5Xq2ffwkji3PriQ9KnfEH+XD9PDW2sdS7UUpTnE4lTVW9vKniJi8EzGCIun0M39hGsifm88cmNWxYuczNAPxhGLUWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxQ4+12qblRwW9qr4HnK4DjJExdkPAbV8eQ77AI1Cfw=;
 b=hRyqC/tVIqOZNNqaXCR4P56dv4Peto5qVBzUGbioDFWFNyernIRwy2dmxwCHw+W/KZ9RsDkZvAmMCOi0FGVmTo2Y1bBPaQy6RDyFpxYlKG2pZvT6zL/+AYg1mhqkyStgiMn89iDGnmZY3mVe+oul64TWT0hcaAVp/iGPc7OWh7AjzoDxbmY/OnbLl6IH6YkUz0VSHfqbugN3Y4X0aflDll+5Lv0JFZS6Jrl93G/d0yICs+jNnCec737FyK1cELAYSJhzHG3xbhXmbgrIajnLkXiAFZymb+qCPv2RtcWRIQhJW6m+sXnguUVJkUMPdHpBM7QJOoiQBZBoWdWZCMvogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 00/14] deprecations: remove many old deprecations
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
CC: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20210224131142.1952027-1-berrange@redhat.com>
From: Jim Fehlig <jfehlig@suse.com>
Message-ID: <de4a241c-3cca-203e-62c2-bf2c19f9e7ce@suse.com>
Date: Thu, 25 Feb 2021 10:32:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20210224131142.1952027-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [75.169.34.2]
X-ClientProxiedBy: AM4PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:200:89::20) To AM8PR04MB7970.eurprd04.prod.outlook.com
 (2603:10a6:20b:24f::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e733b1a-a015-4abf-26bd-08d8d9b34cda
X-MS-TrafficTypeDiagnostic: AM0PR04MB3954:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB395415700CFD51063AFA323FC69E9@AM0PR04MB3954.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9f92ddEKIcQukIMcRDUmGBS3KnjB6OHZ+kkjNRd7ti3UiUxVtOIfwYcdv87KwS361yX0RHnKfJ+AbMtJGMMuwxrQgsBhhoV1XDDznm6WZeo9GKOv7KKm80mpWh7CX3gTfhAuZ1SOqfj4MFwBDoeTKBTRdSP3s/Hvk3wEsLAjoPjwzThm+niK8ZVLzcDMI1J3nOZUoH7p4qXObBHQvAw3WT84hgUBE6l0Rnz9dQTgi4ev6q9Z/JC3jJ4rip3eAWFQdPMIySNfUbO/qXo0ojBvvW/rlDgblI4xhccOwns199Xzbv4bj4hRG8gjPJn9KfNwgdaKeii/RbVYfRrp8VEfkMNtMfQ/Jhb1Q/6+Vps9Qvb7juy6aJzxPSTfySKqHUdeYKd+MTDNbVKHICfwKe18pT3MWa3bIhvvKqbn7nht/yXbxoI4NdHqZoi40G0zmUk7u1hVdsnA3bUWNwtRxPskhWktBxyD7LfprVKoyJnFo4l7n7y1l+vKgmF+3GfQRqZ/p/xQbC3VuWtPp+u9H45ZQccblxFQvK8XAc25Ecufji7bSEOerBRnns4Btwzw6Ndm+7JDCkxQimIR3cz9yr4yj5r9fzEXv1ztNaeyRRo3RhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7970.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(376002)(346002)(39860400002)(8676002)(7416002)(66476007)(5660300002)(186003)(4326008)(16576012)(53546011)(36756003)(478600001)(86362001)(52116002)(2616005)(956004)(66556008)(31686004)(8936002)(16526019)(26005)(54906003)(316002)(31696002)(66946007)(83380400001)(6486002)(2906002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?iqrnShx0qzYiEYaUH04Ey6WNXT/kjy8aymoTl0FzpOKvVSC2MvQHcQ7gTn8x?=
 =?us-ascii?Q?4f8c1lmK5VM3s2jlNLY331BLby7YC/1ZR6I33sq+XPOuVPn2OIJPNZQn7WK5?=
 =?us-ascii?Q?9J4jKkOwv6N8FwQax0usyj/mXyJP4+ejV8+zSOQLESKz09/1YW2XiRwY+WLW?=
 =?us-ascii?Q?gtRmEh13ktdENlYYqfcyKtTuRcZl7JTRY3CYCgxTuyWLIYjGoYqa/hh+k9Cf?=
 =?us-ascii?Q?OXba9bhstZcL0140KDPJ3vaVVN5vsCcIO3wyTPX8h+9wbzjMggSMH7st53P8?=
 =?us-ascii?Q?eqM/aChboi+BH8pc+o2lWivv415oC/JmKKHuK+1dusiBCGCGeMibExcQuQoh?=
 =?us-ascii?Q?a46uJVtNRyUFkmFkcLRYfPSENe7GOgQILKbg1yKr9dvT46PH8Bem1W8GnPmO?=
 =?us-ascii?Q?SMZlDVqDNbjAiev3d6UTOt4aADcTn064U44zqkdgDv3Hk7Ks5BbzgRWTyLNI?=
 =?us-ascii?Q?bS3cMmlDWixiNLwuDWN6sAuMAX7SMiTVYLWQsBNWSl/ltULOYCoXdkY/UxO+?=
 =?us-ascii?Q?cpkwBGWTrvh3qiRTksGRyLgsyrgMZu2XFJ2Viyb6QrkJkGLZUy3++wXIl5Br?=
 =?us-ascii?Q?DadTeKhKbEpjxlZcI66WzPnaQS9EruEsXbN1DWLvSdSVbCt1HmyD9OHHR6gx?=
 =?us-ascii?Q?UZdh6NPbgyBC81DflIyNW2sk0DKGJUSOkcNlT2nQT/WqQzgdW03PvJuvXh/g?=
 =?us-ascii?Q?WcnEr5MhPPgsevKNANKa8F/IHi53garhQQHeJrod6wg/rbXI6XU/C39cRqkX?=
 =?us-ascii?Q?kGnTSv9bX2RkawlN4rgkSjQjGFqgFmqyJGUlWlpP9v3Kd5c1s8GVQgZBWJU1?=
 =?us-ascii?Q?juMhZPoLA1mNI85uBebEAu3pElH05866rdMxpdmLpg/FdytPTj2zTvoVp+uc?=
 =?us-ascii?Q?K23Ia5RauA6Cb9d/FTh8vAr0OIiUdaBrxC9KaYj7tNkZb/TZg1SMDTmQbeqq?=
 =?us-ascii?Q?ZF2bqRGit/6wp3EK9CqsI3hlgn2osT7jTDoGvnfHC3gNowzg46hdMrDcOqb1?=
 =?us-ascii?Q?ev7fghRsXNBpdOVJ4lHLEIKKb6E21oPA0tx2Ub8cTtEJru/Ha6dxqZ2S+8VP?=
 =?us-ascii?Q?bEmdRwCa0c/kGr+4sUu0LFBD9Yf4MP4k/ybpAgEf8PVdJF0o6CaS0oxsofEV?=
 =?us-ascii?Q?qX0j+wRDjwOOivyVrZhK3Za/xm8FEIC8CCarBHBtUhLkrVt8uGMy0lakQggK?=
 =?us-ascii?Q?xq0Q0jB0jSRYW4jsFLuoGItKZ7++10DVPRLNwCICpPhibj4QMZtTH2MmUd4U?=
 =?us-ascii?Q?aBYgCp+aAwut7LRiSLbleR+KvUaiXLZKMkuJOAphorJZj6V5pUylierkiNrX?=
 =?us-ascii?Q?9ZcexjukNnMWWdIr84kODQLl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e733b1a-a015-4abf-26bd-08d8d9b34cda
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7970.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 17:32:18.6266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWO9/i63UGqiixFtjofSOUMA8pO8HQSYd1YtsCGTippXy943hdR/7FThI2YYFxDfHY6qzwRtkQ5v1GPcqvOTLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3954

Adding xen-devel and Ian to cc.

On 2/24/21 6:11 AM, Daniel P. Berrang=C3=A9 wrote:
> The following features have been deprecated for well over the 2
> release cycle we promise

This reminded me of a bug report we received late last year when updating t=
o=20
5.2.0. 'virsh setvcpus' suddenly stopped working for Xen HVM guests. Turns =
out=20
libxl uses cpu-add under the covers.

>=20
>    ``-usbdevice`` (since 2.10.0)
>    ``-drive file=3D3Djson:{...{'driver':'file'}}`` (since 3.0)
>    ``-vnc acl`` (since 4.0.0)
>    ``-mon ...,control=3D3Dreadline,pretty=3D3Don|off`` (since 4.1)
>    ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
>    ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2=
.10.0)
>    ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10=
.0)
>    ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.1=
1.0)
>    ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i=
].sta=3D
> tus (ince 4.0)
>    ``query-cpus`` (since 2.12.0)
>    ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
>    ``query-events`` (since 4.0)
>    chardev client socket with ``wait`` option (since 4.0)
>    ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove=
`` (s=3D
> ince 4.0.0)
>    ``ide-drive`` (since 4.2)
>    ``scsi-disk`` (since 4.2)
>=20
> AFAICT, libvirt has ceased to use all of these too.

A quick grep of the libxl code shows it uses -usbdevice, query-cpus, and sc=
si-disk.

> There are many more similarly old deprecations not (yet) tackled.

The Xen tools maintainers will need to be more vigilant of the deprecations=
. I=20
don't follow Xen development close enough to know if this topic has already=
 been=20
discussed.

Regards,
Jim


