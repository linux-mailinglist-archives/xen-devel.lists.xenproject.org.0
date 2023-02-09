Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72186901A6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 08:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492212.761654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ1oY-00021O-4e; Thu, 09 Feb 2023 07:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492212.761654; Thu, 09 Feb 2023 07:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ1oY-0001xz-1I; Thu, 09 Feb 2023 07:57:54 +0000
Received: by outflank-mailman (input) for mailman id 492212;
 Thu, 09 Feb 2023 07:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ1oW-0001xp-Pq
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 07:57:52 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe12::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 736cdcf3-a84f-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 08:57:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 07:57:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 07:57:48 +0000
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
X-Inumbo-ID: 736cdcf3-a84f-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbBP6srEfoJI/HJZPW79KuuIFThY6Rky8jZpuTzorKJ1lRnbSnG+so4MbBJgAgJvrDoNw0Sq8fHLIHOnfyo8oDxUa6f07QkpRWQcY+U0WjvWK+zp33jAdfZjNZS8z0NE/kjYa8blBjlE/wh/FafUS8Zv3w7fNHzxJVQCUU9i0eqjTYMcgHFeNHbqSAyz+lKgjXgyT4cGCP+Xy8GKfgOIu9hjlGJWM8P1AqhESAMJXl5+1scZ5PQqnMLvvSAaTAVj4CJwW0Hg54tUsOcRGamZjioKiG0MYwufW0ND+q/JSl4CLOenC57X6FYuVDPgUIs1Iq7pB5Tw0LnC4WSLsSwz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83QCFni1/ZU7RzXfpSgXvWIy3SfQ2Dbqde21hRD1oZE=;
 b=UFUvA3NdXRu71mo/jCQ2NGjXYDg/u7HpySK5lP4ojiySW4fsHismVXJsq3VPPff694ghsELNhMxMcSfd0regXj+bwabJ7pRdOg7NgMzK8L12OcyhR4a3U1qbC0GLo2CI8Jwz+kr/A+cYDtsdhMIERorWZEiYkyR1L3jplkg8+x4GQ+YekIWRy9LgMX51c6K4/zu1IkqSAEiYblUHHy6lgbGWEY7SxqeVeSZsT8VK1os3Y5RFoudn1e7eHIxuaB3bv2AOUWJny4yGobvIno+bGqC+U9Q/N2++N8ASiFcPpLeh26zAVlUOcgkk5iUfm3B+QrgTNunEjmwY9lJJfJzV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83QCFni1/ZU7RzXfpSgXvWIy3SfQ2Dbqde21hRD1oZE=;
 b=wl6tcZ44T9DImv+tTkshayO86j/fvOBIbl2tKoVB1tKH/9Xh2fYNizkvyMcp5dC5ANvy7syvCTCpbvRjePAlySNaVI+LV/0M0VmQezIzZIV3yMmJO1x+tmqO+SyAVeXsXt+KCcp9h29UNOu1dXlE+qSyEdFC3ebdX2WYABET7Jg5IGV3dn0QNJ3Nn2wuNF8mX2SX1GbwOyOL7Eem9lIrVTaoxCf97L4aEVLW2U6yhHpsR0JUQSqaT8kQjj3tNa9P52fMT5joFCpLUWDxxbAS5CVm8bf+QmAgV6egPI5QowQWP8Lzne1t/FZ1Jy7bMbec0ylmCkskn/GYdI6t/SVZbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb395889-a90f-f571-0fbc-79dc1278d019@suse.com>
Date: Thu, 9 Feb 2023 08:57:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Julien Grall <julien@xen.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Rahul Singh <rahul.singh@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1675829866.git.demi@invisiblethingslab.com>
 <32fae62c9eb9e9536d49fdd28e1bf54430842023.1675829867.git.demi@invisiblethingslab.com>
 <3f3c358e-02b9-94e0-0b06-8a96ff92519b@suse.com>
 <1770bab7-3e25-d611-1d3f-58c02a2f7492@xen.org> <Y+P6yJw2qWgMrSUi@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y+P6yJw2qWgMrSUi@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 267677b3-d964-491b-fc16-08db0a7355a7
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CCwUjHQovCBs2kxPcTCr1g6ZTYSIcl9j1P4bgYr6bEPinUBoN4miUws6NHeDGtyLx9jjJ4kadMdZvo9dCfwwk57LOhgPzcVliycgnM8WpKtDDz3pWaTkCrSjikmWybCvlSrJesB2PCRa/8Tj3nimmSPyYFnsvNsx/z86kYL6+7aL8W1GiCl+R5q0AtHTqSZG2K4m6zg5mjUl3BZhZU7s9lMmxlJJ0vPzSuLkrnibzHkQbhJ5vWwaHIfmW6KYhvN4Nb2Fgrardbz9SjngVBbyxYwP/Yxv4Q7X5dX/LoW+QjrDIZLF1U03Wpd/e2kMnvJzvs8k3oGzFk9IQR0N9CGPvqpjTVrlYe/HttYzsEl8eRg5U6lZXJlRPY3eOf5QTVKh/EnNhLqcgqg0UAT0kmnmEJCsz3bbDYwHHcJwCnpQyDt2NSFLLdi+sZ3BaivJ7cO/UEzhBm0KIwarHBJWQj5CsD3NrTzLD8xRbC8KtAzr6AFHT63tstFuoS8pqH7HB+KFk5FaojTW9TMeb+JXf9D+aLUsmIkVqUPpZXZcEVvV+pwBhaEQbaqOvjF9Q9mNPfVTQbg7mFr0lAEL91Yg5VFCMJK+XEIfxPXf1BRR2Sk2qILPZnhfvF+ApzO2jYI/iZRZxPImi3nA2RBCKF6cw0R4bzpUkvnpSxg1aKtxzmWoriEKcNiPLk/9a2KggwKezxtsB84yBgopmDYOU2AbKelEW4/JFDbtK63gSQI5qtFrIDCfM7yKWCZTqtUdX6aWYckIbd8BowainyZrQG4Ct7oyss2DVN52i3LOlvnChj2C4U8NLgT6DxfSPwMsto0iQc0O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199018)(478600001)(6486002)(966005)(2906002)(26005)(186003)(6666004)(6512007)(53546011)(6506007)(41300700001)(8936002)(66556008)(66476007)(66946007)(8676002)(4326008)(7416002)(110136005)(316002)(54906003)(5660300002)(38100700002)(36756003)(31696002)(86362001)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXlGcmphcDF2Wk45bXo1TVdVRU5BZFpxZEtOdVpCR3VXTE9yZFVkVVRVRWc2?=
 =?utf-8?B?a1ZGUTRxMEdGODJoanRtOWhrT3Z4eGw1N3F4WkRpa0dmRzNJTHlWYytrTjdX?=
 =?utf-8?B?QS9sZkVuaXF6aEk0L1U4dVJES201ajU1WU9JMWhDc1hCc0FEYUVxaWdUc0Rr?=
 =?utf-8?B?RzFQZnloYjdOTXhQK2FlZkRjSyt2emFBeEFkU0NxM3VxOTE2d1RSdGI4SVhE?=
 =?utf-8?B?YVo2RzNBZ1BveEZHNnZXYXB0ckFVU1R0dktOZldLODVidDd2YnhENmNBbDhL?=
 =?utf-8?B?M1o5eHVZZEJEY0tCaDdGd0wwWGxpWnJvQk9oK2VhUnJ2TUVCbTBhV2xkcWdo?=
 =?utf-8?B?d3I2ZFlIbTFRUXRjeU1OSis2dFlIdDdteDhMbHIrdUV0REY1bEFYYjBPbCsw?=
 =?utf-8?B?Y3NETDhYdDRJbGNSTzNPR2x4MlZ4SGR0bk5wVTJFeTBXSFlVSFlXWm43cWJG?=
 =?utf-8?B?NlB5dzd0b2ZnQW9TMUY5Vjh0NTZoeTNDUm9aTU13NnlMd3BGT3dxL05xTDY3?=
 =?utf-8?B?TXdibWw3ZTZnb0VQOW1HQmR3WXNobHJEUytaNXE4eTNKMkNaakgyNzUxbkVC?=
 =?utf-8?B?L3ZkWHdBQzRXc0ZNYkxHc1lJSjd1Z1JUcEVrbFRsd25yeS9Ga2c4b0o5OC93?=
 =?utf-8?B?VTBBNEwzUnJycEFHS0t6WkdzTVdPUE9nalVrSEN1bWNZQUd5Z3E4NHpaTkRw?=
 =?utf-8?B?MEhHL3dWUForZi9ST3ZycjNWRUZwSVRSNmR0SkFGd2R3QWdTdXF4V0RWS0ll?=
 =?utf-8?B?LzEranNNbWhPMzF4cVZhZmpPaTZkS0RaV0RFRVVDNmYycGN1NmpJdDh4K0w5?=
 =?utf-8?B?ZmN6eUZxTC9XK2FxQlhyZ2FHNFNTZHdKOEx3MW5iSEJkMkVMZW93bU1LK1dL?=
 =?utf-8?B?eTBQbjRRSjNmWTdvVFBQaFdxcG5NeUZNSzBJYlMwZzRabTBqRGNqUlczYmo2?=
 =?utf-8?B?Y0kvK0dCZThiVEpFbjQzM3RtTHRrWWVIcDhrbGdlaExGK0VXYU9UMXZHRXNE?=
 =?utf-8?B?eHJJSFFTcHhXMmRXMlRteDk2TGw5TFkvU1REZWtYSTRhRkJ1TFQ2Nkw2SGt6?=
 =?utf-8?B?ZW1nZlFDRlVIYnRGeGJXT084WXhNOHRFUENtYzIzVkFaR3RncVhZbXhlOElu?=
 =?utf-8?B?TW93Yjk3S2JULzgwU3pEZnZoMDhkNnp0MEJlaUFIOVRQT3pVVHp2U0JvV2J1?=
 =?utf-8?B?Z2JGMGN1T2RuUDNPZ0tPdGsrd0doTlk4SW5mcEhCcElrVm43YWJtb1ltL3hY?=
 =?utf-8?B?cTZEekh2Sm1GVUlwQU9lTlBzV0hVRDNLT2hIalY4NXJGNHVQamVOVTY5d3hk?=
 =?utf-8?B?OU9XY21IVnFxZVYrQTZ0ZWMvcE9iMW9PUTNETU5ZN0JpS1plMTN4OWMzYk1T?=
 =?utf-8?B?ZWZLQTljRm5BVFNvcERRMXlRaVZ0RUpnRmJGMGVvMnFEblBmR2JubjdZK2g0?=
 =?utf-8?B?aktLdERVVzBjUXoyelhLSTlqR0E5UXY0TzBJWTlqYVFpbzg2QzR6Y2c3SjEw?=
 =?utf-8?B?N1U4Q0RzdjcyT3ZFSWIxdHhOaTBORlRZTjYyNWxrWHNveFhsdUlJZlZVM3Br?=
 =?utf-8?B?dVl0RE5WRlJ5RnJtRlM0YXRKdUpkYllNbGZTV3FmbTE5YTU1bGhRdnIvSzUw?=
 =?utf-8?B?Mll2TE5SbFBhTFdDelN2c0FTVUdpRUozazZrQ21JWTdZaVZ2ZDBuTTZNMGkz?=
 =?utf-8?B?anE5ZGRUWEFFSG5QZStqZHlVdmZVczdIU3BoRGJIaG85eWZIZmVOc0FFVDY4?=
 =?utf-8?B?ZUpMOVBEa29PTDUvNDdFL09ENGZocGl2dmlWTmNpRUpqU0tlSHpHUmloMFVN?=
 =?utf-8?B?bm5tUTBUc0Ewb2d5MFJ1SEpXK0RyYnNXNTlGWWxNYXF2emlOUi9NemgwRjI5?=
 =?utf-8?B?bEl2VURuTFdXMEJyUEtuWDB6bHJ6MGFlckFrZDNSZFp2V3kvcWc1SWsyMFpa?=
 =?utf-8?B?TGJRYjYrelp4a1RBZHBIeVBMckkxcWxjdkxMTXczNjJiRWg2U0lNdVl6TExQ?=
 =?utf-8?B?RWVvd0dGVjhhV1JXMUQzS0pyTTlnVXBCWG5KY3pYTjBQZEN6a3N6VFVxZXhK?=
 =?utf-8?B?OEVaVkc1K1ZuaGlObkQrZGhoVzFnSUpwblF1Kzg1Ui9RUjYwTlpSTTY5WE16?=
 =?utf-8?Q?KnRHXujtSVYZlniSKwCZWYtrQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267677b3-d964-491b-fc16-08db0a7355a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 07:57:48.0771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQdkVB8lOulPJe214wV+T1jy1K+b7kEAvVmLNiOxBC5PpVrM1KabMup7VAbTftrnFGIknr/pySq2LCIQQ/QESQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798

On 08.02.2023 20:19, Demi Marie Obenour wrote:
> On Wed, Feb 08, 2023 at 08:26:37AM +0000, Julien Grall wrote:
>> On 08/02/2023 07:40, Jan Beulich wrote:
>>> On 08.02.2023 05:51, Demi Marie Obenour wrote:
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -11,7 +11,7 @@
>>>>    * more details.
>>>>    *
>>>>    * You should have received a copy of the GNU General Public License along with
>>>> - * this program; If not, see <http://www.gnu.org/licenses/>.
>>>> + * this program; If not, see <https://www.gnu.org/licenses/>.
>>>>    */
>>>>   #include <xen/sched.h>
>>>
>>> At the example of this file: While the above matches $subject, ...
>>>
>>>> @@ -285,14 +285,14 @@ static void apply_quirks(struct pci_dev *pdev)
>>>>            * Device [8086:2fc0]
>>>>            * Erratum HSE43
>>>>            * CONFIG_TDP_NOMINAL CSR Implemented at Incorrect Offset
>>>> -         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html
>>>> +         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html
>>>>            */
>>>>           { PCI_VENDOR_ID_INTEL, 0x2fc0 },
>>>>           /*
>>>>            * Devices [8086:6f60,6fa0,6fc0]
>>>>            * Errata BDF2 / BDX2
>>>>            * PCI BARs in the Home Agent Will Return Non-Zero Values During Enumeration
>>>> -         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html
>>>> +         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html
>>>>           */
>>>>           { PCI_VENDOR_ID_INTEL, 0x6f60 },
>>>>           { PCI_VENDOR_ID_INTEL, 0x6fa0 },
>>>
>>> ... this doesn't (and would rather belong in the earlier patch).
>>>
>>> As to $subject: Wouldn't it be more logical to replace the license boiler
>>> plates by SPDX headers instead? This was done to some degree on Arm
>>> already, but I haven't gone check why it was done incompletely there.
>>
>> Skimming through xen-devel, it sounds like it was most likely a lack of
>> time. I think it would be a good idea here to switch to SPDX.
>>
>> That said, I can appreciate that Demi may not want to take on that works. So
>> I would be happy to give a try if no-one else wants to.
> 
> Should I drop this patch then?  I don’t have time for the SPDX change,
> sorry.

My view is: Yes, except for the part(s) which don't fit $subject and which hence
belong elsewhere. It makes little sense to me to touch text we mean to fully
replace anyway.

Jan

